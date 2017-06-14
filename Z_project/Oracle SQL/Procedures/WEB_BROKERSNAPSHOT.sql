CREATE OR REPLACE PROCEDURE web_brokerSnapshot(
   pBrokerId IN VARCHAR2, 
   pClue IN VARCHAR2, 
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR 
      WITH commission AS(
         SELECT me.employerId,
            MAX(ml.logdate) logDate,
            SUM(me.commissionAmount) commission
         FROM monthend me 
         JOIN monthend_log ml ON 
            me.monthend_seq = ml.monthend_seq AND 
            ml.logdate = '01-JAN-2017' --TRUNC(SYSDATE,'MM') first of last month
         GROUP BY me.employerId),
      newAR AS (
         SELECT a.employerId, 
            SUM(a.amount) invoiceAmount, 
            SUM(a.paymentAmt) paid
         FROM ar_v a
         JOIN brokerEmployer b on 
            a.employerId=b.employerId
         WHERE b.brokerId=pBrokerId
         GROUP BY a.employerId)   
      SELECT be.employerId,
         er.name, 
         er.addressOne address, 
         er.city, 
         er.state,
         er.zip,
         er.mailContact contact,
         er.phoneNbr,
         er.mailEmail email,
         ih.denormAmt invoiced, --invoiced this month
         p.paid, --sum of payments received this month
         ih.invoiceDate,
         c.commission, --commission as of the first of this month
         ar.invoiceAmount-ar.paid outstanding,
         ih.invoiceNbr
      FROM brokerEmployer be
      JOIN employer er ON 
         be.employerId=er.employerId  
      JOIN commission c ON 
         be.employerId=c.employerId
      JOIN invoiceHeader ih ON 
         be.employerId=ih.employerId AND 
         ih.invoicedate=c.logDate
      JOIN arPaymentTotal p ON 
         be.employerId=p.employerId AND 
         c.logDate=p.paymentMonth
      JOIN newAr ar ON 
         be.employerId=ar.employerId
      WHERE be.brokerId = pBrokerId AND
         be.employerId > 0 AND
         (  pClue IS NULL OR 
            TO_CHAR(be.employerId)=pClue OR 
            UPPER(er.name) LIKE '%'||UPPER(pClue)||'%' OR 
            UPPER(er.addressone) LIKE '%'||UPPER(pClue)||'%' )
      ORDER BY 2;
END;
/

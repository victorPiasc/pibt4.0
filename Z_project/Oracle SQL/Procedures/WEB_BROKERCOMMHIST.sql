CREATE OR REPLACE PROCEDURE web_BrokerCommHist(
   pBroker IN VARCHAR2, 
   pClue IN VARCHAR2, 
   v_refcur OUT SYS_REFCURSOR)
AS 
BEGIN 
   OPEN v_refcur FOR   
      WITH commHist AS(
         SELECT be.employerId, 
            ml.logDate, 
            SUM(me.commissionAmount) commission
         FROM brokerEmployer be
         JOIN monthEnd me ON 
            be.employerId=me.employerId 
         JOIN monthend_log ml ON 
            me.monthend_seq=ml.monthend_seq
         JOIN employer er ON 
            be.employerId=er.employerId      
         WHERE be.brokerId=pBroker AND
            be.employerId > 0
         GROUP BY be.employerId, ml.logdate)   
      SELECT c.employerId,
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
         c.commission,
         ih.invoiceDate,
         p.paymentMonth,
         ih.invoiceNbr
      FROM commHist c
      JOIN employer er ON 
         c.employerId=er.employerId
      JOIN arPaymentTotal p ON 
         c.employerId=p.employerId AND 
         c.logDate=p.paymentMonth
      JOIN invoiceHeader ih ON 
         c.employerId=ih.employerId AND 
         p.paymentMonth=ih.invoiceDate
      WHERE c.employerId > 0 AND
         (  pClue IS NULL OR 
            TO_CHAR(c.employerId)=pClue OR 
            UPPER(er.name) LIKE '%'||UPPER(pClue)||'%' OR 
            UPPER(er.addressone) LIKE '%'||UPPER(pClue)||'%' )
      ORDER BY 13 desc, 2;
END;
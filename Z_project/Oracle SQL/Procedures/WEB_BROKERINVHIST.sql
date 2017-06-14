CREATE OR REPLACE PROCEDURE web_brokerInvHist(
   pBrokerId IN VARCHAR2, 
   pClue IN VARCHAR2,
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN 
   OPEN v_refcur FOR      
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
         p.paymentMonth,
         ih.invoiceNbr
      FROM brokerEmployer be
      JOIN employer er ON 
               be.employerId=er.employerId  
      JOIN arPaymentTotal p ON 
         be.employerId=p.employerId
      JOIN invoiceHeader ih ON 
         be.employerId=ih.employerId AND 
         p.paymentMonth=ih.invoiceDate
      WHERE be.brokerId = pBrokerId AND
         be.employerId > 0 AND
         (  pClue IS NULL OR 
            TO_CHAR(be.employerId)=pClue OR 
            UPPER(er.name) LIKE '%'||UPPER(pClue)||'%' OR 
            UPPER(er.addressone) LIKE '%'||UPPER(pClue)||'%' )
      ORDER BY p.paymentMonth desc, 2;
END;            
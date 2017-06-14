CREATE OR REPLACE PROCEDURE web_getSingleInvoice(
   pInvoiceNbr IN VARCHAR2,
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN 
   OPEN v_refcur FOR
      SELECT er.employerId,
         er.name, 
         er.addressOne address, 
         er.city, 
         er.state,
         er.zip,
         er.mailContact contact,
         er.phoneNbr,
         er.mailEmail email,
         ih.invoiceDate, 
         ih.dueDate, 
         i.employeeId,
         me.memberId,                              --No nvl because Monthend has correct memberid
         NVL(dep.lastname,m.lastname) lastName,    --use dep name first if exist
         NVL(dep.firstname,m.firstname) firstName, --use dep name first if exist
         DECODE(NVL(dep.employeeType, m.employeeType),0,'Emp', 1,'Spouse',2,'Child','Dom. Partmer') employeeType,
         i.planTierId,
         i.planId,
         p.planName,
         pt.description,
         me.effectiveDate,         
         i.amount,
         me.commissionAmount 
      FROM invoiceHeader ih
      JOIN invoiceDetail i ON 
         ih.invoiceNbr=i.invoiceNbr      
      JOIN monthend_log ml ON
         ml.logDate=ih.invoiceDate    
      JOIN monthend me ON 
         ml.monthend_seq = me.monthend_seq AND
         ih.employerId=me.employerId AND
         i.employeeId=me.employeeId AND 
         i.planId=me.planId AND
         i.planTierId=me.piaPlanTierId             --invoice detail does not save memberId
      JOIN employer er ON 
         ih.employerId=er.employerId
      JOIN member m On 
         i.employeeId=m.memberId                   --employees
      LEFT JOIN member dep ON 
         me.memberId = dep.memberId AND            --dependents
         me.memberId<>me.employeeId
      JOIN plans p ON 
         i.planId=p.planId 
      JOIN planType pt ON 
         p.planTypeId=pt.planTypeId            
      WHERE ih.invoiceNbr=pInvoiceNbr
      ORDER BY p.planTypeId, 14,15,12,16;
END;

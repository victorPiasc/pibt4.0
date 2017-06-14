CREATE OR REPLACE PROCEDURE web_getBrokerQuotes(
   pBrokerId IN VARCHAR2, 
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR
      SELECT er.cart,
         MAX(companyName) name, 
         MAX(zip) zip,  
         SUM(CASE WHEN wc.employeeTypeId=0 THEN 1 ELSE 0 END) ee,
         SUM(CASE WHEN wc.employeeTypeId<>0 THEN 1 ELSE 0 END) dep,
         CASE WHEN MAX(er.employerId) IS NOT NULL THEN 'Renewal' ELSE 'New' END isRenewal,
         MIN(wc.createdDate) dateGen  
      FROM web_qqEmployer er
      JOIN web_qqCart wc ON
         er.cart=wc.cart
      WHERE er.brokerId=pBrokerId AND 
         er.isSaved='Y'
      GROUP BY er.cart;         
END;   
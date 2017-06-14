CREATE OR REPLACE PROCEDURE PIA_ADMIN.WEB_UPDATEEMPLOYERADDINFO(
   pEmployerId IN VARCHAR2,
   pEmployeeContribution IN VARCHAR2,
   pDependentContribution IN VARCHAR2,
   pEmployeeDollar IN VARCHAR2,
   pDependentDollar IN VARCHAR2,
   pOfBase IN CHAR)
AS
BEGIN
    UPDATE employer
        SET 
            contribution  = pEmployeeContribution,
            contributiondep = pDependentContribution,
            dollar = pEmployeeDollar,
            dollardep = pDependentDollar,
            ofBase = pOfBase
        WHERE
            employerId = pEmployerId;
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE PIA_ADMIN.WEB_GETPLANTYPECONTRIBUTION
(
    pEmployerid IN VARCHAR2,
    v_refcur OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN v_refcur FOR
    SELECT 
        planTypeId,
        contribution,
        contributionDep,
        startDate,
        ofBase
    FROM 
        EMPLOYERPLANTYPE
    WHERE 
        employerid = pEmployerid AND 
        planTypeId NOT IN(5,6,7,9,10,11)
        ORDER BY planTypeId;
END;
/

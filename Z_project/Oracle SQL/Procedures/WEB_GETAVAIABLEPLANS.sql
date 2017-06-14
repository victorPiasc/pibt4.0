CREATE OR REPLACE 
PROCEDURE Web_GetAvaiablePlans
(   Pplantypeid In Varchar2,
    pEmployerId In varchar2,
    Puserrole In Number,
    pUserId in varchar2,
    V_Refcur Out Sys_Refcursor
 )
AS
BEGIN
-- pUserRole: 0-Administrator 1-Agent; 2-Relationship Keeper; 3-Employer
  IF Puserrole=0 THEN
    OPEN v_refcur FOR 
    SELECT 
       v1.Carriername, 
       v1.Employerid, 
       v1.Monthin, 
       v1.Planid, 
       v1.Plantypeid, 
       v1.Planname 
    FROM 
       Web_Ercurrentplans_V V1
    WHERE 
       (V1.Employerid = pEmployerId or pEmployerId='' or pEmployerId is null) And 
       V1.Plantypeid = pPlanTypeId;
    RETURN;
  ELSIF PUSERROLE=1 THEN
    OPEN v_refcur FOR 
    SELECT 
       v1.Carriername, 
       v1.Employerid, 
       v1.Monthin, 
       v1.Planid, 
       v1.Plantypeid, 
       v1.Planname 
    FROM 
       Web_Ercurrentplans_V V1, 
       Web_Enrolleremployer_V V2
    WHERE 
       v2.UserId=pUserId and 
       V1.Employerid = V2.Employerid and 
       ( V1.Employerid = pEmployerId or pEmployerId='' or pEmployerId is null) And 
       V1.Plantypeid = pPlanTypeId;
    RETURN;
  ELSIF Puserrole=2 THEN
    OPEN v_refcur FOR 
    SELECT 
       v1.Carriername, 
       v1.Employerid, 
       v1.Monthin, 
       v1.Planid, 
       v1.Plantypeid, 
       v1.Planname 
    FROM 
       Web_Ercurrentplans_V V1, 
       Web_Crsemployer_V V2
    WHERE 
       v2.UserId=pUserId and 
       V1.Employerid = V2.Employerid and 
       ( V1.Employerid = pEmployerId or pEmployerId='' or pEmployerId is null) And 
       V1.Plantypeid = Pplantypeid;
    RETURN;
  ELSIF Puserrole=3 THEN
    OPEN v_refcur FOR 
    SELECT 
       v1.Carriername, 
       v1.Employerid, 
       v1.Monthin, 
       v1.Planid, 
       v1.Plantypeid, 
       v1.Planname 
    FROM 
       Web_Ercurrentplans_V V1
    WHERE 
       V1.Employerid = pEmployerId And 
       V1.Plantypeid = pPlanTypeId;
    RETURN;
  ELSE 
     Null;
     RETURN;
  END IF;
END;
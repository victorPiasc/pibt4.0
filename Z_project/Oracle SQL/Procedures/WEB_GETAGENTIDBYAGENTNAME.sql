CREATE OR REPLACE
PROCEDURE WEB_GETAGENTIDBYAGENTNAME
(
   pName IN Varchar2,
   v_refcur OUT Sys_Refcursor
)
AS
 BEGIN
  OPEN v_refcur FOR
   SELECT 
	ei.Name,
	ei.EnrollerId
   FROM
    enrollerInfo ei
   WHERE
    ei.Name = pName   
   GROUP BY
	ei.Name;
END;
RETURN;

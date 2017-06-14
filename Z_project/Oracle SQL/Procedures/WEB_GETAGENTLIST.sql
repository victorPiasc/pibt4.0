CREATE OR REPLACE
PROCEDURE Web_GetAgentList
(
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
group by
	ei.Name
END;
RETURN;

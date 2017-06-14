CREATE OR REPLACE
PROCEDURE Web_GetEnrollerList
(
   v_refcur OUT Sys_Refcursor
)
AS
 BEGIN
  OPEN v_refcur FOR
   SELECT
    enrollerid,
	name
   FROM
    enrollerinfo
END;

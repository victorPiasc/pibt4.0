CREATE OR REPLACE
PROCEDURE Web_GetEnrollerIdByWebName
(
   pWebName IN Varchar2,
   v_refcur OUT Sys_Refcursor
)
AS
 BEGIN
  OPEN v_refcur FOR
   SELECT 
      wu.WEBNAME,
      wu.userid,
      ei.enrollerid
   FROM
     enrollerInfo ei,
     web_users wu
   WHERE
      ei.userid = wu.userid and
      wu.webName = pWebName;
END;
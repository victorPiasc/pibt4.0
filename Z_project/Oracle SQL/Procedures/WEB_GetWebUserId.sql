CREATE OR REPLACE PROCEDURE WEB_GETWEBUSERID 
(
  pLoginName IN VARCHAR2  
, V_Refcur Out Sys_Refcursor
) AS 
Begin
   Open V_Refcur For 
  Select UserId From Web_Users Where WebName=pLoginname;
END WEB_GETWEBUSERID;
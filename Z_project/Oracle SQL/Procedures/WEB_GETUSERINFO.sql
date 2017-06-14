create or replace 
PROCEDURE WEB_GETUSERINFO 
(
  PUSERID IN VARCHAR2  
, V_Refcur Out Sys_Refcursor
) AS 
BEGIN
  Open V_Refcur For 
    Select 
    U.Userid,
    U.Agencyid,
    Wu.Webname Loginname, 
    U.Username,
    U.Updated,
    U.Updatedby,
    U.Emailaddress
    From Users U
    Left Join Web_Users Wu
      on U.UserId = Wu.userId
    Where U.Userid=Puserid and U.Lockedout='N';
END WEB_GETUSERINFO;
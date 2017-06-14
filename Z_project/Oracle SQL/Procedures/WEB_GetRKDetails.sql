CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETRKDETAILS"
(
Puserid In Varchar2,
pRKId in varchar2,
v_refcur OUT SYS_REFCURSOR )
AS
Begin
    open v_refcur for
    Select
    Ci1.Csrid,
    U.Username,
    Fn_Getwebusername(3,ci1.Userid) Loginname,
    ci1.EXTENSION,
    U.EMAILADDRESS,
    Ci1.Cobrarep,
    Decode(ci1.Active, 'Y', 'true', 'N', 'false') Active,
    ci1.USERID,
    ci1.LEADERID,
    ci1.name || ' Ext. x'||ci1.extension RK,
    ci2.name || ' Ext. x'||ci2.extension TeamLead,
      Wu.WebName LoginName,
      Wu.Islockout,
      Wu.Lastloginip,
      Wu.Lastlogintime,
      Wu.Updated,
      Wu.Updatedby
    From
      Csrinfo Ci1
    Inner Join  Csrinfo Ci2 On Ci1.Leaderid = Ci2.Csrid
    Inner Join  Users U On U.Userid=Ci1.Userid
    Left Join Web_Users Wu On Ci1.Userid=Wu.Userid And Wu.Webuserroleid=3
    Where Ci1.Userid=nvl(Puserid,0) Or Ci1.Csrid=nvl(pRKId,0);
End;
/

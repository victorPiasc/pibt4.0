create or replace 
PROCEDURE WEB_GetCSRDetails
(
pUserId in varchar2,
v_refcur OUT SYS_REFCURSOR )
AS
Begin
  Begin
    open v_refcur for 
    Select  
    Ci1.Csrid, 
    U.Username,
    Fn_Getwebusername(3,ci1.Userid) Loginname,
    ci1.EXTENSION,
    ci1.EMAILADDRESS,
    Ci1.Cobrarep,
    Decode(ci1.Active, 'Y', 'true', 'N', 'false') Active, 
    ci1.USERID,
    ci1.LEADERID,
    ci1.name || ' Ext. x'||ci1.extension RK,
    ci2.name || ' Ext. x'||ci2.extension TeamLead 
    From 
      Csrinfo Ci1,
      Csrinfo Ci2,
      Users U
    Where Ci1.Leaderid = Ci2.Csrid And U.Userid=Ci1.Userid And
        (Upper(ci1.Userid)=Upper(pUserId));
  End;
  Return;
End;
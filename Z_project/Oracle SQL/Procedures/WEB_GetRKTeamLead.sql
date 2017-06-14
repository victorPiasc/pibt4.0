create or replace 
PROCEDURE WEB_GetRKTeamLead
(
pCSRID in varchar2,
v_refcur OUT SYS_REFCURSOR )
AS
Begin
  Begin
    open v_refcur for 
    Select 
    ci2.name || ' Ext. x'||ci2.extension TeamLead 
    From 
      CsrInfo ci1,
      Csrinfo Ci2
    Where Ci1.Leaderid = Ci2.Csrid And Ci1.Csrid=pCSRID;
  End;
  Return;
End;
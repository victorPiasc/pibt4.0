create or replace 
PROCEDURE WEB_UPDATEUSERSTATUS 
(
  pUserid In Varchar2  
, Pstatus In Varchar2  
, pUserType IN Number  
) AS 
Begin
  --pUserType:1=EnrollerInfo(Agent); 2=CsrInfo(RK);
  If Pusertype=1 Then
  Update Enrollerinfo Set Active=Pstatus Where Userid=Puserid;
  elsif pUserType=2 Then 
  Update Csrinfo Set Active=Pstatus Where Userid=Puserid;
  Else Null;
  End If;
End WEB_UPDATEUSERSTATUS;
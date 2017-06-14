CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_VALIDATENEWWEBUSER"
(
  Puserid In Varchar2,
  puserroleid in varchar2,
  Ploginname In Varchar2,
  Poutmsg Out Varchar2
  --pEmailAddress out varchar2
) As
Presult Number;
Begin
  -- get email address
  --Select Emailaddress Into Pemailaddress From Users
  --  Where Upper(Userid) = Upper(Puserid) ;

    Select Count(1) Into Presult From Users
    Where Upper(Userid) = Upper(Puserid) And lockedout='Y';
    If(Presult>0) Then
      Poutmsg := 'The user ID is locked out.';
      RETURN;
    End If;

    Select Count(1) Into Presult From Users
    Where Upper(Userid) = Upper(Puserid);
    If(Presult=0) Then
      Poutmsg := 'The user ID does not exist in BMS.';
      RETURN;
    End If;


    Select Count(1) Into Presult From Web_Users
    Where Upper(Webname) = Upper(Ploginname);
    If(Presult>0) Then
      Poutmsg := 'The web user login name is being used';
      RETURN;
    End If;

    Select Count(1) Into Presult From Users
    Where Upper(Userid) = Upper(Puserid) And Webuserroleid=Puserroleid;
    If(Presult>0) Then
      Poutmsg := 'The user''s web account exist.';
      RETURN;
    End If;
    If Puserroleid = 2 Then
        Select Count(1) Into Presult From Users U, Enrollerinfo En
        Where U.userId=En.UserId and Upper(U.Userid) = Upper(Puserid);
        If(Presult=0) Then
          Poutmsg := 'The BMS user ID is not an Agent.';
          RETURN;
        End If;
    End If;   
    
    If Puserroleid = 3 Then
        Select Count(1) Into Presult From Users U, Csrinfo Csr
        Where U.userId=Csr.UserId and Upper(U.Userid) = Upper(Puserid);
        If(Presult=0) Then
          Poutmsg := 'The user ID is not a RK.';
          RETURN;
        End If;
    End If;       
  
  -- validated
    Poutmsg := '1';

End;
/

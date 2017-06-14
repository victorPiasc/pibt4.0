CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_SYNMEMBERWEBUSERSTABLE"
(
 Pemployerid Varchar2,
 PUpdatedBy varchar2
)As
  Varcount Number(8,0);
  Varmemberid Number(8,0);
  VarEmployeeType Number(1,0);
  Type Cur_Type Is Ref Cursor;
  Crs_Er Cur_Type;
Begin
 Open Crs_Er For
              Select Memberid,EmployeeType From Member
              Where Employerid=Pemployerid;
     Fetch Crs_Er Into Varmemberid,VarEmployeeType;
     While Crs_Er%Found Loop
     If Varemployeetype=0 Then
     Begin
         Select Count(1) Into Varcount From Web_Users
         Where Webuserroleid=5 And MemberId=Varmemberid;
         If Varcount =0  Then
            Web_Insertwebuser(
              Pwebuserroleid => 5,
              Pwebname => null,
              Puserid => null,
              PEMPLOYERID => null,
              Pemployeeid => Varmemberid,
              Pmemberid => Varmemberid,
              pBrokerId=> null,
              Pupdatedby => PUpdatedBy
            );
         End If;
     End;
     else
        Select Count(1) Into Varcount From Web_Users
         Where Webuserroleid=6 And MemberId=Varmemberid;
         If Varcount =0  Then
            Web_Insertwebuser(
              Pwebuserroleid => 6,
              Pwebname => null,
              Puserid => null,
              Pemployerid => Null,
              Pemployeeid => null,
              Pmemberid => Varmemberid,
              pBrokerId => null,
              Pupdatedby => PUpdatedBy
            );
         End If;
     end if;
    Fetch Crs_Er Into Varmemberid,VaremployeeType;
    End Loop;
    close Crs_Er;
 commit;
end;
/

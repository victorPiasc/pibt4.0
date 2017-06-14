CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_SYNAGENTWEBUSERSTABLE"
(
 PUpdatedBy varchar2
)As
  Varcount Number(8,0);
  Varuserid varchar2(10);
  Type Cur_Type Is Ref Cursor;
  Crs_Er Cur_Type;
Begin
 Open Crs_Er For
              Select U.Userid From Users U
                Inner Join Enrollerinfo En
                  On U.Userid=En.Userid where U.WebUserRoleid is null;
     Fetch Crs_Er Into Varuserid;
     While Crs_Er%Found Loop
     Select Count(1) Into Varcount From Web_Users Where Webuserroleid=2 And UserId=Varuserid;
     If Varcount =0  Then
        Web_Insertwebuser(2, null, Varuserid, null, null, null, null,PUpdatedBy);
     end if;
    Fetch Crs_Er Into Varuserid;
    End Loop;
    close Crs_Er;
end;
/

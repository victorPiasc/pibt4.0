create or replace 
FUNCTION FN_GETWEBUSERNAME 
(
  PROLEID IN VARCHAR2  
, POBJID IN VARCHAR2  
) Return Varchar2 
As 
varName varchar2(20);
Begin
  Select wu.Webname
  Into Varname
  From Web_Users Wu
  Where Wu.Webuserroleid=Proleid And (Wu.Userid=Pobjid Or 
  Wu.Employerid=Pobjid Or 
  Wu.Employeeid=Pobjid Or 
  wu.MemberId=Pobjid);
  RETURN Varname;
END FN_GETWEBUSERNAME;
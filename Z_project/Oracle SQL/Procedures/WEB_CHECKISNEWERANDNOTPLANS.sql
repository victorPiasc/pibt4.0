create or replace 
PROCEDURE WEB_CheckIsNewERAndNotPlans
(pEmployerId in VARCHAR2,
 v_return OUT Varchar2)
AS
varCount number;
BEGIN
    v_return := 'false';
    
    select count(1) into varCount from employerplan where epmid= pEmployerId; 
     
    if varCount=0 then
      v_return := 'true';
    end if;
    
    Exception
    When No_Data_Found Then 
    begin
    v_return := 'true';
    end;
END;
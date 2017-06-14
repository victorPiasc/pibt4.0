create or replace 
function Fn_CheckIsNewBornAndNotPlans
(pMemberId in VARCHAR2)
return varchar2
AS
v_return varchar2(10);
varCount number;
BEGIN
    v_return := 'false';
     
    select count(1) into varCount from memberplan where memberid=pMemberId;
    
    if varCount=0 then
      v_return := 'true';
    end if;
    
    return v_return;
END;
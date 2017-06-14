CREATE or REPLACE 
FUNCTION Fn_CheckIsNewMarryAndNotPlans
(
   pMemberId in VARCHAR2
)
RETURN varchar2
AS
   v_return varchar2(10);
   varCount number;
BEGIN
    v_return := 'false';
     
    SELECT count(1) INTO varCount FROM memberplan WHERE memberid=pMemberId;
    
    IF varCount=0 THEN
       v_return := 'true';
    END IF;
    
    RETURN v_return;
END;
create or replace 
PROCEDURE WEB_GetTerms
(v_refcur OUT SYS_REFCURSOR )
AS
Begin
  Begin
    open v_refcur for 
    Select  
    TermId, 
    Description
    From Terms;
  End;
  Return;
End;
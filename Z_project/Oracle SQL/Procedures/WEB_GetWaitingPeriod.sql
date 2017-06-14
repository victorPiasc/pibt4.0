Create or Replace PROCEDURE WEB_GetWatingPreiod
(v_refcur OUT SYS_REFCURSOR )
AS
Begin
  Begin
    open v_refcur for 
    Select  
    WaitingPeriodId, 
    Description
    From WaitingPeriod;
  End;
  Return;
End;
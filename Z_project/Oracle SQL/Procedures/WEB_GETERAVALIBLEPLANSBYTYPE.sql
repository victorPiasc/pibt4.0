create or replace 
Procedure Web_Geteravalibleplansbytype
(
  pPlanTypeId in varchar2,
  V_Refcur Out Sys_Refcursor
  )
As
Begin
    Open V_Refcur For
       Select 
       Carriername, 
       Planid, 
       Planname, 
       Plantypeid 
       From Web_Eravailableplans_V 
       WHERE (PLANTYPEID = pPlanTypeId);
end;
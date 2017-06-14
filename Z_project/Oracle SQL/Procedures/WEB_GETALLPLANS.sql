create or replace 
Procedure Web_GetAllPlans
(
 pPlanTypeId varchar2,
 V_Refcur Out Sys_Refcursor
 )
As
Begin
 Open V_Refcur For 
    Select  P.Planid, P.Planname, c.name CarrierName  
    From Plans P,
    Carrier C
    Where C.Carrierid=p.Carrierid and (p.Plantypeid = pPlanTypeId Or pPlanTypeId='' Or pPlanTypeId Is Null);
end;
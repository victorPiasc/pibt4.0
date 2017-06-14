create or replace 
Procedure Web_GetErcustomeplans
(
 pEmployerId In varchar2,
 pSide In Varchar2,
 V_Refcur Out Sys_Refcursor
 )
As
Begin
    Open V_Refcur For
        Select Planname, Effective, Expiry, Planid 
        From Web_Ercustomeplans_V 
        WHERE ((SIDE = upper(pSide)) AND (EMPLOYERID = pEMPLOYERID));
end;
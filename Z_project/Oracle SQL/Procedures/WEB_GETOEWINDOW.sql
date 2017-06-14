create or replace 
Procedure Web_GetOEWindow
(
 pEmployerId in varchar2,
 V_Refcur Out Sys_Refcursor
 )
As
Begin
Open V_Refcur For 
  SELECT 
  ow.ID,
  ow.EMPLOYERID,
  Nvl(Er.Name,'') Employername,
  ow.Isrenew,
  ow.Oefrommonth,
  ow.OETOMONTH,
  ow.Planeffectivedate,
  Ow.Created,
  Ow.Createdby,
  Ow.Modified,
  ow.MODIFIEDBY
FROM OE_WINDOW ow
left join Employer er
On Ow.Employerid=Er.Employerid
where 
(Instr(To_Char(ow.EMPLOYERID),pEmployerId)=1 Or pEmployerId='' Or pEmployerId Is Null);
End;
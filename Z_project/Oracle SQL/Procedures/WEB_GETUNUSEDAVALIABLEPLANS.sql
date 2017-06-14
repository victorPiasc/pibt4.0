CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETUNUSEDAVALIABLEPLANS"
(
pPlanTypeId in varchar2,
pEmployerId in varchar2,
pEmployeeId in varchar2,
 v_refcur out sys_refcursor
 )
As
Begin
open v_refcur for
   SELECT distinct
        c.name CarrierName,
        er.planid,
        p.planname,
        p.carrierid
      FROM
        WEB_EROPENENROLLMENTPLANS_V er
      Inner join plans p on er.planid=p.planid
      Inner join Carrier c on p.carrierid=c.carrierid
     Where
     er.employerid=pEmployerId and Er.Plantypeid=pPlanTypeId;
end;
/

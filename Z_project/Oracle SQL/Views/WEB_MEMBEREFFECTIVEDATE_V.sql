
  CREATE OR REPLACE FORCE VIEW WEB_MEMBEREFFECTIVEDATE_V
  AS
  select 
      memberid,
      m.employerId,
      m.employeeId ,
      employeetype,
      hiredate,
      case when hiredate>Trunc(hiredate,'mm') then
      Trunc(add_months(hiredate, wp.months+1),'mm') 
      else Trunc(add_months(hiredate, wp.months),'mm') 
      end HireEffectiveDate,
      m.BIRTHDATE,
      case when BIRTHDATE>Trunc(BIRTHDATE,'mm') then
      Trunc(add_months(BIRTHDATE, 1),'mm') 
      else Trunc(BIRTHDATE,'mm') 
      end BornEffectiveDate,
      m.MARRIAGEDATE,
      case when MARRIAGEDATE>Trunc(MARRIAGEDATE,'mm') then
      Trunc(add_months(MARRIAGEDATE, 1),'mm') 
      else Trunc(MARRIAGEDATE,'mm') 
      end MarryEffectiveDate
    from member m,
    employer er,
    waitingperiod wp
    where m.employerid=er.employerid and er.waitingperiodid=wp.waitingperiodid;
 

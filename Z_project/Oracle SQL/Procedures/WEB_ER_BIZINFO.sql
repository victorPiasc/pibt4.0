CREATE OR REPLACE PACKAGE BODY PIA_ADMIN."WEB_ER_BIZINFO" AS
   PROCEDURE WEB_GetBizInfoDetails
   (pEmployerID in Varchar2,
    cur_BizInfo OUT T_CURSOR )
   IS
      BEGIN
          open cur_BizInfo for 
          Select
              Er.Employerid,
              name            ,
              addressOne     ,
              addressTwo     ,
              city           ,
              state          ,
              zip            ,
              mailContact    ,
              mailEmail      ,
              billAddressOne ,
              billAddressTwo ,
              billCity       ,
              billState      ,
              billZip        ,
              Billcontact    ,
              billEmail,
              Wu.Webname LoginName,
              Decode (Wu.Webname, Null, 'false', 'true') "HasWebAccount",
              Decode (Wu.Islockout, 1, 'true', 'false') "Islockout",
              Wu.Lastloginip,
              Wu.Lastlogintime,
              Phonenbr,
              Faxnbr,
              TO_CHAR(Startdate, 'MM/DD/YYYY') StartDate,
              TO_CHAR(Enddate, 'MM/DD/YYYY') EndDate,
              er.agencyid,
              Ent.Description AgencyName
          From
             Employer Er
          Inner Join Enterprise Ent
            on Er.Agencyid=Ent.Agencyid
          Left Join Web_Users Wu
              On Er.EmployerId=Wu.EmployerId and Wu.WebuserRoleId=4
          Where
             Er.employerId = pEmployerID;
   END WEB_GetBizInfoDetails;

   PROCEDURE WEB_GetBizContacts
   (pEmployerID in Varchar2,
    cur_BizContacts OUT T_CURSOR )
   IS
      BEGIN
          open cur_BizContacts for 
          Select
             rowid,
             employerId   ,
             title        ,
             Lastname ||', '|| Firstname  Name,
             Lastname,
             Firstname,
             MiddleName,
             email        ,
             phone        ,
             fax          ,
             bizPhone1    ,
             bizExt1      ,
             bizPhone2    ,
             bizExt2      ,
             mobile       ,
             email2       ,
             assistant         
          FROM
             employerContacts 
          WHERE
             employerId = pEmployerID
          ORDER BY
             title,lastName;
   END WEB_GetBizContacts;

   PROCEDURE WEB_GetBizInfoDetails2
   (pEmployerID IN Varchar2,
    cur_BizInfo2 OUT T_CURSOR )
   IS
   BEGIN
      OPEN cur_BizInfo2 FOR 
         SELECT er.employerid,
            ei.enrollerid,
            ei.name enroller,
            wp.WaitingPeriodId,
            wp.description waitingPeriod,
            ci2.csrid TeamLeadId,
            ci2.name || ' Ext. '||ci2.extension TeamLead ,
            ci1.csrid RKId,
            ci1.name || ' Ext. '||ci1.extension RK ,
            t.termid,
            t.description term,
            er.contribution eeContribution,
            er.contributionDep DepContribution,
            er.dollar eeDollar,
            er.dollarDep DepDollar,
            er.taxid,
            er.sic,
            er.natureOfBiz,
            er.ofBase
         FROM  employer er
         JOIN terms t ON
            er.termId = t.termId
         JOIN waitingPeriod wp ON
            er.waitingperiodid = wp.waitingperiodid
         JOIN csrinfo ci1 ON
            er.csrId = ci1.csrid
         JOIN csrinfo ci2 ON 
            ci1.leaderid = ci2.csrid
         LEFT JOIN enrollerInfo ei ON
            er.enrollerid = ei.ENROLLERID 
         WHERE 
            employerId = pEmployerId;
   END WEB_GetBizInfoDetails2;

   PROCEDURE WEB_GetBizEeNames
   (pEmployerID in Varchar2,
    cur_BizEeNames OUT T_CURSOR )
   IS
      BEGIN
          open cur_BizEeNames for 
          SELECT 
            mp.employerId,
            m.memberId,
            m.lastName ||', '||m.firstName||' '|| m.middleName eeName 
          FROM
             memberPlan mp,
             member m
          WHERE
             mp.employerId = pEmployerID AND
             mp.memberId = mp.employeeId AND
             mp.memberid = m.memberid AND
             (TRUNC(sysdate) between mp.effectivedate and add_months(nvl(mp.expirydate,'31-dec-9999'),6) or        -- Plan expiryed 6 months ago
              mp.effectivedate > TRUNC(sysdate)) AND                                                               -- Include future plans
             nvl(mp.expirydate,'31-dec-9999') > mp.effectivedate                                        -- No negative plans
          GROUP BY
             mp.employerId,
             m.memberId,
             m.lastName ||', '||m.firstName
          ORDER BY
             eeName;
   END WEB_GetBizEeNames;

   PROCEDURE WEB_GetBizEeName
   (pEmployerID in Varchar2,
    pEmployeeID in Varchar2,
    cur_BizEeNames OUT T_CURSOR )
   IS
      BEGIN
          open cur_BizEeNames for 
          SELECT 
            m.employerId,
            m.memberId,
            m.lastName ||', '||m.firstName||' '|| m.middleName eeName 
          FROM
             member m
          WHERE
             m.employerId = pEmployerID AND
             m.memberId = pEmployeeId ;
   END WEB_GetBizEeName;

   PROCEDURE WEB_GetBizDepNames
   (pEmployeeID in Varchar2,
    cur_BizDepNames OUT T_CURSOR )
   IS
      BEGIN
          open cur_BizDepNames for 
          SELECT 
             m.memberId,
             lastName ||', '||firstName||' '|| m.middleName  depName 
           FROM 
             member m
           WHERE 
            m.employeeId <> m.memberId AND
            m.employeeid = pEmployeeID
           ORDER BY
             m.employeeType;
   END WEB_GetBizDepNames;

PROCEDURE WEB_GetBizMemberInfo (
   pMemberID IN VARCHAR2,
   cur_BizMemberInfo OUT T_CURSOR )
IS
BEGIN
   OPEN cur_BizMemberInfo FOR 
      SELECT m.employerId, 
         m.employeeId, 
         m.memberId,                                                            
         m.firstName||' '|| m.middleName||' '||m.lastName name, 
         m.employeeType  employeeTypeId,
         DECODE(m.employeeType,0,'Employee',1,'Spouse',2,'Child','Domestic Partner') employeeType,
         DECODE(m.male,'Y','Male','Female') gender,
         TO_CHAR(m.birthdate,'MM/DD/YYYY') birthdate,
         TO_CHAR(m.marriageDate,'MM/DD/YYYY') marriageDate,
         TO_CHAR(m.hireDate,'MM/DD/YYYY') hireDate,
         m.addressOne ||' '||m.addressTwo  address,                   
         m.city,                           
         m.state,                          
         m.zip,                            
         m.homePhoneNbr,                   
         m.workPhoneNbr,                   
         m.mobilePhoneNbr,                                            
         m.emailAddress ,                                                        
         m.handicapped,
         m.deptid,
         d.description deptname,
         TO_CHAR(m.adoptionDate,'MM/DD/YYYY') adoptionDate,
         CASE WHEN m.marriageDate IS NULL THEN 'style="display:none;"' END marriageDateHider,
         CASE WHEN m.hireDate IS NULL THEN 'style="display:none;"' END hireDateHider,
         CASE WHEN m.deptId IS NULL THEN 'style="display:none;"' END departmentHider,
         CASE WHEN m.adoptionDate IS NULL THEN 'style="display:none;"' END adoptionDateHider,
         m.smoker,
         m.hoursworked,
         CASE WHEN m.hoursworked IS NULL THEN 'style="display:none;"' END hoursHider,
         d.deptCode
      FROM member m 
      JOIN department d ON
         m.deptId=d.deptId 
      WHERE memberId = pMemberID;
   END WEB_GetBizMemberInfo;
END WEB_ER_BizInfo;
/

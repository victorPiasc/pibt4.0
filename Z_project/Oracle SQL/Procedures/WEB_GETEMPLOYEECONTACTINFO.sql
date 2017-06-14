create or replace 
Procedure Web_GetEmployeeContactInfo
(
 pEmployeeId In varchar2,
 V_Refcur Out Sys_Refcursor
 )
As
Begin
    Open V_Refcur For
        Select 
            Employeeid, 
            Name, 
            Employeetype, 
            Gender, 
            Birthdate, 
            Marriagedate, 
            Hiredate, 
            Address, 
            City, 
            State, 
            Zip, 
            Homephonenbr, 
            Workphonenbr, 
            Mobilephonenbr, 
            Emailaddress, 
            Deptid 
        FROM WEB_MEMBERINFODETAILS_V
        WHERE (MEMBERID = pEmployeeId);
end;
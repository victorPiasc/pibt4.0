
  Create Or Replace Force View Web_Memberinfodetails_V 
  AS
  SELECT
    employerId, 
    employeeId, 
    memberId,                                                            
    lastName||', '|| firstName||' '|| middleName    name, 
    employeeType employeeTypeId,
    Decode(employeeType,0,'Employee',1,'Spouse',2,'Child',3,'Domestic Partner',' ') employeeType,
    Decode(male,'Y','Male','Female') gender,
    birthDate,
    marriageDate,
    hireDate,
    addressOne address,                   
    city,                           
    state,                          
    zip,     
	socsecnbr,                       
    homePhoneNbr,                   
    workPhoneNbr,                   
    mobilePhoneNbr,                                            
    emailAddress ,                                                        
    Deptid
 FROM
   member;
 

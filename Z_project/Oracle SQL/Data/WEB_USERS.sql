Insert into WEB_USERS 
(ID,WEBUSERROLEID,WEBNAME,USERID,EMPLOYERID,EMPLOYEEID,MEMBERID,UPDATED,UPDATEDBY,LASTLOGINTIME,LASTLOGINIP,ISLOCKOUT) 
values (0,1,'luke','luke',null,null,null,to_date('25-APR-13','DD-MON-RR'),'luke',to_date('10-AUG-13','DD-MON-RR'),'::1',null);
Update Users
Set Webuserroleid = 1
where userid='luke';
commit;
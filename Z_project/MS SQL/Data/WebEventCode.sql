Delete From [WebEventCode]

Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('0','Application Error',0)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('1','Update',0)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('2','Insert',0)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('3','Delete',0)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('4','Query',0)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('5','Create Web Account',1)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('6','Change Password',1)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('7','Login',1)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('8','Logout',1)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('9','Maintain Web Site',null)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('10','Syn Agent Web User From BMS',1)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('11','Syn RK Web User From BMS',1)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('12','Syn Employer Web User From BMS',1)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('13','Syn Member Web User From BMS',1)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('14','Approve Enrollment',1)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('15','Reject Enrollment',1)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('16','Cancel Enrollment',1)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('17','Submit Enrollment',1)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('18','Create Enrollment',1)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('19','ModifyEnrollment',1)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('20','Terminate Enrollment',1)
INSERT INTO [WebEventCode] ([Id],[EventCode],[ShowInFilter]) VALUES('21','Syn Broker web user from BMS',1)
INSERT INTO [WebEventCode] ([Id],[EventCode],[ShowInFilter]) VALUES('22','Syn Enroller web user from BMS',1)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('101','Update Admin',1)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('102','Update Agent',1)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('103','Update RK',1)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('104','Update Employer',1)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('105','Update Employee',1)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('106','Update Dependent',1)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('107','Update Plan',1)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('108','Update Employer Contact',1)
INSERT INTO [WebEventCode] ([Id],[EventCode],[ShowInFilter]) VALUES('109','Update Broker',1) 
INSERT INTO [WebEventCode] ([Id],[EventCode],[ShowInFilter]) VALUES('110','Update Enroller',1) 
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('201','Add Admin',1)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('202','Add Agent',1)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('203','Add RK',1)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('204','Add Employer',1)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('205','Add Employee',1)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('206','Add Dependent',1)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('207','Add Plan',1)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('208','Add Employer Contact',1)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('209','Add Employer DBA',1)
INSERT INTO [WebEventCode] ([Id],[EventCode],[ShowInFilter]) VALUES('210','Add Broker',1) 
INSERT INTO [WebEventCode] ([Id],[EventCode],[ShowInFilter]) VALUES('211','Add Enroller',1) 
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('301','Delete Admin',1)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('302','Delete Agent',1)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('303','Delete RK',1)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('304','Delete Employer',1)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('305','Delete Employee',1)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('306','Delete Dependent',1)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('307','Delete Plan',1)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('308','Delete Employer Contact',1)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('309','Delete Employer DBA',1)
Insert Into [WebEventCode] ([Id],[EventCode],[ShowInFilter]) Values('310','Change Login Name', 1)
INSERT INTO [WebEventCode] ([Id],[EventCode],[ShowInFilter]) VALUES('311','Delete Broker',1) 
INSERT INTO [WebEventCode] ([Id],[EventCode],[ShowInFilter]) VALUES('312','Delete Enroller',1) 


UPDATE [WebEventCode]
   SET [ShowInFilter] = 0
   WHERE [Id] IN(10,11,12,13,21)
COMMIT
  
  CREATE TABLE OE_WINDOW
   (	"ID" NUMBER(8,0) NOT NULL ENABLE, 
	"EMPLOYERID" NUMBER(8,0) NOT NULL ENABLE, 
	"ISRENEW" VARCHAR2(5 BYTE) DEFAULT 'false',
	"OEFROMMONTH" DATE, 
	"OETOMONTH" DATE, 
	"PLANEFFECTIVEDATE" DATE, 
	"CREATED" DATE, 
	"CREATEDBY" VARCHAR2(10 BYTE), 
	"MODIFIED" DATE, 
	"MODIFIEDBY" VARCHAR2(10 BYTE), 
	 CONSTRAINT "OE_WINDOW_PK" PRIMARY KEY ("ID")
   );
 

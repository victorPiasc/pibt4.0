CREATE TABLE WEB_OE_TYPES 
   (	
    "ID" NUMBER(1,0), 
	"DESCRIPTION" VARCHAR2(30 BYTE), 
	"ACTIVE" CHAR(1 BYTE) DEFAULT '1', 
	"USAGE" VARCHAR2(4000 BYTE), 
	 PRIMARY KEY ("ID")
   )
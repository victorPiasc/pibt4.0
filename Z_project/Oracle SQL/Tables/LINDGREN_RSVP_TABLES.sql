-------------------------------------------------------
--  DDL for Table EVENT_REGISTRATION
--------------------------------------------------------

  CREATE TABLE EVENT_REGISTRATION
   (   "REGISTRATIONID" NUMBER(*,0), 
   "EVENTID" NUMBER(*,0), 
   "PERSONID" NUMBER(*,0), 
   "REGISTRATIONDATE" TIMESTAMP (6), 
   "AMOUNTPAID" NUMBER(*,0) DEFAULT 0.00,
   "ITEM" VARCHAR(100)
   );
--------------------------------------------------------
--  DDL for Index EVENTREGISTRATION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "EVENTREGISTRATION_PK" ON "EVENT_REGISTRATION" ("REGISTRATIONID") ;
--------------------------------------------------------
--  DDL for Trigger EREG_ON_INSERT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "EREG_ON_INSERT" 
  BEFORE INSERT ON EVENT_REGISTRATION
  FOR EACH ROW
   BEGIN
     SELECT eventreg_sequence.nextval
     INTO :new.RegistrationID
     FROM dual;
   END;
/
ALTER TRIGGER "EREG_ON_INSERT" ENABLE;
--------------------------------------------------------
--  Constraints for Table EVENT_REGISTRATION
--------------------------------------------------------

  ALTER TABLE "EVENT_REGISTRATION" ADD CONSTRAINT "EVENTREGISTRATION_PK" PRIMARY KEY ("REGISTRATIONID");
  ALTER TABLE "EVENT_REGISTRATION" MODIFY ("REGISTRATIONID" NOT NULL ENABLE);

--------------------------------------------------------
--  DDL for Table EVENT_TRANSACTIONS
--------------------------------------------------------

  CREATE TABLE "EVENT_TRANSACTIONS" 
   (   "TRANSACTIONID" NUMBER(*,0), 
   "REGISTRATIONID" NUMBER(*,0), 
   "TRANSACTIONTIMESTAMP" TIMESTAMP (6), 
   "TRANSACTIONCODE" VARCHAR2(20 BYTE), 
   "SUBTOTAL" NUMBER(*,0), 
   "ITEM" VARCHAR2(100 BYTE),
   "ACCOUNT" NUMBER(*,0)
   );
--------------------------------------------------------
--  DDL for Index EVENT_TRANSACTIONS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "EVENT_TRANSACTIONS_PK" ON "EVENT_TRANSACTIONS" ("TRANSACTIONID") ;
--------------------------------------------------------
--  DDL for Trigger TRANS_ON_INSERT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TRANS_ON_INSERT" 
  BEFORE INSERT ON EVENT_TRANSACTIONS
  FOR EACH ROW
BEGIN
  SELECT trans_sequence.nextval
  INTO :new.TransactionID
  FROM dual;
END;
/
ALTER TRIGGER "TRANS_ON_INSERT" ENABLE;
--------------------------------------------------------
--  Constraints for Table EVENT_TRANSACTIONS
--------------------------------------------------------

  ALTER TABLE "EVENT_TRANSACTIONS" ADD CONSTRAINT "EVENT_TRANSACTIONS_PK" PRIMARY KEY ("TRANSACTIONID");
  ALTER TABLE "EVENT_TRANSACTIONS" MODIFY ("TRANSACTIONID" NOT NULL ENABLE);


--------------------------------------------------------
--  DDL for Table PERSON
--------------------------------------------------------

  CREATE TABLE "PERSON" 
   (   "PERSONID" NUMBER(*,0), 
   "LASTNAME" VARCHAR2(50 BYTE), 
   "FIRSTNAME" VARCHAR2(50 BYTE), 
   "EMAIL" VARCHAR2(50 BYTE), 
   "ADDRESS" VARCHAR2(50 BYTE), 
   "CITY" VARCHAR2(50 BYTE), 
   "STATE" VARCHAR2(3 BYTE), 
   "ZIP" VARCHAR2(10 BYTE),
   "COMPANY" VARCHAR2(50 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Index TABLE1_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TABLE1_PK" ON "PERSON" ("PERSONID")  ;
--------------------------------------------------------
--  DDL for Trigger PERSON_ON_INSERT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "PERSON_ON_INSERT" 
  BEFORE INSERT ON PERSON
  FOR EACH ROW
BEGIN
  SELECT person_sequence.nextval
  INTO :new.PersonID
  FROM dual;
END;
/
ALTER TRIGGER "PERSON_ON_INSERT" ENABLE;
--------------------------------------------------------
--  Constraints for Table PERSON
--------------------------------------------------------

  ALTER TABLE "PERSON" ADD CONSTRAINT "TABLE1_PK" PRIMARY KEY ("PERSONID");
  ALTER TABLE "PERSON" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "PERSON" MODIFY ("PERSONID" NOT NULL ENABLE);

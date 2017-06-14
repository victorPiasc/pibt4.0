CREATE TABLE PIA_ADMIN.WEB_OE
(
  ID             NUMBER(8),
  EMPLOYERID     NUMBER(8)                      NOT NULL,
  MEMBERID       NUMBER(8)                      NOT NULL,
  TYPEID         NUMBER(1)                      NOT NULL,
  CAFETERIA      VARCHAR2(1 BYTE)               DEFAULT 'Y',
  LEGALDOCS      VARCHAR2(1 BYTE)               DEFAULT 'N',
  SIGNATRUE      VARCHAR2(1 BYTE)               DEFAULT 'N',
  CREATED        DATE                           NOT NULL,
  CREATEDBY      VARCHAR2(20 BYTE)              NOT NULL,
  IP             VARCHAR2(15 BYTE)              NOT NULL,
  UPDATED        DATE,
  UPDATEDBY      VARCHAR2(20 BYTE),
  UPDATEDIP      VARCHAR2(15 BYTE),
  STATUS         NUMBER(1)                      DEFAULT '0',
  TREASONID      NUMBER(2),
  SIGNATURENAME  VARCHAR2(38 BYTE)
);

LTER TABLE PIA_ADMIN.WEB_OE ADD (
  PRIMARY KEY
  (ID);
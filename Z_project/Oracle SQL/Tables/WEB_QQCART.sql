CREATE TABLE PIA_ADMIN.WEB_QQCART
(
  EMPLOYEENAME         VARCHAR2(60 BYTE)        NOT NULL,
  EMPLOYEETYPEID       NUMBER(1)                NOT NULL,
  EMPLOYEETYPE         VARCHAR2(25 BYTE)        NOT NULL,
  MALE                 CHAR(1 BYTE)             NOT NULL,
  BIRTHDATE            DATE                     NOT NULL,
  CREATEDDATE          DATE                     NOT NULL,
  CONTRIBUTION         NUMBER(5,2),
  DOLLAR               NUMBER(6,2),
  PERIODSPERYEAR       NUMBER(4),
  SALARYPERPERIOD      NUMBER(9,2),
  EMPLOYEEID           NUMBER(8),
  CONTRIBUTIONDEP      NUMBER(5,2),
  DOLLARDEP            NUMBER(6,2),
  MEMBERID             NUMBER(8),
  FAMILYID             NUMBER(8),
  VTL_INSURANCEAMOUNT  NUMBER(10,2),
  MTL_INSURANCEAMOUNT  NUMBER(10,2),
  PLANTYPEID           NUMBER(3),
  CART                 NUMBER(8)                NOT NULL
);

CREATE INDEX wqqc$cart ON web_qqCart(cart);
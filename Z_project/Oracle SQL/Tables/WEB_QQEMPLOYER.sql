CREATE TABLE PIA_ADMIN.WEB_QQEMPLOYER
(
  COMPANYNAME      VARCHAR2(60 BYTE),
  ADDRESS          VARCHAR2(60 BYTE),
  CITY             VARCHAR2(60 BYTE),
  ST               VARCHAR2(2 BYTE)             NOT NULL,
  ZIP              NUMBER(9)                    NOT NULL,
  FAX              VARCHAR2(10 BYTE),
  PHONE            VARCHAR2(14 BYTE),
  EMAIL            VARCHAR2(60 BYTE),
  LABELNAME        VARCHAR2(50 BYTE),
  CREATEDBY        VARCHAR2(10 BYTE),
  QUOTENUM         NUMBER(8),
  ISSAVED          CHAR(1 BYTE)                 DEFAULT 'N'                   NOT NULL,
  DATESAVED        DATE,
  CONTRIBUTION     NUMBER(5,2),
  CONTRIBUTIONDEP  NUMBER(5,2),
  DOLLAR           NUMBER(6,2),
  DOLLARDEP        NUMBER(6,2),
  EMPLOYERID       NUMBER(8),
  CNAME            VARCHAR2(60 BYTE),
  OFBASE           CHAR(1 BYTE)                 DEFAULT 'N'                   NOT NULL,
  NBREMPLOYEES     NUMBER(5),
  ISPC             CHAR(1 BYTE)                 DEFAULT 'N'                   NOT NULL,
  CART             NUMBER(8)                    NOT NULL
);

CREATE INDEX wqqe$cart ON web_qqEmployer(cart);
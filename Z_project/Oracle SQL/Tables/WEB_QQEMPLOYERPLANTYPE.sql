CREATE TABLE PIA_ADMIN.WEB_QQEMPLOYERPLANTYPE
(
  PLANTYPEID       NUMBER(3)                    NOT NULL,
  CONTRIBUTION     NUMBER(5,2),
  CONTRIBUTIONDEP  NUMBER(5,2),
  OFBASE           CHAR(1 BYTE)                 DEFAULT 'N'                   NOT NULL,
  BASEPLANID       NUMBER(6),
  CART             NUMBER(8)                    NOT NULL
);

ALTER TABLE web_qqEmployerPlanType ADD PRIMARY KEY(cart, planTypeId);
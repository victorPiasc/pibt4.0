CREATE TABLE PIA_ADMIN.WEB_QQCOMPARECART
(
  PLANID      NUMBER(6)                         NOT NULL,
  PLANTYPEID  NUMBER(3),
  CART        NUMBER(8)                         NOT NULL
);

CREATE INDEX wqqcc$cart ON web_qqCompareCart(cart, planId);
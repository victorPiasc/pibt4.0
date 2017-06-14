CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_ASSIGNBROKEREMPLOYER" (
   pBrokerId VARCHAR2,
   pEmployerId VARCHAR2,
   pEffective DATE,
   pExpiry DATE)
AS
BEGIN
   UPDATE brokerEmployer
   SET effective = pEffective,
      expiry = pExpiry
   WHERE brokerId = pBrokerId AND
      employerId = pEmployerId;
   IF SQL%ROWCOUNT>1 THEN       
      INSERT INTO brokerEmployer
      VALUES ( brokerEmployer_seq.NEXTVAL, pBrokerId, pEmployerId, pEffective, pExpiry);
   END IF;
   COMMIT;
END;
/

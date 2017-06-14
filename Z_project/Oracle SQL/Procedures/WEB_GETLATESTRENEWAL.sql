CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETLATESTRENEWAL" (
   pEmployerId IN VARCHAR2,
   pExist OUT NUMBER)
AS
   vRenewalId INTEGER;
   vDate DATE;
   vDate2 DATE;
BEGIN

   SELECT ADD_MONTHS(NVL(oe2.oeFromMonth, oe1.oeFromMonth),-2),
      NVL(oe2.oeToMonth, oe1.oeToMonth)
   INTO vDate, vDate2
   FROM oe_window oe1
   LEFT JOIN oe_window oe2 ON
      oe2.employerId=pEmployerId
   WHERE oe1.employerId=0;

   --If today is before the start date of the following year.
   IF TRUNC(SYSDATE) NOT BETWEEN vDate AND vDate2 THEN
      pExist:=2;
      RETURN;
   END IF;

   --Check PA agreement to see if Martina processed PA for employer.
   SELECT MAX(effective) INTO vDate
   FROM participationAgreement
   WHERE employerId=pEmployerId;
   --If the date in the PA is greater than today then PA processed already.

   IF vDate>TRUNC(SYSDATE) THEN
      pExist:=2;
      RETURN;
   END IF;

   --Now lets check the renewal tables
   --Get the last renewal completed
   SELECT MAX(renewalId) INTO vRenewalId
   FROM web_renewal
   WHERE employerId=pEmployerId;
   --If I get null that means that employer has not completed an online renewal
   IF vRenewalId IS NULL THEN
      pExist:=0;
      RETURN;
   END IF;

   SELECT
       CASE WHEN TRUNC(renewalDate) NOT BETWEEN vDate AND TRUNC(SYSDATE) THEN 0
         WHEN isComplete='Y' THEN 2--When renewal is completed for this year
         ELSE 1 --When renewal is incomplete for this year
      END INTO pExist
   FROM web_renewal
   WHERE renewalID=vRenewalId;
END;
/

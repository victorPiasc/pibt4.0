CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_UPDATEQQEMPLOYER" (
   pCartId    NUMBER,
   pIsPercent CHAR)
AS
BEGIN
   IF pIsPercent='Y' THEN
      UPDATE web_qqEmployer
         SET dollar = NULL,
            dollarDep = NULL
         WHERE cart=pCartId;
   ELSE
      UPDATE web_qqEmployer
         SET contribution = 50,
            contributionDep = 50
         WHERE cart=pCartId;
   END IF;
   COMMIT;
END;
/

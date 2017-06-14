CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_DELETEEMPLOYERPLANTYPE" (
   pCartId NUMBER)
AS
BEGIN
   UPDATE web_qqEmployerPlanType
      SET contribution = NULL,
         contributionDep = NULL
      WHERE cart=pCartId;
   COMMIT;
END;
/

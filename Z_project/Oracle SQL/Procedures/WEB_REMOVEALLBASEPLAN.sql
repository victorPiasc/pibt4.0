﻿CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_REMOVEALLBASEPLAN" (
   pCartId NUMBER)
AS
BEGIN
   UPDATE web_qqEmployerPlanType
      SET basePlanId = NULL
      WHERE cart=pCartId;
   COMMIT;
END;
/

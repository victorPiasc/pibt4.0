﻿CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_DELETEMEMBERFROMQUOTE" (
   pCartId   NUMBER,
   pMemberId VARCHAR2)
AS
BEGIN
   DELETE FROM web_qqCart
      WHERE cart=pCartId AND
         memberId=pMemberId;
   COMMIT;
END;
/

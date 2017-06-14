CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_VALIDATEMEMBERID" (
   pEmployerId IN VARCHAR2,
   pMemberId IN VARCHAR2,
   pCount OUT NUMBER )
AS
BEGIN
   SELECT COUNT(1) INTO pCount
   FROM member
   WHERE employerId=pEmployerId AND
      memberId=pMemberId;
END;
/

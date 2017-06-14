CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETCURRENTPA"
(  pEmployerId in  VARCHAR2,
   peffective    OUT date)
AS
BEGIN
 
      SELECT
         min(effective) into peffective
      FROM
         participationagreement
      WHERE
         employerid=pEmployerId AND
         TRUNC(SYSDATE)<=NVL(expiry,'31-dec-9999');
END;
/

CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_SEARCHQUOTES"(
   Plabel   IN  VARCHAR2,
   V_refcur OUT Sys_Refcursor
)
AS
BEGIN
   OPEN v_refcur FOR
      SELECT CART,
         COMPANYNAME,
         LABELNAME,
         CREATEDBY,
         QUOTENUM,
         DATESAVED
      FROM WEB_QQEMPLOYER
      WHERE ISSAVED = 'Y' AND
         Upper(LABELNAME) LIKE Upper(Plabel)||'%';
End;
/

CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETBROKEREMPLOYERS" (
   pBrokerId IN VARCHAR2,
   pClue IN VARCHAR2, 
   pDropDown IN VARCHAR2,
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR
      SELECT *
      FROM brokerInfo_v
      WHERE brokerId=pBrokerId AND
         (  pClue IS NULL OR 
            TO_CHAR(employerId)=pClue OR
            UPPER(name) LIKE '%'||UPPER(pClue)||'%') AND 
         (  pDropDown='ALL' OR 
            status=pDropDown)
      ORDER by name;
END;
/
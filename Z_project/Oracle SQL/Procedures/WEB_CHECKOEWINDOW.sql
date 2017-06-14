CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_checkOEWindow(
   pEmployeeId IN NUMBER,
   v_return OUT VARCHAR2)
AS
   vEmployerId INTEGER;
   vCount INTEGER;
BEGIN
   v_return:='false';
   SELECT employerId INTO vEmployerId
   FROM member 
   WHERE memberId=pEmployeeId;

   SELECT COUNT(*) INTO vCount 
   FROM oe_Window
   WHERE employerid IN (0,vEmployerId) 
      AND TRUNC(SYSDATE) BETWEEN oeFromMonth AND oeToMonth;
      
   IF vCount>0 THEN
      WITH oeStart AS(
         SELECT MAX(created) created,
            MAX(employerId) employerId
         FROM web_oe
         WHERE memberId=pEmployeeId AND 
            status=0
         GROUP BY memberId)
      SELECT COUNT(*) INTO vCount 
      FROM oeStart os
      JOIN oe_window o1 ON 
         o1.employerId=0
      LEFT JOIN oe_window o2 ON
         o2.employerId=os.employerId
      WHERE os.created BETWEEN NVL(o2.oeFromMonth,o1.oeFromMonth) AND NVL(o2.oeToMonth,o1.oeToMonth);  
      
      IF vCount=0 THEN 
         v_return:='true';
         RETURN;
      END IF;
   END IF;          
END;
/

CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_updateOEPlansAddtional(
   pId VARCHAR2, 
   pField1 VARCHAR2,
   pField2 VARCHAR2, 
   pField3 VARCHAR2)
AS
BEGIN
   UPDATE web_enrollerFormPlans
   SET planOffice1=pField1,
      planOffice2=pField2,
      planOffice3=pField3
   WHERE id=pId;
   COMMIT;
END;
/

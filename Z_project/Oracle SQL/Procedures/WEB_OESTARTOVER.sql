CREATE OR REPLACE PROCEDURE web_oeStartOver(
   pOeId IN VARCHAR2,
   pUpdatedBy IN VARCHAR2, 
   pIp IN VARCHAR2)
AS
BEGIN
   UPDATE web_oe 
   SET legalDocs='N', 
      signatrue='N',
      signatureName=NULL,
      updated=SYSDATE,
      updatedBy=pUpdatedBy,
      updatedIp=pIp, 
      status=0,
      treasonId=NULL
   WHERE id=pOeId;
   
   DELETE FROM web_enrollerFormPlans WHERE oeId=pOeId;
   DELETE FROM web_oeCart WHERE oeId=pOeId;
   COMMIT;
END;   
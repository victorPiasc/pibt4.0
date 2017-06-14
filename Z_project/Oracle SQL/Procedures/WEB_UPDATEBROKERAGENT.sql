CREATE OR REPLACE PROCEDURE web_updateBrokerAgent(
   pPk IN VARCHAR2, 
   pBrokerId IN VARCHAR2,
   pLastName IN VARCHAR2,
   pFirstName IN VARCHAR2, 
   pMiddle IN VARCHAR2,
   pLicense IN VARCHAR2, 
   pIssued IN DATE, 
   pOffice IN VARCHAR2, 
   pCell IN VARCHAR2, 
   pEmail IN VARCHAR2,
   pManager IN VARCHAR2,
   pUpdatedBy IN VARCHAR2)
AS
BEGIN 
   IF pPk<>0 THEN 
      UPDATE brokerAgent 
      SET lastName=pLastName,
         mi=pMiddle, 
         firstName=pFirstName, 
         license=pLicense, 
         licenseIssued=pIssued, 
         officePhone=pOffice, 
         cell=pCell, 
         email=pEmail, 
         manager=pManager, 
         updatedBy=pUpdatedBy,
         updated=SYSDATE
      WHERE pk=pPk;
   ELSE
      INSERT INTO brokerAgent(pk,brokerId,manager,firstname,mi,lastname, 
         updated,updatedBy,email,officePhone,cell,license,licenseIssued)
      VALUES(brokerAgentSeq.NEXTVAL,pBrokerId,pManager,pFirstName,pMiddle,pLastName, 
         SYSDATE,pUpdatedBy,pEmail,pOffice,pCell,pLicense,pIssued);     
   END IF;
   
   COMMIT;
END;
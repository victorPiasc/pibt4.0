CREATE OR REPLACE PROCEDURE WEB_INSERTEMPLOYERCONTACT (
   pEmployerId VARCHAR2,
   pTitle VARCHAR2,
   pFirstName VARCHAR2,
   pMiddleName VARCHAR2,
   pLastName VARCHAR2,
   pEmail VARCHAR2,
   pPhone VARCHAR2,
   pFax VARCHAR2,
   pBizPhone1 VARCHAR2,
   pBizExt1 VARCHAR2,
   pBizPhone2 VARCHAR2,
   pBizExt2 VARCHAR2,
   pMobile VARCHAR2,
   pEmail2 VARCHAR2,
   pAssistant VARCHAR2,
   pNotes VARCHAR2,
   pUpdatedBy VARCHAR2)
AS
BEGIN
   INSERT INTO Employercontacts
   VALUES (pEmployerId, pTitle, pFirstName, pMiddleName, pLastName, pEmail, pPhone, pFax,
   pUpdatedBy, SYSDATE, pBizPhone1, pBizExt1,pBizPhone2, pBizExt2, pMobile, pEmail2, 
   pAssistant, pNotes, employerContacts_seq.NEXTVAL);
   COMMIT;
END;
/

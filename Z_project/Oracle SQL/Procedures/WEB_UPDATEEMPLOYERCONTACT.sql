CREATE OR REPLACE PROCEDURE WEB_UPDATEEMPLOYERCONTACT (
   pRowId VARCHAR2,
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
   UPDATE  employerContacts
   SET title=pTitle,
      firstName=pFirstName,
      middleName=pMiddleName,
      lastName=pLastName,
      email=pEmail,
      phone=pPhone, 
      fax=pFax, 
      bizPhone1=pBizPhone1, 
      bizExt1=pBizExt1,
      bizPhone2=pBizPhone2,
      bizExt2=pBizExt2,
      mobile=pMobile, 
      email2=pEmail2,
      assistant=pAssistant, 
      notes=pNotes,
      updatedBy=pUpdatedBy,
      updated=SYSDATE      
   WHERE rowid=pRowId;
   COMMIT;
END;
/

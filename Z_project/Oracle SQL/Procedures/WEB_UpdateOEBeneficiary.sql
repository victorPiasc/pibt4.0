CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_UPDATEOEBENEFICIARY"(
   pRId IN VARCHAR2,  
   pPlanTypeId     IN  VARCHAR2,
   pFirstName      IN  VARCHAR2,
   pMiddleName     IN  VARCHAR2,
   pLastName       IN  VARCHAR2,
   pAddress        IN  VARCHAR2,
   pCity           IN  VARCHAR2,
   pState          IN  VARCHAR2,
   pZip            IN  VARCHAR2,
   pPercentage     IN  VARCHAR2,
   pSSN            IN  VARCHAR2,
   pUpdatedBy      IN  VARCHAR2,
   pRelationshipId IN  VARCHAR2)
AS
BEGIN
   UPDATE beneficiaries
   SET
       planTypeId      =   pPlanTypeId,
       firstname       =   pFirstName,
       middleInitial   =   pMiddleName ,
       lastName        =   pLastName,
       address         =   pAddress,
       city            =   pCity ,
       state           =   pState,
       zip             =   pZip ,
       percentage      =   pPercentage,
       socsecnbr       =   pSSN ,
       updated         =   SYSDATE ,
       updatedBy       =   pUpdatedBy,
       relationshipId  =   pRelationshipId
   WHERE ROWID=pRId;
   COMMIT;
END;
/

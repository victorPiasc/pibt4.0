create or replace 
PROCEDURE WEB_UpdateEmployerGeneralInfo
   (pEmployerID in Varchar2,
    pName in Varchar2,
    pAddressOne in Varchar2,
    pCity in Varchar2,
    pState in Varchar2,
    pZip in Varchar2,
    pMailContact in Varchar2,
    pMailEmail in Varchar2,
    pBillAddressOne in Varchar2,
    pBillCity in Varchar2,
    pBillState in Varchar2,
    pBillZip in Varchar2,
    pBillContact in Varchar2,
    pBillEmail in Varchar2
     )
AS
      BEGIN         
          Update Employer
          Set name = pName,
              addressOne  = pAddressOne,
              city  = pCity,
              state  = pState,
              zip  = pZip,
              mailContact  = pMailContact,
              mailEmail  = pMailEmail,
              billAddressOne  = pBillAddressOne,
              billCity = pBillCity,
              billState = pBillState,
              billZip = pBillZip,
              billContact = pBillContact,
              billEmail  = pBillEmail     
          WHERE
             employerId = pEmployerID;
          
          Commit;
END;
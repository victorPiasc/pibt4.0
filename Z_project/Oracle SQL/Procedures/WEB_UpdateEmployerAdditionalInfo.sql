create or replace 
PROCEDURE WEB_UpdateEmployerAddInfo
   (pEmployerID in varchar2,
    pWaitingPeriodId in varchar2,
    pEnrollerId in varchar2,
    pRKId in varchar2,
    pTermId in varchar2,
    pEmployeeContribution in varchar2,
    pDependentContribution in varchar2,
    pTaxId in varchar2,
    pSIC in Varchar2,
    pNatureofBusiness in Varchar2
     )
AS
      BEGIN         
          Update Employer
          Set Waitingperiodid  = pWaitingPeriodId,
              Enrollerid  = pEnrollerId,
              Csrid = Prkid,
              Termid = Ptermid,
              Contribution  = pEmployeeContribution,
              Contributiondep = Pdependentcontribution,
              Taxid  = pTaxId,
              Sic  = Psic,
              Natureofbiz  = pNatureofBusiness
          WHERE
             Employerid = pEmployerID;
          
     
END;
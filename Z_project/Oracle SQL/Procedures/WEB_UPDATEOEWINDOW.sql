create or replace 
Procedure Web_UpdateOEWindow
(
pId in varchar2,
pEMPLOYERID in varchar2,
pISRENEW  in varchar2,
pOEFROMMONTH  in date,
pOETOMONTH  in date,
pPLANEFFECTIVEDATE  in date,
pUpdatedBy  in varchar2
 )
As
Begin
 UPDATE OE_WINDOW
SET EMPLOYERID        = pEMPLOYERID,
  ISRENEW           = pISRENEW,
  OEFROMMONTH       = pOEFROMMONTH,
  OETOMONTH         = pOETOMONTH,
  PLANEFFECTIVEDATE = pPLANEFFECTIVEDATE,
  MODIFIED          = sysdate,
  MODIFIEDBY        = pUpdatedBy
WHERE ID = pId; 
commit;
End;
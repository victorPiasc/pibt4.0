create or replace 
Procedure Web_InsertOEWindow
(
pEMPLOYERID in varchar2,
pISRENEW  in varchar2,
pOEFROMMONTH  in date,
pOETOMONTH  in date,
pPLANEFFECTIVEDATE  in date,
pUpdatedBy  in varchar2
 )
As
Begin
insert INTO OE_WINDOW
  (
    ID,
    EMPLOYERID,
    ISRENEW,
    OEFROMMONTH,
    OETOMONTH,
    PLANEFFECTIVEDATE,
    CREATED,
    CREATEDBY,
    MODIFIED,
    MODIFIEDBY
  )
  VALUES
  (
    OE_WINDOW_SEQ.nextval,
    pEMPLOYERID,
    pISRENEW,
    pOEFROMMONTH,
    pOETOMONTH,
    pPLANEFFECTIVEDATE,
    sysdate,
    pUpdatedBy,
    sysdate,
    pUpdatedBy
  );
  commit;
End;
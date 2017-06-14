CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_DELETEEMPLOYERDBA"
(
   Pemployerid In Varchar2,
   pDBAName    in varchar2
) AS
Begin
   Delete From Employerdba
      Where Employerid=Pemployerid And Upper(Dbaname)=Upper(Pdbaname);
   COMMIT;
END WEB_DELETEEMPLOYERDBA;
/
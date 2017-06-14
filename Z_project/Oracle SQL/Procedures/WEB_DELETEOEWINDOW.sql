create or replace 
Procedure Web_DeleteOEWindow
(
pId in varchar2 
 )
As
Begin
 DELETE FROM OE_WINDOW WHERE ID = pId; 
 commit;
End;
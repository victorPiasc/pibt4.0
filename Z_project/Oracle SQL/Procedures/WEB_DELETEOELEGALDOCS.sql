create or replace 
Procedure Web_DeleteOELEGALDOCS
(
pId in varchar2
 )
As
Begin
Delete from WEB_OELEGALDOCS
WHERE ID = pId and nvl(pId,0)<>0;
  commit;
End;
 
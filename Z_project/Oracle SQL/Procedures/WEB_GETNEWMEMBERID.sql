create or replace 
PROCEDURE WEB_GetNewMemberId
   (cur_NewMemberId OUT SYS_REFCURSOR )
   IS
      BEGIN
          open cur_NewMemberId for 
       SELECT memberid_seq.nextVal newMemberId
       FROM dual;

   END ;
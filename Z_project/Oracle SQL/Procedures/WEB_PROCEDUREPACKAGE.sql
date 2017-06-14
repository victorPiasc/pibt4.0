create or replace 
PACKAGE             "WEB_ER_BIZINFO" AS 
TYPE T_CURSOR IS REF CURSOR; 
   PROCEDURE WEB_GetBizInfoDetails 
   (  pEmployerID IN Varchar2,     
      cur_BizInfo OUT T_CURSOR ); 
   PROCEDURE WEB_GetBizContacts 
   (  pEmployerID IN Varchar2,     
      cur_BizContacts OUT T_CURSOR );
   PROCEDURE WEB_GetBizInfoDetails2 
   (  pEmployerID IN Varchar2,     
      cur_BizInfo2 OUT T_CURSOR ); 
   PROCEDURE WEB_GetBizEeNames 
   (  pEmployerID IN Varchar2,     
      cur_BizEeNames OUT T_CURSOR ); 
   PROCEDURE WEB_GetBizEeName 
   (  pEmployerID IN Varchar2,  
      pEmployeeID IN Varchar2,
      cur_BizEeNames OUT T_CURSOR ); 
   PROCEDURE WEB_GetBizDepNames
   (pEmployeeID in Varchar2,
    cur_BizDepNames OUT T_CURSOR );
   PROCEDURE WEB_GetBizMemberInfo
   (pMemberID in Varchar2,
    cur_BizMemberInfo OUT T_CURSOR );
END WEB_ER_BizInfo;
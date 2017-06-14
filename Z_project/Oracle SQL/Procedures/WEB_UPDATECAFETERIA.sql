create or replace 
PROCEDURE WEB_UpdateCafeteria
(
    pOeId             in  VARCHAR2,
    pCafeteria        in  VARCHAR2
 )
 AS
BEGIN
   Update web_OE 
   Set     
       Cafeteria       =   pCafeteria    
 Where
     ID = pOeId;

    COMMIT;
END;
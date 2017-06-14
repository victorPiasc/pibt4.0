
  CREATE OR REPLACE FORCE VIEW WEB_CRSEMPLOYER_V
  AS 
  SELECT 
         Employerid,
         er.NAME,
         CITY,
         State,
         Zip,
         csr.UserId
      From 
        Employer er,
        CSRINFO csr
      Where
        Er.Csrid=Csr.Csrid;
 

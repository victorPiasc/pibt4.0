
  CREATE OR REPLACE FORCE VIEW WEB_ENROLLEREMPLOYER_V
  AS
  Select 
         Er.Employerid,
         Er.Name,
         Er.City,
         Er.State,
         Er.Zip, 
         En.Userid
      From 
        Employer Er,
        Enrollerinfo En
      Where
        En.Enrollerid=En.Enrollerid;
 

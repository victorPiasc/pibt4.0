
  CREATE OR REPLACE FORCE VIEW WEB_ERAVAILABLEPLANS_V
  AS
  SELECT                       
   p.carrierId , 
   c.name carrierName,
   p.planId    ,  
   p.planTypeid ,
   p.planName                  
FROM                         
   plans p ,                  
   carrier c 
WHERE
   p.carrierId = c.carrierId AND
   p.planId     > 0       AND     
   p.status     = 0 
ORDER BY
  c.name,p.planName;
 

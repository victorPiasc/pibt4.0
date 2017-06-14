
  CREATE OR REPLACE FORCE VIEW WEB_BENEFICIARIES_V
  AS
  SELECT                                                                
   b.rowId                                     as rowr               ,
   b.memberId                                  as memberId           ,
   pt.description                              as description        ,
   b.firstName                                 as firstName          ,
   b.middleInitial                             as middleInitial      ,
   b.lastName                                  as lastName           ,
   b.relationshipId                            as relationshipId     ,
   br.description                              as relationship       ,
   b.address                                   as address            ,
   b.city                                      as city               ,
   b.state                                     as state              ,
   b.zip                                       as zip                ,
   b.percentage                                as percentage         ,
   b.socSecNbr                                 as socSecNbr          ,
   b.updated                                   as updated            ,
   b.updatedBy                                 as updatedBy           
FROM                                                                  
   beneficiaries b                                                    
      INNER JOIN planType pt                                          
      ON b.planTypeId = pt.planTypeId                                 
      LEFT OUTER JOIN beneficiaryRelationship br                      
      ON b.relationshipId = br.relationshipId;
 

Update Plantiertype Set WEBDESCRIPTION = 'DEP' Where Plantierid =  1;
update planTierType set WEBDESCRIPTION = 'FAM' where planTierId =  2;
update planTierType set WEBDESCRIPTION = 'SPO' where planTierId =  3;
update planTierType set WEBDESCRIPTION = 'CHD' where planTierId =  4;
update planTierType set WEBDESCRIPTION = 'CLD' where planTierId =  5;
update planTierType set WEBDESCRIPTION = 'FAM' where planTierId =  6;
update planTierType set WEBDESCRIPTION = 'EMP' where planTierId =  0;
update planTierType set WEBDESCRIPTION = 'EMP' where planTierId = -1;
update planTierType set WEBDESCRIPTION = 'SPO' where planTierId = -2;
update planTierType set WEBDESCRIPTION = 'SPO' where planTierId = -3;
update planTierType set WEBDESCRIPTION = 'FAM' where planTierId = -4;
update planTierType set WEBDESCRIPTION = 'FAM' where planTierId = -5;

COMMIT;
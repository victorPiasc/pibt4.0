CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_SETLIFERATES" (
   pCartId     NUMBER,
   pEmployerId VARCHAR2,
   pDate       DATE)
AS
   vNbrEmployees INTEGER;
   vWebDesc      VARCHAR2(30);
   vZipcode      INTEGER;
   age           INTEGER;
   fault         VARCHAR2(255);
   isMetal       CHAR(1);
   multiplier    NUMBER;
   price         NUMBER(12,2);
   priceDep      NUMBER(12,2);
   tier          INTEGER;
BEGIN
   web_getNbrEmployees(pEmployerId, vNbrEmployees);

   SELECT SUBSTR(zip,1,5) INTO vZipcode
      FROM web_qqEmployer
      WHERE cart=pCartId;

   --clear existing dependent records for life coverage
   DELETE FROM findWebRatesReport
      WHERE cart=pCartId AND
         employeeTypeId<>0 AND
         planTypeId IN (6,7);
   COMMIT;

   --clear dep Rates on the employee record
   UPDATE findWebRatesReport
      SET depRates=null,
         piaPlanTierId=0,
         piaPlanTierDesc = (SELECT MAX(webDescription) FROM planTierType WHERE planTierId=0)
      WHERE cart=pCartId AND
         planTypeId IN (6,7);
   COMMIT;

   SELECT MAX(webDescription) INTO vWebDesc FROM planTierType WHERE planTierId=3;

   --loop through spouses and calculate their rate
   --insert rate as new record to findWebRatesReport
   FOR rec IN (
      SELECT MAX(wc.employeeName) employeeName,
         MAX(wc.birthDate) birthDate,
         MAX(wc.employeeType) employeeType,
         MAX(wc.employeeTypeId) employeeTypeId,
         MAX(wc.male) male,
         fwr.planId,
         MAX(fwr.planName) planName,
         MAX(fwr.planTypeId) planTypeId,
         MAX(fwr.carrierId) carrierId,
         wc.familyId
      FROM web_qqCart wc
      JOIN findWebRatesReport fwr ON
         wc.cart=fwr.cart AND
         fwr.planTypeId=6 AND
         wc.familyId=fwr.familyId
      WHERE wc.cart=pCartId AND
         wc.employeeTypeId IN(1,3) AND
         fwr.carrierId<>0
      GROUP BY wc.familyId,fwr.planId)
   LOOP
      monthEndSingle(pDate, rec.planId, rec.birthdate, /*cobra*/NULL, /*cobra*/NULL, /*cobra*/NULL, vZipcode,
         /*eeZip*/vZipcode, 0, 0, /*smoker*/'N', rec.male, /*cobra*/'N', vNbrEmployees, pEmployerId,
         /*cobra*/NULL, /*hireDate*/pDate, tier, multiplier, fault, price, priceDep, isMetal, age);

      IF fault IS NULL AND rec.carrierId<>0 THEN
         INSERT INTO findWebRatesReport(cart, employeeName, employeeType, employeeTypeId, birthdate, planId, planName, planTypeId,
             deprates, piaPlanTierId, piaPlanTierDesc, carrierId, age, familyid, multiplier)
         VALUES(pCartId, rec.employeeName, rec.employeeType, rec.employeeTypeId, rec.birthdate, rec.planId, rec.planName,rec.planTypeId,
            price,3, vWebDesc, rec.carrierId, age, rec.familyid, multiplier);
      END IF;
   END LOOP;

   COMMIT;

   --update employee and spouse vtl vtl/mtl rates to coverage amount chosen.
   FOR rec IN(
      SELECT DISTINCT fwr.RowId rId,
         fwr.rates rates,
         fwr.depRates depRates,
         fwr.planTypeId planTypeId,
         wc.vtl_insuranceAmount vtl
      FROM findWebRatesReport fwr
      JOIN web_qqCart wc ON
         fwr.cart=wc.cart AND
         fwr.familyId=wc.familyId AND
         fwr.employeeTypeId=wc.employeeTypeId AND
         fwr.planTypeId=wc.planTypeId
      WHERE fwr.cart=pCartId AND
         fwr.planTypeId=6)
   LOOP
      UPDATE findWebRatesReport
      SET rates = rec.rates* NVL(rec.vtl,10)/1000,
         depRates = rec.depRates*NVL(rec.vtl, 5)/1000
      WHERE ROWID=rec.rId;
   END LOOP;
   COMMIT;


   SELECT MAX(webDescription) INTO vWebDesc FROM planTierType WHERE planTierId=5;

   INSERT INTO findWebRatesReport(cart, employeeName, employeeType, employeeTypeId, planId, planName, planTypeId,
         depRates, piaPlanTierId, piaPlanTierDesc, carrierId, familyId)
      SELECT pCartId,
         'Child(ren)',
         MAX(wc.employeeType),
         MAX(wc.employeeTypeId),
         fwr.planId,
         MAX(fwr.planName),
         MAX(fwr.planTypeId),
         MAX(CASE WHEN p.carrierId <> 0 THEN
            calcRate(/*contribution_fs*/null,/*contribution_f*/ null, /*contribution_s*/null, /*contribution*/p.vtlRate,/*smoker*/'N',
               /*male*/wc.male,/*hasGender*/'N', /*hasSmoker*/'N', /*planTypeId*/6,/*sp*/0, /*kid*/1, /*vtlRate*/p.vtlRate,
               /*insuranceAmount*/NVL(wc.vtl_insuranceAmount,0),/*rateBasis*/ NVL(p.kidLife,0), /*ageReductoin*/1,
               /*effEmployerId*/pEmployerId, /*kidLife*/p.kidLife)
            ELSE 0 END),
         5,
         vWebDesc,
         MAX(fwr.carrierId),
         MAX(wc.familyId)
      FROM web_qqCart wc
      JOIN findWebRatesReport fwr ON
         wc.cart=fwr.cart AND
         fwr.planTypeId=6 AND
         fwr.carrierId<>0 AND
         wc.familyId=fwr.familyId
      JOIN plans p ON
         fwr.planId=p.planId
      WHERE wc.cart=pCartId AND
         wc.employeeTypeId=2
      GROUP BY fwr.planId,wc.familyId;
   COMMIT;

   DELETE FROM findWebRatesReport
      WHERE cart=pCartId AND
         employeeTypeID=2 AND
         planTypeId=6 AND
         depRates IS NULL;
   COMMIT;
END;
/

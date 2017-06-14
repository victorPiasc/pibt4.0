CREATE OR REPLACE PROCEDURE web_getNbrEmployees(
   pEmployerId IN VARCHAR2, 
   pNbrEmployees OUT NUMBER)
AS
   vYear INTEGER;
BEGIN
   vYear :=EXTRACT(YEAR FROM SYSDATE);

   SELECT COALESCE(rep.nbrEmployees, hist.nbrEmployees, er.nbrEmployees)
   INTO pNbrEmployees
   FROM employer er
   LEFT JOIN nbrEmpHistReported rep ON
      er.employerId=rep.employerId AND 
      rep.inYear=vYear
   LEFT JOIN nbrEmpHist hist ON 
      er.employerId=hist.employerId AND
      hist.inYear=vYear
   WHERE er.employerId=pEmployerId;
END;
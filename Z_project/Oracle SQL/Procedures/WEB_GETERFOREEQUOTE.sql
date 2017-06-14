CREATE OR REPLACE PROCEDURE PIA_ADMIN.WEB_GETERFOREEQUOTE
(
    pEmployerid IN NUMBER,
    oNAME OUT VARCHAR2,
    oZip OUT NUMBER,
    oNbrEmployees OUT NUMBER,
    oCont OUT NUMBER,
    oContDep OUT NUMBER,
    oDollar OUT NUMBER,
    oDollarDep OUT NUMBER,
    oMonthsAhead OUT NUMBER    
)
AS
    vSTARTDATE DATE;
    vENDDATE DATE;
BEGIN                                          
    SELECT 
        name,
        zip,
        nbremployees,        
        contribution,
        contributiondep,
        dollar, 
        dollardep
    INTO oName, oZip, oNbrEmployees, oCont, oContDep, oDollar, oDollarDep                              
    FROM employer 
    WHERE employerid = pEmployerid;
    
        SELECT NVL(MIN(oefrommonth),'01-Nov-2015'),
           NVL(MIN(oetomonth),'31-Jan-2016')
    INTO vSTARTDATE,vENDDATE
    FROM  OE_WINDOW
    WHERE EMPLOYERID = pEmployerid; 
    
    WHILE vENDDATE < trunc(SYSDATE) LOOP
       vENDDATE := ADD_MONTHS(vENDDATE,12);
       vSTARTDATE := ADD_MONTHS(vSTARTDATE,12);
    END LOOP;  
    
    
    oMonthsAhead:=
    CASE
           WHEN vSTARTDATE > SYSDATE THEN MONTHS_BETWEEN(vSTARTDATE, TRUNC(SYSDATE, 'MM'))
           WHEN TRUNC(SYSDATE, 'MM') = TRUNC(SYSDATE) THEN 0
           ELSE 1
           END;
  
END;
/
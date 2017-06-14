CREATE OR REPLACE PROCEDURE WEB_UPDATEMEMBERCONTRIBUTION(
    pMemberId VARCHAR2,
    pContribution NUMBER,
    pContributionDep NUMBER,
    pDollar NUMBER,
    pDollarDep NUMBER,
    pPeriod NUMBER,
    pSalary NUMBER)
AS
BEGIN
    UPDATE MEMBER
        SET contribution = pContribution,
            contributionDep = pContributionDep,
            dollar = pDollar,
            dollarDep = pDollarDep,
            periodsperyear = pPeriod,
            salaryperperiod = pSalary
        WHERE
            memberid = pMemberId;
    COMMIT;
END;      
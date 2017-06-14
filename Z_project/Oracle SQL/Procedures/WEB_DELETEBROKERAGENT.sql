CREATE OR REPLACE PROCEDURE web_deleteBrokerAgent(
   pPk IN VARCHAR2)
AS
BEGIN
   DELETE FROM brokerAgent
   WHERE pk=pPk;
   COMMIT;
END;   
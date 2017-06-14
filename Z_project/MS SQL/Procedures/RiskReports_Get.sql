CREATE PROC [RiskReports_Get]
AS
BEGIN
SELECT
	Id, PublishedDate, VolumnNumber, FilePath
FROM RiskReports
ORDER BY PublishedDate desc, VolumnNumber desc
END

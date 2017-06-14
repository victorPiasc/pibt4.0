
CREATE PROC [dbo].[Lifelines_Get]
AS
BEGIN
SELECT
	Id, PublishedDate, VolumeNumber, FilePath
FROM Lifelines
ORDER BY PublishedDate desc, VolumeNumber desc
END
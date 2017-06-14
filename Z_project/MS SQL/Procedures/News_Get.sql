
ALTER PROC [dbo].[News_Get]
@TOP INT = NULL
AS
IF @TOP IS NULL
BEGIN
SELECT [NEWSID]
      ,[NEWSTITLE]
      ,[NEWSCONTENT]
      ,[NEWSDATE]
      ,[STARTDATE]
      ,[ENDDATE]
      ,CASE WHEN [SORTSEQ] = '0' THEN 'High'
            WHEN [SORTSEQ] = '1' THEN 'Medium'
            WHEN [SORTSEQ] = '2' THEN 'Low'
            END AS [SORTSEQ]
      ,[KeyWords]
      ,[CREATEDDATE]
      ,[CREATEDBY]
      ,[MODIFIEDDATE]
      ,[MODIFIEDBY]
  FROM [NEWS]
  ORDER BY [NEWSDATE] DESC
END
ELSE
BEGIN
SET Rowcount @top
SELECT [NEWSID]
      ,[NEWSTITLE]
      ,[NEWSCONTENT]
      ,[NEWSDATE]
      ,[STARTDATE]
      ,[ENDDATE]
      ,[SORTSEQ]
      ,[KeyWords]
      ,[CREATEDDATE]
      ,[CREATEDBY]
      ,[MODIFIEDDATE]
      ,[MODIFIEDBY]
  FROM [NEWS]
  ORDER BY [NEWSDATE] DESC
END

GO


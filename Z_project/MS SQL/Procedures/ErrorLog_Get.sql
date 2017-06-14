
CREATE proc [dbo].[ErrorLog_Get]
as
SELECT [LogId]
      ,[UserName]
      ,WebEventCode.[EventCode]
      ,[EventDetails]
      ,[EventTime]
      ,[FromIP]
  FROM  [dbo].[ErrorLog]
  LEFT JOIN WebEventCode
	on [ErrorLog].EventCode=WebEventCode.Id
  order by [EventTime] desc


GO


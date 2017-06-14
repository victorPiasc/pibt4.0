
CREATE proc [dbo].[Audit_Get]
as
SELECT [LogId]
      ,[UserName]
      ,WebEventCode.[EventCode]
      ,[EventDetails]
      ,[EventTime]
      ,[FromIP]
  FROM [dbo].[Audit]
  LEFT JOIN WebEventCode
	on [Audit].EventCode=WebEventCode.Id
  order by [EventTime] desc


GO


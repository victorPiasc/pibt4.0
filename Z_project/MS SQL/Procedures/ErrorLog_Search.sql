
CREATE Proc [dbo].[ErrorLog_Search]
@StartDate datetime,
@EndDate datetime,
@Username nvarchar(256),
@KeyWords nvarchar(256)
as
begin
SELECT [LogId]
      ,[UserName]
      ,WebEventCode.[EventCode]
      ,[EventDetails]
      ,[EventTime]
      ,[FromIP]
  FROM  ErrorLog
  LEFT JOIN WebEventCode
	on ErrorLog.EventCode=WebEventCode.Id
  Where ([UserName] like @Username+'%' or  @Username='') 
	and ([EventDetails] like '%'+@KeyWords+'%' or @KeyWords='')
	and DATEDIFF(day,ErrorLog.EventTime,ISNULL(@StartDate,'1753-01-01'))<=0
	and DATEDIFF(day,ErrorLog.EventTime,ISNULL(@EndDate,'9999-12-31'))>=0
  order by [EventTime] desc
end

GO


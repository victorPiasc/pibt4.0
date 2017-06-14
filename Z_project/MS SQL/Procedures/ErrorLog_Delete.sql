
ALTER proc [dbo].[ErrorLog_Delete]
@Month int
as
DELETE FROM  [dbo].[ErrorLog]
where [EventTime] <= DATEADD(MONTH,0-@Month,GETDATE())


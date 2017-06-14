
ALTER proc [dbo].[Audit_Delete]
@Month int
as
DELETE FROM  [dbo].[Audit]
where [EventTime] <= DATEADD(MONTH,0-@Month,GETDATE())


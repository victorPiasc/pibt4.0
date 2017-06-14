
create proc [dbo].[QA_Delete]
@QAId bigint
as
delete from QA where QAId=@QAId
GO


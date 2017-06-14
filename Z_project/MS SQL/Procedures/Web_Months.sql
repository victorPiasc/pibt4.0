create proc Web_Months
as
declare @t table(months int)
insert into @t values(1)
insert into @t values(3)
insert into @t values(6)
insert into @t values(9)
insert into @t values(12)
select * from @t
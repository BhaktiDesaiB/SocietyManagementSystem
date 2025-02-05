USE [Society]
GO
/****** Object:  StoredProcedure [dbo].[generateBillFor]    Script Date: 04/25/2019 09:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[generateBillFor](@mid1 varchar(20),@month varchar(10),@year int)
as 
begin
declare
@maintenace money,
@municipaltax money,
@watercharges money,
@gymcharges money,
@parkingcharges money,
@parkingchargesF money,
@penalty money,
@interest money,
@interestR money,
@total money,
@amountDue money,
@discount money,
@totalAmount money,
@vehicle2 int,
@vehicle4 int,
@mid varchar(15),
@mnth varchar(15),
@yr int,
@i int,
@max int;

--set @mid= 'mid0001';
--set @mnth= 'March';
--set @yr= 2017;
set @mid= @mid1;
set @mnth=@month;
set @yr= @year;

set @i =1;
set @max = (select count(mid) as count from register1)

set @maintenace = (select maintenance from charges);
--set @maintenace = (select municipaltax from charges);
set @municipaltax = (select municipaltax from charges);
set @watercharges = (select watercharges from charges);
set @gymcharges = (select gymcharges from charges);
set @parkingcharges = (select parkingcharges from charges);
set @penalty = (select penalty from charges);
set @interest = (select interestRate from charges);

------------------- vehicle -------------------

set @vehicle2 = (select wheel2 from flatdetails where mid=@mid)
set @vehicle4 = (select wheel4 from flatdetails where mid=@mid)

set @parkingchargesF = (@vehicle2 * @parkingcharges )+( @vehicle4 * @parkingcharges);
-------------------------------------------------

set @total = @maintenace + @municipaltax + @watercharges + @gymcharges + @parkingchargesF;

set @amountDue = (select top 1 case when billpaid <> 'no' then 0 else totalAmount end from tbl_bill_mst where mid=@mid order by billid desc);

if @amountDue <> ''
begin
	set @interestR = @amountDue * (@interest/100);
	set @interestR = ROUND(@interestR,2);
end
else
begin
	set @amountDue=0;
	set @interestR=0;
end
set @discount=0;

set @totalAmount = @total + @amountDue + @interestR;

insert into tbl_bill_mst values (dbo.fnBillId(),@maintenace,@municipaltax,@watercharges,@gymcharges,@parkingchargesF,10,@total,@amountDue,@interestR,@discount,@totalAmount,@mnth,@yr,@mid,'NO')
end




--truncate table tbl_bill_mst

--exec dbo.generateBillFor 'mid0001','June',2013

--update tbl_bill_mst set billpaid ='yes' where billid='bil0008'

--select * from tbl_bill_mst

--delete from tbl_bill_mst where billid='bil0005'

--select top 1 case when billpaid = 'NO' then amountDue else amountDue end  
--from tbl_bill_mst where mid = 'mid0001' order by billid desc


--select amountDue from tbl_bill_mst where mid='mid0001'
--select top 1 case when billpaid <> 'no' then 0 else totalAmount end from tbl_bill_mst where mid='mid0001' order by billid desc
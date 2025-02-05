--begin transaction

create function fnBillId()
returns varchar(20)
as
begin
declare
@id int,@newId int,@billid varchar(20);
set @id = (select max(convert(int,substring(billid,4,len(billid)))) as id from tbl_bill_mst);

	if @id <> ''
	begin
		set @newId = @id+1;
	end

	else
	begin
		set @newId = 1;
	end


	if @newId < 10
	begin
		set @billid = 'bil000'+CONVERT(varchar,@newId);
	end
	
	
	else if @newId < 100
	begin
		set @billid = 'bil00'+CONVERT(varchar,@newId);
	end


	else if @newId < 1000
	begin
		set @billid = 'bil0'+CONVERT(varchar,@newId);
	end

	
	else
	begin
		set @billid = 'bil'+CONVERT(varchar,@newId);
	end
 return @billid;

end


--commit transaction
--print dbo.fnBillId()

--insert into tbl_bill_mst values ('bil0001',12,12,12,12,12,12,12,21,21,12,21,'April',2018,'mid0001')

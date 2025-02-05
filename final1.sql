create database Society;
GO
use Society;

create table feedback
(
name varchar(15) not null,
email varchar(40) not null,
feedback1 varchar(50) not null,
)


CREATE TABLE register1
(
	[mid] [varchar](15) NOT NULL primary key,
	[firstname] [varchar](10) NOT NULL,
	[lastname] [varchar](10) NOT NULL,
	[emailid] [varchar](30) NOT NULL,
	[password1] [varchar](20) NOT NULL,
	[dob] [datetime] NOT NULL,
	[gender] [varchar](10) NOT NULL,
	[mobile] [numeric](10, 0) NOT NULL,
	[landline] [numeric](10, 0) NOT NULL,
	[usertype] [varchar](30) NOT NULL,
	[theme] [varchar](30) NOT NULL,
)
create table contactList
(
contactId int Identity(1,1) primary key,
name varchar(30) not null,
designation varchar(30) not null,
contactno numeric(10,0) not null
);

create table notice
(
 noticeId int primary key identity not null,
 noticeMsg varchar(max),
 noticeDate date
);
create table flatdetails
(
mid varchar(15) references register1(mid),
wing char not null,
flatno numeric(4,0) not null,
sharecerti varchar(20) not null,
wheel2 int not null,
wheel4 int not null,
rent varchar(3) not null
);
create table booking
(
mid varchar(15) references register1(mid),
purpose varchar(max) not null,
fromdate date not null,
tilldate date not null,
slot varchar(50) null,
); 


create table edit_details
(
  mid varchar(15) references register1(mid),
  nomineename varchar(30) not null,
  dobn date not null,
  no_of_members int not null 
);
create table charges(
chargeid int primary key identity,
maintenance numeric(4,0),
municipaltax numeric(4,0),
watercharges numeric(4,0),
gymcharges numeric(4,0),
parkingcharges numeric(4,0),
penalty numeric(4,0),
interestrate numeric(4,0)
);
create table tbl_bill_mst
(
billid varchar(20) primary key,
maintenance money,
municipaltax money,
watercharges money,
gymcharges money,
parkingcharges money,
miscellaneous money,
total money,
amountDue money,
interest money,
dicount money,
totalAmount money,
billMonth varchar(20),
billYear int,
mid varchar(15) references register1(mid),
billPaid varchar(10)
);


select * from register1;
select * from contactList;
select * from notice;
select * from flatdetails;
select * from booking;
select * from edit_details;
select * from charges;
select * from tbl_bill_mst;
select * from feedback;
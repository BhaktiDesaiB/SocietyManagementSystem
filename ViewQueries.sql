USE [Society]
GO

/****** Object:  View [dbo].[vwForum]    Script Date: 03/14/2019 21:55:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


	create view [dbo].[vwForum]
	as
	select forumId as [Forum ID],forumTitle as [Title],CONVERT(varchar,forumDate,106) as [Created On],r.firstname+''+r.lastname as [Name] from tbl_forum_mst f join register1 r on f.forumCreatedBy=r.mid
GO

/****** Object:  View [dbo].[vwThread]    Script Date: 03/14/2019 21:55:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vwThread]
as
select threadId as [Thread ID],
threadText as [Thread Post],
r.firstname+' '+r.lastname as Name,
CONVERT(varchar,CreateOn,106) as [Created On],
f.forumTitle as [Title],
CONVERT(varchar,f.forumDate,106) as [Forum Started On],
case when f.forumCreatedBy <> ''then
	(select firstname+' '+lastname from register1 where mid=f.forumCreatedBy)
end as [Forum By],
t.forumId as ForumID
from tbl_forum_thread_mst t 
join register1 r on r.mid=t.threadBy
join tbl_forum_mst f on f.forumId=t.forumId

GO


USE [Society]
GO

/****** Object:  Table [dbo].[tbl_forum_mst]    Script Date: 03/14/2019 21:55:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_forum_mst](
	[forumId] [varchar](30) NOT NULL,
	[forumTitle] [varchar](150) NOT NULL,
	[forumDate] [datetime] NOT NULL,
	[forumCreatedBy] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[forumId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [Society]
GO

/****** Object:  Table [dbo].[tbl_forum_thread_mst]    Script Date: 03/14/2019 21:55:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_forum_thread_mst](
	[threadId] [varchar](40) NOT NULL,
	[threadText] [text] NOT NULL,
	[threadBy] [varchar](15) NULL,
	[forumId] [varchar](30) NULL,
	[createOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[threadId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[tbl_forum_mst]  WITH CHECK ADD FOREIGN KEY([forumCreatedBy])
REFERENCES [dbo].[register1] ([mid])
GO

ALTER TABLE [dbo].[tbl_forum_thread_mst]  WITH CHECK ADD FOREIGN KEY([forumId])
REFERENCES [dbo].[tbl_forum_mst] ([forumId])
GO

ALTER TABLE [dbo].[tbl_forum_thread_mst]  WITH CHECK ADD FOREIGN KEY([threadBy])
REFERENCES [dbo].[register1] ([mid])
GO


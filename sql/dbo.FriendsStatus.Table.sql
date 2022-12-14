USE [Kommu]
GO
/****** Object:  Table [dbo].[FriendsStatus]    Script Date: 8/1/2022 4:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FriendsStatus](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](20) NULL,
 CONSTRAINT [PK_FriendsStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

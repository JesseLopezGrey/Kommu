USE [Kommu]
GO
/****** Object:  Table [dbo].[ConnectedFriends]    Script Date: 8/1/2022 4:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConnectedFriends](
	[SenderId] [int] NOT NULL,
	[RecipientId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ConnectedFriends] PRIMARY KEY CLUSTERED 
(
	[SenderId] ASC,
	[RecipientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ConnectedFriends] ADD  CONSTRAINT [DF_Friends_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[ConnectedFriends] ADD  CONSTRAINT [DF_Friends_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[ConnectedFriends]  WITH CHECK ADD  CONSTRAINT [FK_ConnectedFriends_FriendsStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[FriendsStatus] ([Id])
GO
ALTER TABLE [dbo].[ConnectedFriends] CHECK CONSTRAINT [FK_ConnectedFriends_FriendsStatus]
GO
ALTER TABLE [dbo].[ConnectedFriends]  WITH CHECK ADD  CONSTRAINT [FK_ConnectedFriends_Users] FOREIGN KEY([SenderId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[ConnectedFriends] CHECK CONSTRAINT [FK_ConnectedFriends_Users]
GO
ALTER TABLE [dbo].[ConnectedFriends]  WITH CHECK ADD  CONSTRAINT [FK_ConnectedFriends_Users1] FOREIGN KEY([RecipientId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[ConnectedFriends] CHECK CONSTRAINT [FK_ConnectedFriends_Users1]
GO

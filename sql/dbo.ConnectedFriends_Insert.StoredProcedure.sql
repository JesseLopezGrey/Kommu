USE [Kommu]
GO
/****** Object:  StoredProcedure [dbo].[ConnectedFriends_Insert]    Script Date: 8/1/2022 4:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------------------------------
-- Author: Jesse Lopez
-- Create date: 6-July-2022
-- Description: Insert to ConnectedFriends

-- MODIFIED BY:
-- MODIFIED DATE:
-- Code Reviewer:
-- Note:
--------------------------------------------------


CREATE PROC [dbo].[ConnectedFriends_Insert]
 	             @SenderId int 
				,@RecipientId int 
				,@StatusId  int  
			
AS

/* ---- TEST CODE ----
Declare  @SenderId int =  53
Declare  @RecipientId int = 53
        ,@StatusId int = 1
	   				
EXECUTE dbo.ConnectedFriends_Insert 
 @SenderId 
,@RecipientId 
,@StatusId  


SELECT * FROM dbo.ConnectedFriends
Where SenderId  = @SenderId
SELECT * FROM dbo.Users
*/ ---- END TEST CODE ----

BEGIN

	IF(@SenderId != @RecipientId)
	BEGIN 
		INSERT INTO [dbo].[ConnectedFriends]
					(
					[SenderId]
					,[RecipientId]
					,[StatusId]
					)
				VALUES
					(  @SenderId
					,@RecipientId  
					,@StatusId 
					)
	END
	ELSE 
		RAISERROR ('RECIPIENT and SENDER are the same', 16, 1)


END


GO

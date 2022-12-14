USE [Kommu]
GO
/****** Object:  StoredProcedure [dbo].[ConnectedFriends_Update]    Script Date: 8/1/2022 4:40:13 PM ******/
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

CREATE PROC [dbo].[ConnectedFriends_Update]
                 @SenderId int 
				,@RecipientId int 
				,@StatusId  int  
			
AS

/*----- TEST CODE

DECLARE  @SenderId int = 1
         ,@RecipientId int = 2
		,@StatusId int = 2
		
EXECUTE dbo.ConnectedFriends_Update
         @SenderId 
		,@RecipientId  
		,@StatusId 
	  


SELECT *
FROM dbo.ConnectedFriends
WHERE Id = @Id

END TEST CODE ------*/


BEGIN

Declare @dateNow datetime2(7) = getutcdate()

UPDATE [dbo].[ConnectedFriends]

   SET 
       SenderId = @SenderId
      ,RecipientId = @RecipientId
      ,[StatusId] =  @StatusId   
      ,[DateModified] = @dateNow

  WHERE SenderId = @SenderId AND RecipientId = @RecipientId

END

GO

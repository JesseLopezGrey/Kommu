USE [Kommu]
GO
/****** Object:  StoredProcedure [dbo].[ConnectedFriends_SelectAll]    Script Date: 8/1/2022 4:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------------------------------
-- Author: Jesse Lopez
-- Create date: 6-July-2022
-- Description: SelectAll to ConnectedFriends

-- MODIFIED BY:
-- MODIFIED DATE:
-- Code Reviewer:
-- Note:
--------------------------------------------------

CREATE PROC [dbo].[ConnectedFriends_SelectAll]
			@PageIndex int
			,@PageSize int

AS

/*------ TEST CODE--------

DECLARE @PageIndex int = 0
DECLARE @PageSize int = 20

EXECUTE dbo.ConnectedFriends_SelectAll
		@PageIndex
		,@PageSize

------END TEST CODE -----*/

BEGIN

DECLARE @Offset int = @PageIndex * @PageSize

SELECT [SenderId]
      ,[RecipientId]
      ,[StatusId]
	  ,TotalCount = COUNT(1) OVER()
  FROM [dbo].[ConnectedFriends]
    ORDER BY SenderId
	OFFSET @Offset ROWS
	FETCH NEXT @PageSize ROWS ONLY

END


GO

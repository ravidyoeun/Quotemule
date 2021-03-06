USE [C27]
GO
/****** Object:  StoredProcedure [dbo].[UserProfile_GetByuserId]    Script Date: 3/22/2017 2:10:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER proc [dbo].[UserProfile_GetByuserId]
		@userId nvarchar(128)
AS

BEGIN

SELECT 
	 
	[UserProfile].[userId]
	,[AspNetUsers].[email]
	,[firstName]
	,[lastName]
	,[Company].[name] as companyName
	,[UserProfile].[phoneNumber]
	,[Media].[url]
	,[Media].[id]
	

FROM [dbo].[UserProfile]
LEFT JOIN [dbo].[Media]
ON UserProfile.mediaId = Media.id
LEFT JOIN [dbo].[Company]
ON UserProfile.companyId = Company.id
LEFT JOIN [dbo].AspNetUsers
ON UserProfile.userId = AspNetUsers.id
LEFT JOIN [dbo].AspNetRoles
ON UserProfile.userId = [dbo].AspNetRoles.Id
WHERE UserProfile.userId = @userId

END

/*-------------TEST CODE -------------------

DECLARE @userId nvarchar(128) = '92613a80-991a-405b-9bbc-735db95c0266'

EXECUTE [dbo].[UserProfile_GetByuserId]
		@userId

*/
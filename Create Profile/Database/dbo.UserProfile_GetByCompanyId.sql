USE [C27]
GO
/****** Object:  StoredProcedure [dbo].[UserProfile_GetByCompanyId]    Script Date: 3/22/2017 2:10:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER proc [dbo].[UserProfile_GetByCompanyId]
		@companyId int
	   ,@CurrentPage int = 1
	   ,@ItemsPerPage int = 10
AS

BEGIN

SELECT 
	 COUNT (*) OVER () AS TotalCount
	,UserProfile.[userId]
	,AspNetUsers.[email]
	,[firstName]
	,[lastName]
	,[Media].[url]
	,[AspNetRoles].[name] as userRole
	,[Company].[name] as companyName
	,[UserProfile].[phoneNumber]
	,[UserProfile].[mediaId]
	

FROM [dbo].[UserProfile]
LEFT JOIN [dbo].[Media]
ON UserProfile.mediaId = Media.id
INNER JOIN [dbo].[Company]
ON UserProfile.companyId = Company.Id
LEFT JOIN [dbo].AspNetUsers
ON UserProfile.userid = AspNetUsers.id
LEFT JOIN [dbo].AspNetRoles
ON UserProfile.userid = [dbo].AspNetRoles.Id
WHERE UserProfile.[companyId] = @companyId

ORDER BY UserProfile.[userId]
OFFSET (@CurrentPage - 1) * @ItemsPerPage ROWS
FETCH NEXT @ItemsPerPage ROWS ONLY 

END

/*-------------TEST CODE -------------------

DECLARE @companyId int = 20
	 ,@CurrentPage int = 1
	,@ItemsPerPage int = 10

EXECUTE [dbo].[UserProfile_GetByCompanyId]
		@companyId

*/
USE [C27]
GO
/****** Object:  StoredProcedure [dbo].[UserProfile_Delete]    Script Date: 3/22/2017 2:09:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UserProfile_Delete]
	@userId nvarchar(256)
AS

BEGIN

DELETE FROM [dbo].[UserProfile]
WHERE [userId] = @userId

END

/*------------TEST CODE ---------------------

DECLARE @userId nvarchar(256) = 'replace@me.com'

SELECT [id]
	,[userId]
    ,[firstName]
	,[lastName]	
	,[City]
	,[State]
	,[zipCode]
	,[jobTitle]
	,[companyName]
	,[phoneNumber]
	,[mediaId]
	
FROM [dbo].[UserProfile]
WHERE [userId] = @userId

EXECUTE [dbo].[UserProfile_Delete]
	@id

SELECT [id]
	,[userId]
    ,[firstName]
	,[lastName]	
	,[City]
	,[State]
	,[zipCode]
	,[jobTitle]
	,[companyName]
	,[phoneNumber]
	,[mediaId]

FROM [dbo].[UserProfile]
WHERE [userId] = @userId

---------------------------------------------*/
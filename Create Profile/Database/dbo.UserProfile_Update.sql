USE [C27]
GO
/****** Object:  StoredProcedure [dbo].[UserProfile_Update]    Script Date: 3/22/2017 2:11:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER Procedure [dbo].[UserProfile_Update]
	
	 @userId	 nvarchar(256)
	,@firstName	nvarchar(150)
	,@lastName	nvarchar(150)
	,@phoneNumber nvarchar(MAX) = null
	,@mediaId int

AS
BEGIN
UPDATE dbo.UserProfile

SET 
	[userId] = @userId,
	[firstName] = @firstName,
	[lastName] = @lastName,	
	[phoneNumber] = @phoneNumber,
	[mediaId] = @mediaId


WHERE userId = @userId

END

/*-------------TEST CODE -------------------


DECLARE
		 @userId	 nvarchar(256) ='37bdb705-3223-4133-886d-24fd6d7c76df'
		,@firstName	nvarchar(150) = 'Jimmy'
		,@lastName	nvarchar(150) = 'Young'
		,@address	nvarchar(256) = 'Seattle'
		,@jobTitle	nvarchar(150) = 'Developer'
		,@companyName nvarchar(150) = 'Google'
		,@phoneNumber int
		,@Id int = 14
	
EXECUTE [dbo].[UserProfile_Update]
		 @userId	 
		,@firstName	
		,@lastName	
		,@address
		,@jobTitle	
		,@companyName 
		,@phoneNumber             
                            	
SELECT 
		  [id]
		 ,[userId]
		,[firstName]
		,[lastName]
		,[city]	
		,[state]
		,[zipCode] 
		,[jobTitle]	
		,[companyName]
		,[phoneNumber]
		,[mediaId]   


FROM [dbo].[UserProfile]

*/
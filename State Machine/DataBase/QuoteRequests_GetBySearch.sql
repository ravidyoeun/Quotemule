USE [C27]
GO
/****** Object:  StoredProcedure [dbo].[QuoteRequests_GetBySearch]    Script Date: 3/19/2017 9:04:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER proc [dbo].[QuoteRequests_GetBySearch]/*this is the name of your SQL function, CREATE FIRST then ALTER*/
	@CompanyId int
	-- radius
	-- address / geocodes
	-- categories

AS

BEGIN

SELECT [Id]
    , [UserId]
	,[CompanyId]
	,[Name]
	,[DueDate]
	,[CreatedDate]
	,[UpdatedDate]
	,[StatusId]

FROM dbo.QuoteRequests
-- join qritems table on qrId
-- WHERE catagories AND 

END

/*-------------TEST CODE -------------------


Execute QuoteRequests_GetById 1



DECLARE
	@blogid int =12235

EXECUTE dbo.get_all_comments
		@blogid
	    
*/
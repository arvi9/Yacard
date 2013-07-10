
/****** Object:  StoredProcedure [dbo].[AvailableMail]    Script Date: 07/10/2013 19:53:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[AvailableMail] 
(
@email Nvarchar(50)
)
as

Select UserId,Username,Email from UserRegistration where Email=LTrim(RTrim(@email)) 




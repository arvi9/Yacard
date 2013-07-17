USE [YardeCart]
GO
/****** Object:  StoredProcedure [dbo].[SearchUsers]    Script Date: 07/17/2013 22:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SearchUsers]
(
@Keyword varchar(50)
)
as
select * from UserRegistration where UserName like '%'+ltrim(rtrim(@Keyword))+'%'
order by UserName
GO
/****** Object:  StoredProcedure [dbo].[SearchAdsByUsername]    Script Date: 07/17/2013 22:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SearchAdsByUsername]
(
@Keyword varchar(50)
)
as
select 
A.AdPostTitle,A.AdBlocked,A.AdDeleted,A.AdPostId,
U.UserName,U.FirstName,U.LastName,U.Email,U.UserBlocked,U.UserDeleted,U.UserID
 from AdDetails A, UserRegistration U 
where U.UserName like '%'+ltrim(rtrim(@Keyword))+'%' and A.UserId=U.UserID
order by A.AdPostTitle
GO
/****** Object:  StoredProcedure [dbo].[SearchAdsByAdtitle]    Script Date: 07/17/2013 22:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SearchAdsByAdtitle]
(
@Keyword varchar(50)
)
as
select 
A.AdPostTitle,A.AdBlocked,A.AdDeleted,A.AdPostId,
U.UserName,U.FirstName,U.LastName,U.Email,U.UserBlocked,U.UserDeleted,U.UserID
 from AdDetails A, UserRegistration U 
where A.AdPostTitle like '%'+ltrim(rtrim(@Keyword))+'%' and A.UserId=U.UserID
order by A.AdPostTitle
GO

USE [YogiSabhaGruh]
GO
/****** Object:  StoredProcedure [dbo].[AUD_YSG_Inventory_Master]    Script Date: 30-07-2016 15:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[AUD_YSG_User_Master]
@Action CHAR(1)
,@user_no NUMERIC(5)
,@user_name nvarchar(50)
,@user_login_id nvarchar(15)
,@User_password nvarchar(500)
,@Mobile_No nvarchar(15)
,@Email_id nvarchar(50)
,@created_By numeric(5,0)

AS
BEGIN

IF @ACTION = 'A'
BEGIN
INSERT INTO [dbo].[YSG_User_Master]
           (
            [user_name]
           ,[user_login_id]
           ,[User_password]
		   ,[Mobile_No]          
		   ,[Email_id]
		   ,[IsActive]
           ,[created_By]
           ,[created_datetime])
     VALUES
           (
			 @user_name
			,@user_login_id
			,@User_password
			,@Mobile_No
			,@Email_id
			,'Y'
			,@created_By
			,GETDATE())
END
ELSE IF @ACTION = 'U'
BEGIN
UPDATE [dbo].[YSG_User_Master]
   SET
    		[user_name] =@user_name
           ,[user_login_id] = @user_login_id
           ,[User_password] = @User_password
		   ,[Mobile_No]     = @Mobile_No 
		   ,[Email_id] = @Email_id		  
		   ,[Updated_By] = @created_By
		   ,[Updated_Datetime] = GETDATE()
 WHERE user_no = @user_no
END


END


USE [YogiSabhaGruh]
GO

/****** Object:  StoredProcedure [dbo].[ADD_YSG_Customer_Info]    Script Date: 01-05-2016 14:43:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[ADD_YSG_Customer_Info]
 @Action Char(1)
,@Customer_no numeric(12,0)
,@Customer_name nvarchar(50)
,@Customer_Address nvarchar(2000)
,@Landline_No nvarchar(50)
,@Fax_No nvarchar(50)
,@Mobile_No nvarchar(50)
,@Email_id nvarchar(100)
,@Customer_Status nvarchar(25)
,@Referred_By nvarchar(500)
,@Customer_Type nvarchar(1)
,@Comments nvarchar(2000)
,@created_By numeric(5,0)
AS
BEGIN
---------------------------------------------------------------
/*
--	Use Below script to execute package
--	This Package will add new Venue/Hall in [YSG_Customer_Info] table
EXEC ADD_YSG_Customer_Info 'A',0, 'Ghanshyam Patel','S.V. Road, Mulunnd','022 2568798','02245786','9898565689','patels@gmail.com'
,'******','Sanjay Dave','Satsangi','No Comments',1
*/
---------------------------------------------------------------
IF @ACTION = 'A'
BEGIN

INSERT INTO [dbo].[YSG_Customer_Info]
           ([Customer_name]
           ,[Customer_Address]
           ,[Landline_No]
           ,[Fax_No]
           ,[Mobile_No]
           ,[Email_id]
           ,[Customer_Status]
           ,[Referred_By]
           ,[Customer_Type]
           ,[Comments]
           ,[created_By]
           ,[created_datetime]
           )
     VALUES
           (@Customer_name
			,@Customer_Address
			,@Landline_No
			,@Fax_No
			,@Mobile_No
			,@Email_id
			,@Customer_Status
			,@Referred_By
			,@Customer_Type
			,@Comments
			,@created_By
			,GETDATE()
			)
		
SELECT	@@IDENTITY;
END

ELSE IF @ACTION = 'U'
BEGIN
UPDATE YSG_Customer_Info 
SET 
  [Customer_name] = @Customer_name
 ,[Customer_Address] = @Customer_Address
 ,[Landline_No] = @Landline_No
 ,[Fax_No] = @Fax_No
 ,[Mobile_No] = @Mobile_No
 ,[Email_id] = @Email_id
 ,[Customer_Status] = @Customer_Status
 ,[Referred_By] = @Referred_By			
 ,[Comments] = @Comments
WHERE Customer_no = @Customer_no     

SELECT @Customer_no;
END

END
GO



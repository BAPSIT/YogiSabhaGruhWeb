USE [master]
GO
/****** Object:  Database [YogiSabhaGruh]    Script Date: 14-04-2016 20:12:57 ******/
CREATE DATABASE [YogiSabhaGruh]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'YogiSabhaGruh', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\YogiSabhaGruh.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'YogiSabhaGruh_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\YogiSabhaGruh_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [YogiSabhaGruh] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [YogiSabhaGruh].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [YogiSabhaGruh] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [YogiSabhaGruh] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [YogiSabhaGruh] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [YogiSabhaGruh] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [YogiSabhaGruh] SET ARITHABORT OFF 
GO
ALTER DATABASE [YogiSabhaGruh] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [YogiSabhaGruh] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [YogiSabhaGruh] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [YogiSabhaGruh] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [YogiSabhaGruh] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [YogiSabhaGruh] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [YogiSabhaGruh] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [YogiSabhaGruh] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [YogiSabhaGruh] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [YogiSabhaGruh] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [YogiSabhaGruh] SET  DISABLE_BROKER 
GO
ALTER DATABASE [YogiSabhaGruh] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [YogiSabhaGruh] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [YogiSabhaGruh] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [YogiSabhaGruh] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [YogiSabhaGruh] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [YogiSabhaGruh] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [YogiSabhaGruh] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [YogiSabhaGruh] SET RECOVERY FULL 
GO
ALTER DATABASE [YogiSabhaGruh] SET  MULTI_USER 
GO
ALTER DATABASE [YogiSabhaGruh] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [YogiSabhaGruh] SET DB_CHAINING OFF 
GO
ALTER DATABASE [YogiSabhaGruh] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [YogiSabhaGruh] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [YogiSabhaGruh]
GO
/****** Object:  StoredProcedure [dbo].[ADD_YSG_Customer_Info]    Script Date: 14-04-2016 20:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ADD_YSG_Customer_Info]
@Customer_name nvarchar(50)
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
EXEC ADD_YSG_Customer_Info 'Ghanshyam Patel','S.V. Road, Mulunnd','022 2568798','02245786','9898565689','patelsssssss@gmail.com'
,'******','Sanjay Dave','Satsangi','No Comments',1
*/
---------------------------------------------------------------
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
END

GO
/****** Object:  StoredProcedure [dbo].[ADD_YSG_Event_Master]    Script Date: 14-04-2016 20:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ADD_YSG_Event_Master] 
 @Event_name nvarchar(50)
,@Description nvarchar(2000)
,@created_By numeric(5,0)
AS 
BEGIN
---------------------------------------------------------------
/*
--	Use Below script to execute package
--	This Package will add new EVENT in [YSG_Event_Master] table
EXEC ADD_YSG_Event_Master 'Get Together','Get Together Desription',1
*/
---------------------------------------------------------------
INSERT INTO [dbo].[YSG_Event_Master]
           ([Event_name]
           ,[Description]
           ,[created_By]
           ,[created_datetime]
           )
     VALUES
           ( @Event_name 
			,@Description
			,@created_By
			,GETDATE())

END

GO
/****** Object:  StoredProcedure [dbo].[ADD_YSG_Hall_Master]    Script Date: 14-04-2016 20:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ADD_YSG_Hall_Master] @Hall_name NVARCHAR(50)
,@Capacity_seating numeric(10,0)
,@Capacity_chairs numeric(10,0)
,@Rent_per_hour numeric(19,4)
,@Description nvarchar(2000)
,@created_By numeric(5,0)
AS
BEGIN
---------------------------------------------------------------
/*
--	Use Below script to execute package
--	This Package will add new Venue/Hall in [YSG_Hall_Master] table
EXEC ADD_YSG_Hall_Master 'YSG Groud Floor Hall',500,200,6000,'Yogi Sabhagruh Grounf Floor hall',1
*/
---------------------------------------------------------------
INSERT INTO [dbo].[YSG_Hall_Master]
           ([Hall_name]
           ,[Capacity_seating]
           ,[Capacity_chairs]
           ,[Rent_per_hour]
           ,[Description]
           ,[created_By]
           ,[created_datetime]
           --,[Updated_By]
           --,[Updated_Datetime]
		   )
     VALUES
           (@Hall_name
           ,@Capacity_seating
           ,@Capacity_chairs
           ,@Rent_per_hour
           ,@Description
           ,@created_By
           ,GETDATE()
           )
END

GO
/****** Object:  StoredProcedure [dbo].[AUD_Booking_Contact_Persons]    Script Date: 14-04-2016 20:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[AUD_Booking_Contact_Persons]
@Booking_No numeric(12,0)
,@Contact_name nvarchar(50)
,@Contact_No nvarchar(50)
,@Contact_Email_id nvarchar(100)
,@created_By numeric(5,0)
,@ACTION CHAR(1)
,@Booking_Contact_Person_No numeric(6, 0)
AS
-------------------------------------------------------------------
--	THIS PROC IS USED FOR INSERT RECORDS INTO [YSG_Booking_Contact_Persons] TABLE
--	EXEC ADD_update_delete_Booking_Contact_Persons 1,'Asvin Patel','98982388888','aswinzxcvb@gmail.com',1,'I',null
--	EXEC ADD_update_delete_Booking_Contact_Persons 1,'Asvin Patel','98982388888','aswinpatel14785@gmail.com',1,'U',1
--	EXEC ADD_update_delete_Booking_Contact_Persons NULL,NULL,NULL,NULL,1,'D',1
-------------------------------------------------------------------
BEGIN
IF @ACTION = 'I'
BEGIN
INSERT INTO [dbo].[YSG_Booking_Contact_Persons]
           ([Booking_No]
           ,[Contact_name]
           ,[Contact_No]
           ,[Contact_Email_id]
           ,[created_By]
           ,[created_datetime]
		   )
     VALUES
           (@Booking_No
			,@Contact_name
			,@Contact_No
			,@Contact_Email_id
			,@created_By
			,GETDATE())
END
ELSE IF @ACTION = 'U'
BEGIN
UPDATE [dbo].[YSG_Booking_Contact_Persons]
   SET [Booking_No] = @Booking_No
      ,[Contact_name] = @Contact_name
      ,[Contact_No] = @Contact_No
      ,[Contact_Email_id] = @Contact_Email_id
      ,[Updated_By] = @created_By
      ,[Updated_Datetime] = getdate()
 WHERE Booking_Contact_Person_No = @Booking_Contact_Person_No

END
ELSE IF @ACTION = 'D'
BEGIN
DELETE [YSG_Booking_Contact_Persons]   
 WHERE Booking_Contact_Person_No = @Booking_Contact_Person_No

END



END



GO
/****** Object:  StoredProcedure [dbo].[AUD_YSG_Booking_Facilities]    Script Date: 14-04-2016 20:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[AUD_YSG_Booking_Facilities]
@ACTION CHAR(1)
,@Booking_Facility_No numeric(7,0)
,@Booking_No numeric(12,0)
,@Item_no numeric(5,0)
,@Required_Qty numeric(6,0)
,@Calculated_Amount MONEY
,@Remarks nvarchar(500)
,@created_By numeric(5,0)

AS
BEGIN
-------------------------------------------------------------------
--	THIS PROC ADD/UPDATE/DELETE RECORDS FROM YSG_Booking_Facilities TABLE 
--	EXEC AUD_YSG_Booking_Facilities 'A',NULL,1,1,1,1000,'BEFORE EVENT START',1
--	EXEC AUD_YSG_Booking_Facilities 'U',1,1,1,2,2000,'BEFORE EVENT START',1
--	EXEC AUD_YSG_Booking_Facilities 'D',1,NULL,NULL,NULL,NULL,NULL,1
-------------------------------------------------------------------
IF @ACTION = 'A'
BEGIN
INSERT INTO [dbo].[YSG_Booking_Facilities]
           ([Booking_No]
           ,[Item_no]
           ,[Required_Qty]
           ,[Calculated_Amount]
           ,[Remarks]
		   ,IsActive
           ,[created_By]
           ,[created_datetime]
       )
     VALUES
           (@Booking_No
           ,@Item_no
           ,@Required_Qty
           ,@Calculated_Amount
           ,@Remarks
		   ,'Y'
           ,@created_By
           ,getdate())
END

IF @ACTION = 'U'
BEGIN
UPDATE [dbo].[YSG_Booking_Facilities]
   SET [Booking_No] = @Booking_No
      ,[Item_no] = @Item_no
      ,[Required_Qty] = @Required_Qty
      ,[Calculated_Amount] = @Calculated_Amount
      ,[Remarks] = @Remarks
      ,[Updated_By] = @created_By
      ,[Updated_Datetime] = GETDATE()      
      ,[IsActive] = 'Y'
 WHERE Booking_Facility_No = @Booking_Facility_No
END

IF @ACTION = 'D'
BEGIN
UPDATE [dbo].[YSG_Booking_Facilities]
   SET [Updated_By] = @created_By
      ,[Updated_Datetime] = GETDATE()      
      ,[IsActive] = 'N'
 WHERE Booking_Facility_No = @Booking_Facility_No
END

   
END

GO
/****** Object:  StoredProcedure [dbo].[AUD_YSG_Booking_Info]    Script Date: 14-04-2016 20:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[AUD_YSG_Booking_Info]
@Action Char(1)
,@Booking_No numeric(12,0)
,@Booking_ID numeric(12,0)
,@Booking_Date datetime
,@Booking_FromTime datetime
,@Booking_ToTime datetime
,@Event_no numeric(5,0)
,@Event_Class varchar(50)
,@Customer_no numeric(10,0)
,@Booking_Status nvarchar(1)
,@No_Of_Invitees numeric(6,0)
,@Booking_calculated_Amt numeric(19,4)
,@Discount numeric(19,4)
,@Discount_Reason nvarchar(2000)
,@Booking_final_Amt numeric(19,4)
,@RemarkOrComments nvarchar(2000)
,@Paid_Amt numeric(19,4)
,@Balance_Amt numeric(19,4)
,@created_By numeric(5,0)

AS
BEGIN
---------------------------------------------------------------
/*
--	Use Below script to ADD/UPDATE/DELETE BOOKING RECORDS
EXEC [AUD_YSG_Booking_Info] 'A',NULL,'20160320002','03/18/2016','9:00 AM','9:00 PM',1,'Medium Class',1,I,500,15000,1000,'SATSANGI',14000,'NO COMMENTS',2000,12000,1
EXEC [AUD_YSG_Booking_Info] 'U',2,'20160320002','03/18/2016','9:00 AM','9:00 PM',1,'Medium Class',1,I,500,15000,1000,'SATSANGI',14000,'NO COMMENTS',2000,12000,1
EXEC [AUD_YSG_Booking_Info] 'D',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1

*/
---------------------------------------------------------------
IF @ACTION = 'A'
BEGIN
INSERT INTO [dbo].[YSG_Booking_Info]
           ([Booking_ID]
           ,[Booking_Date]
           ,[Booking_FromTime]
           ,[Booking_ToTime]
           ,[Event_no]
		   ,Event_Class
           ,[Customer_no]
           ,[Booking_Status]
           ,[No_Of_Invitees]
           ,[Booking_calculated_Amt]
           ,[Discount]
           ,[Discount_Reason]
           ,[Booking_final_Amt]
           ,[RemarkOrComments]
           ,[Paid_Amt]
           ,[Balance_Amt]
		   ,IsActive
           ,[created_By]
           ,[created_datetime]
           )
     VALUES
           (@Booking_ID
			,@Booking_Date 
			,@Booking_FromTime 
			,@Booking_ToTime 
			,@Event_no 
			,@Event_Class
			,@Customer_no
			,@Booking_Status 
			,@No_Of_Invitees 
			,@Booking_calculated_Amt 
			,@Discount 
			,@Discount_Reason 
			,@Booking_final_Amt 
			,@RemarkOrComments 
			,@Paid_Amt 
			,@Balance_Amt 
			,'Y'
			,@created_By 
			,GETDATE()
		   )
END

ELSE IF @ACTION = 'U'
BEGIN
UPDATE [dbo].[YSG_Booking_Info]
   SET [Booking_ID] = @Booking_ID
      ,[Booking_Date] = @Booking_Date
      ,[Booking_FromTime] = @Booking_FromTime
      ,[Booking_ToTime] = @Booking_ToTime
      ,[Event_no] = @Event_no
	  ,Event_Class = @Event_Class
      ,[Customer_no] = @Customer_no
      ,[Booking_Status] = @Booking_Status
      ,[No_Of_Invitees] = @No_Of_Invitees
      ,[Booking_calculated_Amt] = @Booking_calculated_Amt
      ,[Discount] = @Discount
      ,[Discount_Reason] = @Discount_Reason
      ,[Booking_final_Amt] = @Booking_final_Amt
      ,[RemarkOrComments] = @RemarkOrComments
      ,[Paid_Amt] = @Paid_Amt
      ,[Balance_Amt] = @Balance_Amt      
      ,[Updated_By] = @created_By
      ,[Updated_Datetime] = GETDATE()
 WHERE Booking_No = @Booking_No
END
ELSE IF @ACTION = 'D'
BEGIN
UPDATE [dbo].[YSG_Booking_Info]
   SET IsActive = 'N'    
      ,[Updated_By] = @created_By
      ,[Updated_Datetime] = GETDATE()
 WHERE Booking_No = @Booking_No
END

END

GO
/****** Object:  StoredProcedure [dbo].[AUD_YSG_Inventory_Master]    Script Date: 14-04-2016 20:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[AUD_YSG_Inventory_Master]
@ACTION CHAR(1)
,@Item_no NUMERIC(5)
,@Item_name nvarchar(50)
,@Related_Dept_No numeric(5,0)
,@Available_Qty numeric(18,0)
,@Rent_per_Qty numeric(19,4)
,@Description nvarchar(2000)
,@created_By numeric(5,0)

AS
-------------------------------------------------------------------
--	THIS PROC IS USED FOR ADD/UPDATE/DELETE RECORDS INTO [YSG_Booking_Contact_Persons] TABLE
--	EXEC AUD_YSG_Inventory_Master 'A',NULL,'SPEAKER',10,2,1200,'Audio SPEAKER',1
--	EXEC AUD_YSG_Inventory_Master 'U',2,'SPEAKER',10,12,1500,'Audio SPEAKER',1
--	EXEC AUD_YSG_Inventory_Master 'D',2,NULL,NULL,NULL,NULL,NULL,1
-------------------------------------------------------------------
BEGIN

IF @ACTION = 'A'
BEGIN
INSERT INTO [dbo].[YSG_Inventory_Master]
           ([Item_name]
           ,[Related_Dept_No]
           ,[Available_Qty]
           ,[Rent_per_Qty]
           ,[Description]
		   ,IsActive
           ,[created_By]
           ,[created_datetime])
     VALUES
           (@Item_name
			,@Related_Dept_No
			,@Available_Qty
			,@Rent_per_Qty
			,@Description
			,'Y'
			,@created_By
			,GETDATE())
END
ELSE IF @ACTION = 'U'
BEGIN
UPDATE [dbo].[YSG_Inventory_Master]
   SET [Item_name] = @Item_name
      ,[Related_Dept_No] = @Related_Dept_No
      ,[Available_Qty] = @Available_Qty
      ,[Rent_per_Qty] = @Rent_per_Qty
      ,[Description] = @Description
      ,[Updated_By] = @created_By
      ,[Updated_Datetime] = GETDATE()
 WHERE Item_no = @Item_no
END
ELSE IF @ACTION = 'D'
BEGIN
 UPDATE [YSG_Inventory_Master]
 SET IsActive = 'N'
 ,[Updated_By] = @created_By
 ,[Updated_Datetime] = GETDATE()  
 WHERE Item_no = @Item_no
END


END

GO
/****** Object:  StoredProcedure [dbo].[GET_INVENTORY]    Script Date: 14-04-2016 20:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GET_INVENTORY]
@DefaultOnly bit = 0,
@Booking_No int=0
AS
BEGIN
  -- get_inventory 1,0 -- new event, get default inventory
  -- get 
 if @Booking_NO = 0
 BEGIN
SELECT [Item_no]
      ,[Item_name]
      ,[Related_Dept_No]
      ,[Available_Qty]
      ,[Rent_per_Qty]
      ,[Description]
      ,[created_By]
      ,[created_datetime]
      ,[Updated_By]
      ,[Updated_Datetime]
      ,[IsActive]
	  FROM [YSG_Inventory_Master]
	  Where (@DefaultOnly = IsDefault )--or (@DefaultOnly =0and IsDefault=0)
	  END
	  ELSE
	  BEGIN
	  SELECT * FROM YSG_Booking_Facilities
	  Where Booking_No = @Booking_No
	  END

END

GO
/****** Object:  StoredProcedure [dbo].[Get_TithiInfo]    Script Date: 14-04-2016 20:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PRocedure [dbo].[Get_TithiInfo]
@StartDate Datetime,
@endDate datetime
AS
BEGIN
  SELECT Tithi_Date, Tithi as TithiName, Description from ysg_tithi_info
  Where Tithi_Date>= @startDate and tithi_date<=@enddate
END



GO
/****** Object:  Table [dbo].[YSG_Booking_Catering_info]    Script Date: 14-04-2016 20:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YSG_Booking_Catering_info](
	[Booking_no] [numeric](12, 0) NULL,
	[Caterer_No] [numeric](5, 0) NULL,
	[event_Date] [datetime] NULL,
	[FoodType] [nvarchar](500) NULL,
	[Persons] [numeric](18, 0) NULL,
	[Rate_per_person] [numeric](18, 0) NULL,
	[Amount] [numeric](18, 0) NULL,
	[Booking_Catering_info_No] [numeric](8, 0) IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_YSG_Booking_Catering_info] PRIMARY KEY CLUSTERED 
(
	[Booking_Catering_info_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[YSG_Booking_Contact_Persons]    Script Date: 14-04-2016 20:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YSG_Booking_Contact_Persons](
	[Booking_No] [numeric](12, 0) NULL,
	[Contact_name] [nvarchar](50) NULL,
	[Contact_No] [nvarchar](50) NULL,
	[Contact_Email_id] [nvarchar](100) NULL,
	[created_By] [numeric](5, 0) NULL,
	[created_datetime] [datetime] NULL,
	[Updated_By] [numeric](5, 0) NULL,
	[Updated_Datetime] [datetime] NULL,
	[Booking_Contact_Person_No] [numeric](6, 0) NOT NULL,
 CONSTRAINT [PK_YSG_Booking_Contact_Persons] PRIMARY KEY CLUSTERED 
(
	[Booking_Contact_Person_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[YSG_Booking_Facilities]    Script Date: 14-04-2016 20:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[YSG_Booking_Facilities](
	[Booking_No] [numeric](12, 0) NULL,
	[Item_no] [numeric](5, 0) NULL,
	[Required_Qty] [numeric](6, 0) NULL,
	[Calculated_Amount] [money] NULL,
	[Remarks] [nvarchar](500) NULL,
	[created_By] [numeric](5, 0) NULL,
	[created_datetime] [datetime] NULL,
	[Updated_By] [numeric](5, 0) NULL,
	[Updated_Datetime] [datetime] NULL,
	[Booking_Facility_No] [numeric](7, 0) NOT NULL,
	[IsActive] [char](1) NULL,
 CONSTRAINT [PK_YSG_Booking_Facilities] PRIMARY KEY CLUSTERED 
(
	[Booking_Facility_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[YSG_Booking_Hall_Info]    Script Date: 14-04-2016 20:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YSG_Booking_Hall_Info](
	[Booking_No] [numeric](12, 0) NULL,
	[Hall_no] [numeric](5, 0) NULL,
	[created_By] [numeric](5, 0) NULL,
	[created_datetime] [datetime] NULL,
	[Updated_By] [numeric](5, 0) NULL,
	[Updated_Datetime] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[YSG_Booking_Info]    Script Date: 14-04-2016 20:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[YSG_Booking_Info](
	[Booking_No] [numeric](12, 0) IDENTITY(1,1) NOT NULL,
	[Booking_ID] [numeric](12, 0) NULL,
	[Booking_Date] [datetime] NULL,
	[Booking_FromTime] [datetime] NULL,
	[Booking_ToTime] [datetime] NULL,
	[Event_no] [numeric](5, 0) NULL,
	[Event_Class] [varchar](50) NULL,
	[Customer_no] [numeric](10, 0) NULL,
	[Booking_Status] [nvarchar](1) NULL,
	[No_Of_Invitees] [numeric](6, 0) NULL,
	[Booking_calculated_Amt] [numeric](19, 4) NULL,
	[Discount] [numeric](19, 4) NULL,
	[Discount_Reason] [nvarchar](2000) NULL,
	[Booking_final_Amt] [numeric](19, 4) NULL,
	[RemarkOrComments] [nvarchar](2000) NULL,
	[Paid_Amt] [numeric](19, 4) NULL,
	[Balance_Amt] [numeric](19, 4) NULL,
	[created_By] [numeric](5, 0) NULL,
	[created_datetime] [datetime] NULL,
	[Updated_By] [numeric](5, 0) NULL,
	[Updated_Datetime] [datetime] NULL,
	[IsActive] [char](1) NULL,
 CONSTRAINT [PK__YSG_Book__35AB94AB109AF86F] PRIMARY KEY CLUSTERED 
(
	[Booking_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[YSG_Booking_Payment]    Script Date: 14-04-2016 20:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YSG_Booking_Payment](
	[Booking_No] [numeric](12, 0) NULL,
	[Payment_No] [numeric](12, 0) IDENTITY(1,1) NOT NULL,
	[Payment_Account_Head] [nvarchar](1) NULL,
	[Payment_Date] [datetime] NULL,
	[Cash_Cheque_Card] [nvarchar](25) NULL,
	[Bank_Name] [nvarchar](500) NULL,
	[Cheque_Card_No] [nvarchar](100) NULL,
	[Cheque_Date] [datetime] NULL,
	[Amount] [numeric](19, 4) NULL,
	[Amount_In_Words] [nvarchar](500) NULL,
	[Payment_Status] [nvarchar](1) NULL,
	[Remarks] [nvarchar](500) NULL,
	[created_By] [numeric](5, 0) NULL,
	[created_datetime] [datetime] NULL,
	[Updated_By] [numeric](5, 0) NULL,
	[Updated_Datetime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Payment_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[YSG_Caterer_Master]    Script Date: 14-04-2016 20:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[YSG_Caterer_Master](
	[Caterer_No] [numeric](5, 0) IDENTITY(1,1) NOT NULL,
	[Caterer_Name] [nvarchar](500) NULL,
	[Contact_NUMERIC] [nvarchar](50) NULL,
	[Remarks] [nvarchar](250) NULL,
	[Created_by] [numeric](5, 0) NULL,
	[created_Datetime] [datetime] NULL,
	[updated_by] [numeric](5, 0) NULL,
	[updated_datetime] [datetime] NULL,
	[is_Active] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[Caterer_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[YSG_Customer_Info]    Script Date: 14-04-2016 20:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YSG_Customer_Info](
	[Customer_no] [numeric](10, 0) IDENTITY(1,1) NOT NULL,
	[Customer_name] [nvarchar](50) NULL,
	[Customer_Address] [nvarchar](2000) NULL,
	[Landline_No] [nvarchar](50) NULL,
	[Fax_No] [nvarchar](50) NULL,
	[Mobile_No] [nvarchar](50) NULL,
	[Email_id] [nvarchar](100) NULL,
	[Customer_Status] [nvarchar](25) NULL,
	[Referred_By] [nvarchar](500) NULL,
	[Customer_Type] [nvarchar](1) NULL,
	[Comments] [nvarchar](2000) NULL,
	[created_By] [numeric](5, 0) NULL,
	[created_datetime] [datetime] NULL,
	[Updated_By] [numeric](5, 0) NULL,
	[Updated_Datetime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Customer_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[YSG_Department_Master]    Script Date: 14-04-2016 20:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YSG_Department_Master](
	[Dept_no] [numeric](5, 0) IDENTITY(1,1) NOT NULL,
	[Dept_name] [nvarchar](50) NULL,
	[IsActive] [numeric](1, 0) NULL,
	[created_By] [numeric](5, 0) NULL,
	[created_datetime] [datetime] NULL,
	[Updated_By] [numeric](5, 0) NULL,
	[Updated_Datetime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Dept_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[YSG_Employee_Master]    Script Date: 14-04-2016 20:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YSG_Employee_Master](
	[Emp_no] [numeric](5, 0) IDENTITY(1,1) NOT NULL,
	[Emp_name] [nvarchar](50) NULL,
	[Mobile_No] [numeric](10, 0) NULL,
	[Email_id] [nvarchar](50) NULL,
	[Dept_no] [numeric](5, 0) NULL,
	[IsDept_Head] [numeric](1, 0) NULL,
	[created_By] [numeric](5, 0) NULL,
	[created_datetime] [datetime] NULL,
	[Updated_By] [numeric](5, 0) NULL,
	[Updated_Datetime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Emp_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[YSG_Event_Master]    Script Date: 14-04-2016 20:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YSG_Event_Master](
	[Event_no] [numeric](5, 0) IDENTITY(1,1) NOT NULL,
	[Event_name] [nvarchar](50) NULL,
	[Description] [nvarchar](2000) NULL,
	[created_By] [numeric](5, 0) NULL,
	[created_datetime] [datetime] NULL,
	[Updated_By] [numeric](5, 0) NULL,
	[Updated_Datetime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Event_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[YSG_Feedback]    Script Date: 14-04-2016 20:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YSG_Feedback](
	[Feedback_No] [numeric](12, 0) IDENTITY(1,1) NOT NULL,
	[Booking_No] [numeric](12, 0) NULL,
	[QuestionOrCriteria] [nvarchar](500) NULL,
	[Ratings] [numeric](18, 0) NULL,
	[Remarks] [nvarchar](500) NULL,
	[created_By] [numeric](5, 0) NULL,
	[created_datetime] [datetime] NULL,
	[Updated_By] [numeric](5, 0) NULL,
	[Updated_Datetime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Feedback_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[YSG_Hall_Master]    Script Date: 14-04-2016 20:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YSG_Hall_Master](
	[Hall_no] [numeric](5, 0) IDENTITY(1,1) NOT NULL,
	[Hall_name] [nvarchar](50) NULL,
	[Capacity_seating] [numeric](10, 0) NULL,
	[Capacity_chairs] [numeric](10, 0) NULL,
	[Rent_per_hour] [numeric](19, 4) NULL,
	[Description] [nvarchar](2000) NULL,
	[created_By] [numeric](5, 0) NULL,
	[created_datetime] [datetime] NULL,
	[Updated_By] [numeric](5, 0) NULL,
	[Updated_Datetime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Hall_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[YSG_Inventory_Master]    Script Date: 14-04-2016 20:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[YSG_Inventory_Master](
	[Item_no] [numeric](5, 0) IDENTITY(1,1) NOT NULL,
	[Item_name] [nvarchar](50) NULL,
	[Related_Dept_No] [numeric](5, 0) NULL,
	[Available_Qty] [numeric](18, 0) NULL,
	[Rent_per_Qty] [money] NULL,
	[Description] [nvarchar](2000) NULL,
	[created_By] [numeric](5, 0) NULL,
	[created_datetime] [datetime] NULL,
	[Updated_By] [numeric](5, 0) NULL,
	[Updated_Datetime] [datetime] NULL,
	[IsActive] [char](1) NULL,
	[IsDefault] [bit] NULL,
 CONSTRAINT [PK__YSG_Inve__3FB42BF3CB54E261] PRIMARY KEY CLUSTERED 
(
	[Item_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[YSG_My_To_Do_List]    Script Date: 14-04-2016 20:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YSG_My_To_Do_List](
	[User_No] [numeric](5, 0) NULL,
	[Booking_No] [numeric](12, 0) NULL,
	[Task_Date] [datetime] NULL,
	[Reminder_DateTime] [datetime] NULL,
	[Task_Description] [nvarchar](2000) NULL,
	[Dept_No] [numeric](5, 0) NULL,
	[Task_Status] [nvarchar](1) NULL,
	[Remarks] [nvarchar](500) NULL,
	[created_By] [numeric](5, 0) NULL,
	[created_datetime] [datetime] NULL,
	[Updated_By] [numeric](5, 0) NULL,
	[Updated_Datetime] [datetime] NULL,
	[Task_ID] [numeric](8, 0) IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_YSG_My_To_Do_List] PRIMARY KEY CLUSTERED 
(
	[Task_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[YSG_Role_Master]    Script Date: 14-04-2016 20:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YSG_Role_Master](
	[Role_no] [numeric](5, 0) IDENTITY(1,1) NOT NULL,
	[Role_name] [nvarchar](500) NULL,
	[Remarks] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Role_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[YSG_SysParam]    Script Date: 14-04-2016 20:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YSG_SysParam](
	[SysParamName] [nvarchar](5) NULL,
	[Description] [nvarchar](500) NULL,
	[Value] [nvarchar](500) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[YSG_Tithi_Info]    Script Date: 14-04-2016 20:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YSG_Tithi_Info](
	[Tithi_Date] [datetime] NOT NULL,
	[Tithi] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[YSG_User_Master]    Script Date: 14-04-2016 20:12:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YSG_User_Master](
	[user_no] [numeric](5, 0) IDENTITY(1,1) NOT NULL,
	[user_login_id] [nvarchar](15) NULL,
	[User_password] [nvarchar](500) NULL,
	[reset_password] [nvarchar](1) NULL,
	[user_name] [nvarchar](50) NULL,
	[Mobile_No] [numeric](10, 0) NULL,
	[Email_id] [nvarchar](50) NULL,
	[Last_login_datetime] [datetime] NULL,
	[Role_no] [numeric](5, 0) NULL,
	[IsActive] [nvarchar](1) NULL,
	[created_By] [numeric](5, 0) NULL,
	[created_datetime] [datetime] NULL,
	[Updated_By] [numeric](5, 0) NULL,
	[Updated_Datetime] [datetime] NULL,
 CONSTRAINT [PK__YSG_User__B9B1F2257B7392F5] PRIMARY KEY CLUSTERED 
(
	[user_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[YSG_Booking_Info] ON 

INSERT [dbo].[YSG_Booking_Info] ([Booking_No], [Booking_ID], [Booking_Date], [Booking_FromTime], [Booking_ToTime], [Event_no], [Event_Class], [Customer_no], [Booking_Status], [No_Of_Invitees], [Booking_calculated_Amt], [Discount], [Discount_Reason], [Booking_final_Amt], [RemarkOrComments], [Paid_Amt], [Balance_Amt], [created_By], [created_datetime], [Updated_By], [Updated_Datetime], [IsActive]) VALUES (CAST(4 AS Numeric(12, 0)), CAST(20160402 AS Numeric(12, 0)), CAST(0x0000A5DC00000000 AS DateTime), CAST(0x0000A5DC00F31290 AS DateTime), CAST(0x0000A5DC00F31290 AS DateTime), CAST(1 AS Numeric(5, 0)), N'Charitable', CAST(1 AS Numeric(10, 0)), N'I', CAST(0 AS Numeric(6, 0)), CAST(0.0000 AS Numeric(19, 4)), CAST(0.0000 AS Numeric(19, 4)), N'', CAST(0.0000 AS Numeric(19, 4)), N'', CAST(0.0000 AS Numeric(19, 4)), CAST(0.0000 AS Numeric(19, 4)), CAST(1 AS Numeric(5, 0)), CAST(0x0000A5DC00F0914C AS DateTime), NULL, CAST(0x0000A5DC00F0914C AS DateTime), N'Y')
SET IDENTITY_INSERT [dbo].[YSG_Booking_Info] OFF
SET IDENTITY_INSERT [dbo].[YSG_Customer_Info] ON 

INSERT [dbo].[YSG_Customer_Info] ([Customer_no], [Customer_name], [Customer_Address], [Landline_No], [Fax_No], [Mobile_No], [Email_id], [Customer_Status], [Referred_By], [Customer_Type], [Comments], [created_By], [created_datetime], [Updated_By], [Updated_Datetime]) VALUES (CAST(1 AS Numeric(10, 0)), N'Jigar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A5DC00EFC8AC AS DateTime), NULL, CAST(0x0000A5DC00EFC8AC AS DateTime))
SET IDENTITY_INSERT [dbo].[YSG_Customer_Info] OFF
SET IDENTITY_INSERT [dbo].[YSG_Event_Master] ON 

INSERT [dbo].[YSG_Event_Master] ([Event_no], [Event_name], [Description], [created_By], [created_datetime], [Updated_By], [Updated_Datetime]) VALUES (CAST(1 AS Numeric(5, 0)), N'Charitable', N'Charitable Events', CAST(1 AS Numeric(5, 0)), CAST(0x0000A5DC00000000 AS DateTime), NULL, CAST(0x0000A5DC00EF05C2 AS DateTime))
SET IDENTITY_INSERT [dbo].[YSG_Event_Master] OFF
ALTER TABLE [dbo].[YSG_Booking_Catering_info] ADD  CONSTRAINT [DF__YSG_Booki__event__2B3F6F97]  DEFAULT (getdate()) FOR [event_Date]
GO
ALTER TABLE [dbo].[YSG_Booking_Contact_Persons] ADD  CONSTRAINT [DF__YSG_Booki__creat__2C3393D0]  DEFAULT (getdate()) FOR [created_datetime]
GO
ALTER TABLE [dbo].[YSG_Booking_Contact_Persons] ADD  CONSTRAINT [DF__YSG_Booki__Updat__2D27B809]  DEFAULT (getdate()) FOR [Updated_Datetime]
GO
ALTER TABLE [dbo].[YSG_Booking_Facilities] ADD  CONSTRAINT [DF__YSG_Booki__creat__2E1BDC42]  DEFAULT (getdate()) FOR [created_datetime]
GO
ALTER TABLE [dbo].[YSG_Booking_Facilities] ADD  CONSTRAINT [DF__YSG_Booki__Updat__2F10007B]  DEFAULT (getdate()) FOR [Updated_Datetime]
GO
ALTER TABLE [dbo].[YSG_Booking_Facilities] ADD  CONSTRAINT [DF_YSG_Booking_Facilities_IsActive]  DEFAULT ('Y') FOR [IsActive]
GO
ALTER TABLE [dbo].[YSG_Booking_Hall_Info] ADD  DEFAULT (getdate()) FOR [created_datetime]
GO
ALTER TABLE [dbo].[YSG_Booking_Hall_Info] ADD  DEFAULT (getdate()) FOR [Updated_Datetime]
GO
ALTER TABLE [dbo].[YSG_Booking_Info] ADD  CONSTRAINT [DF__YSG_Booki__Booki__31EC6D26]  DEFAULT (getdate()) FOR [Booking_Date]
GO
ALTER TABLE [dbo].[YSG_Booking_Info] ADD  CONSTRAINT [DF__YSG_Booki__Booki__32E0915F]  DEFAULT (getdate()) FOR [Booking_FromTime]
GO
ALTER TABLE [dbo].[YSG_Booking_Info] ADD  CONSTRAINT [DF__YSG_Booki__Booki__33D4B598]  DEFAULT (getdate()) FOR [Booking_ToTime]
GO
ALTER TABLE [dbo].[YSG_Booking_Info] ADD  CONSTRAINT [DF__YSG_Booki__creat__34C8D9D1]  DEFAULT (getdate()) FOR [created_datetime]
GO
ALTER TABLE [dbo].[YSG_Booking_Info] ADD  CONSTRAINT [DF__YSG_Booki__Updat__35BCFE0A]  DEFAULT (getdate()) FOR [Updated_Datetime]
GO
ALTER TABLE [dbo].[YSG_Booking_Info] ADD  CONSTRAINT [DF_YSG_Booking_Info_IsActive]  DEFAULT ('Y') FOR [IsActive]
GO
ALTER TABLE [dbo].[YSG_Booking_Payment] ADD  DEFAULT (getdate()) FOR [Payment_Date]
GO
ALTER TABLE [dbo].[YSG_Booking_Payment] ADD  DEFAULT (getdate()) FOR [Cheque_Date]
GO
ALTER TABLE [dbo].[YSG_Booking_Payment] ADD  DEFAULT (getdate()) FOR [created_datetime]
GO
ALTER TABLE [dbo].[YSG_Booking_Payment] ADD  DEFAULT (getdate()) FOR [Updated_Datetime]
GO
ALTER TABLE [dbo].[YSG_Caterer_Master] ADD  DEFAULT (getdate()) FOR [created_Datetime]
GO
ALTER TABLE [dbo].[YSG_Caterer_Master] ADD  DEFAULT (getdate()) FOR [updated_datetime]
GO
ALTER TABLE [dbo].[YSG_Customer_Info] ADD  DEFAULT (getdate()) FOR [created_datetime]
GO
ALTER TABLE [dbo].[YSG_Customer_Info] ADD  DEFAULT (getdate()) FOR [Updated_Datetime]
GO
ALTER TABLE [dbo].[YSG_Department_Master] ADD  DEFAULT (getdate()) FOR [created_datetime]
GO
ALTER TABLE [dbo].[YSG_Department_Master] ADD  DEFAULT (getdate()) FOR [Updated_Datetime]
GO
ALTER TABLE [dbo].[YSG_Employee_Master] ADD  DEFAULT (getdate()) FOR [created_datetime]
GO
ALTER TABLE [dbo].[YSG_Employee_Master] ADD  DEFAULT (getdate()) FOR [Updated_Datetime]
GO
ALTER TABLE [dbo].[YSG_Event_Master] ADD  DEFAULT (getdate()) FOR [created_datetime]
GO
ALTER TABLE [dbo].[YSG_Event_Master] ADD  DEFAULT (getdate()) FOR [Updated_Datetime]
GO
ALTER TABLE [dbo].[YSG_Feedback] ADD  DEFAULT (getdate()) FOR [created_datetime]
GO
ALTER TABLE [dbo].[YSG_Feedback] ADD  DEFAULT (getdate()) FOR [Updated_Datetime]
GO
ALTER TABLE [dbo].[YSG_Hall_Master] ADD  DEFAULT (getdate()) FOR [created_datetime]
GO
ALTER TABLE [dbo].[YSG_Hall_Master] ADD  DEFAULT (getdate()) FOR [Updated_Datetime]
GO
ALTER TABLE [dbo].[YSG_Inventory_Master] ADD  CONSTRAINT [DF__YSG_Inven__creat__47DBAE45]  DEFAULT (getdate()) FOR [created_datetime]
GO
ALTER TABLE [dbo].[YSG_Inventory_Master] ADD  CONSTRAINT [DF__YSG_Inven__Updat__48CFD27E]  DEFAULT (getdate()) FOR [Updated_Datetime]
GO
ALTER TABLE [dbo].[YSG_My_To_Do_List] ADD  CONSTRAINT [DF__YSG_My_To__Task___49C3F6B7]  DEFAULT (getdate()) FOR [Task_Date]
GO
ALTER TABLE [dbo].[YSG_My_To_Do_List] ADD  CONSTRAINT [DF__YSG_My_To__Remin__4AB81AF0]  DEFAULT (getdate()) FOR [Reminder_DateTime]
GO
ALTER TABLE [dbo].[YSG_My_To_Do_List] ADD  CONSTRAINT [DF__YSG_My_To__creat__4BAC3F29]  DEFAULT (getdate()) FOR [created_datetime]
GO
ALTER TABLE [dbo].[YSG_My_To_Do_List] ADD  CONSTRAINT [DF__YSG_My_To__Updat__4CA06362]  DEFAULT (getdate()) FOR [Updated_Datetime]
GO
ALTER TABLE [dbo].[YSG_User_Master] ADD  CONSTRAINT [DF__YSG_User___creat__267ABA7A]  DEFAULT (getdate()) FOR [created_datetime]
GO
ALTER TABLE [dbo].[YSG_User_Master] ADD  CONSTRAINT [DF__YSG_User___Updat__276EDEB3]  DEFAULT (getdate()) FOR [Updated_Datetime]
GO
ALTER TABLE [dbo].[YSG_Booking_Catering_info]  WITH CHECK ADD  CONSTRAINT [FK_YSG_Booking_Catering_info_YSG_Booking_Info] FOREIGN KEY([Booking_no])
REFERENCES [dbo].[YSG_Booking_Info] ([Booking_No])
GO
ALTER TABLE [dbo].[YSG_Booking_Catering_info] CHECK CONSTRAINT [FK_YSG_Booking_Catering_info_YSG_Booking_Info]
GO
ALTER TABLE [dbo].[YSG_Booking_Catering_info]  WITH CHECK ADD  CONSTRAINT [FK_YSG_Booking_Catering_info_YSG_Caterer_Master] FOREIGN KEY([Caterer_No])
REFERENCES [dbo].[YSG_Caterer_Master] ([Caterer_No])
GO
ALTER TABLE [dbo].[YSG_Booking_Catering_info] CHECK CONSTRAINT [FK_YSG_Booking_Catering_info_YSG_Caterer_Master]
GO
ALTER TABLE [dbo].[YSG_Booking_Contact_Persons]  WITH CHECK ADD  CONSTRAINT [FK__YSG_Booki__Booki__5070F446] FOREIGN KEY([Booking_No])
REFERENCES [dbo].[YSG_Booking_Info] ([Booking_No])
GO
ALTER TABLE [dbo].[YSG_Booking_Contact_Persons] CHECK CONSTRAINT [FK__YSG_Booki__Booki__5070F446]
GO
ALTER TABLE [dbo].[YSG_Booking_Facilities]  WITH CHECK ADD  CONSTRAINT [FK__YSG_Booki__Booki__5165187F] FOREIGN KEY([Booking_No])
REFERENCES [dbo].[YSG_Booking_Info] ([Booking_No])
GO
ALTER TABLE [dbo].[YSG_Booking_Facilities] CHECK CONSTRAINT [FK__YSG_Booki__Booki__5165187F]
GO
ALTER TABLE [dbo].[YSG_Booking_Facilities]  WITH CHECK ADD  CONSTRAINT [FK__YSG_Booki__Item___52593CB8] FOREIGN KEY([Item_no])
REFERENCES [dbo].[YSG_Inventory_Master] ([Item_no])
GO
ALTER TABLE [dbo].[YSG_Booking_Facilities] CHECK CONSTRAINT [FK__YSG_Booki__Item___52593CB8]
GO
ALTER TABLE [dbo].[YSG_Booking_Hall_Info]  WITH CHECK ADD  CONSTRAINT [FK__YSG_Booki__Booki__534D60F1] FOREIGN KEY([Booking_No])
REFERENCES [dbo].[YSG_Booking_Info] ([Booking_No])
GO
ALTER TABLE [dbo].[YSG_Booking_Hall_Info] CHECK CONSTRAINT [FK__YSG_Booki__Booki__534D60F1]
GO
ALTER TABLE [dbo].[YSG_Booking_Hall_Info]  WITH CHECK ADD FOREIGN KEY([Hall_no])
REFERENCES [dbo].[YSG_Hall_Master] ([Hall_no])
GO
ALTER TABLE [dbo].[YSG_Booking_Info]  WITH CHECK ADD  CONSTRAINT [FK__YSG_Booki__Event__5535A963] FOREIGN KEY([Event_no])
REFERENCES [dbo].[YSG_Event_Master] ([Event_no])
GO
ALTER TABLE [dbo].[YSG_Booking_Info] CHECK CONSTRAINT [FK__YSG_Booki__Event__5535A963]
GO
ALTER TABLE [dbo].[YSG_Booking_Info]  WITH CHECK ADD  CONSTRAINT [FK_YSG_Booking_Info_YSG_Customer_Info] FOREIGN KEY([Customer_no])
REFERENCES [dbo].[YSG_Customer_Info] ([Customer_no])
GO
ALTER TABLE [dbo].[YSG_Booking_Info] CHECK CONSTRAINT [FK_YSG_Booking_Info_YSG_Customer_Info]
GO
ALTER TABLE [dbo].[YSG_Booking_Payment]  WITH CHECK ADD  CONSTRAINT [FK__YSG_Booki__Booki__571DF1D5] FOREIGN KEY([Booking_No])
REFERENCES [dbo].[YSG_Booking_Info] ([Booking_No])
GO
ALTER TABLE [dbo].[YSG_Booking_Payment] CHECK CONSTRAINT [FK__YSG_Booki__Booki__571DF1D5]
GO
ALTER TABLE [dbo].[YSG_Employee_Master]  WITH CHECK ADD FOREIGN KEY([Dept_no])
REFERENCES [dbo].[YSG_Department_Master] ([Dept_no])
GO
ALTER TABLE [dbo].[YSG_Feedback]  WITH CHECK ADD  CONSTRAINT [FK__YSG_Feedb__Booki__59063A47] FOREIGN KEY([Booking_No])
REFERENCES [dbo].[YSG_Booking_Info] ([Booking_No])
GO
ALTER TABLE [dbo].[YSG_Feedback] CHECK CONSTRAINT [FK__YSG_Feedb__Booki__59063A47]
GO
ALTER TABLE [dbo].[YSG_Inventory_Master]  WITH CHECK ADD  CONSTRAINT [FK_YSG_Inventory_Master_YSG_Department_Master] FOREIGN KEY([Related_Dept_No])
REFERENCES [dbo].[YSG_Department_Master] ([Dept_no])
GO
ALTER TABLE [dbo].[YSG_Inventory_Master] CHECK CONSTRAINT [FK_YSG_Inventory_Master_YSG_Department_Master]
GO
ALTER TABLE [dbo].[YSG_My_To_Do_List]  WITH CHECK ADD  CONSTRAINT [FK__YSG_My_To__Booki__59FA5E80] FOREIGN KEY([Booking_No])
REFERENCES [dbo].[YSG_Booking_Info] ([Booking_No])
GO
ALTER TABLE [dbo].[YSG_My_To_Do_List] CHECK CONSTRAINT [FK__YSG_My_To__Booki__59FA5E80]
GO
ALTER TABLE [dbo].[YSG_User_Master]  WITH CHECK ADD  CONSTRAINT [FK_YSG_User_Master_YSG_Role_Master] FOREIGN KEY([Role_no])
REFERENCES [dbo].[YSG_Role_Master] ([Role_no])
GO
ALTER TABLE [dbo].[YSG_User_Master] CHECK CONSTRAINT [FK_YSG_User_Master_YSG_Role_Master]
GO
ALTER TABLE [dbo].[YSG_Customer_Info]  WITH CHECK ADD  CONSTRAINT [CHK_VALUE] CHECK  (([Customer_Type]='O' OR [Customer_Type]='C' OR [Customer_Type]='T' OR [Customer_Type]='I' OR [Customer_Type]='G' OR [Customer_Type]='S'))
GO
ALTER TABLE [dbo].[YSG_Customer_Info] CHECK CONSTRAINT [CHK_VALUE]
GO
USE [master]
GO
ALTER DATABASE [YogiSabhaGruh] SET  READ_WRITE 
GO

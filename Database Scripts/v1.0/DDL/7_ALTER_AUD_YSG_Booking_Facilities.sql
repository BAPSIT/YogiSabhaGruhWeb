USE [YogiSabhaGruh]
GO
/****** Object:  StoredProcedure [dbo].[AUD_YSG_Booking_Facilities]    Script Date: 05-05-2016 00:11:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[AUD_YSG_Booking_Facilities]
--@ACTION CHAR(1)
--@Booking_Facility_No numeric(7,0)
@Booking_No numeric(12,0)
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
--IF @ACTION = 'A'
BEGIN

DELETE FROM [YSG_Booking_Facilities] WHERE @Booking_No = @Booking_No

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

--IF @ACTION = 'U'
--BEGIN
--UPDATE [dbo].[YSG_Booking_Facilities]
--   SET [Booking_No] = @Booking_No
--      ,[Item_no] = @Item_no
--      ,[Required_Qty] = @Required_Qty
--      ,[Calculated_Amount] = @Calculated_Amount
--      ,[Remarks] = @Remarks
--      ,[Updated_By] = @created_By
--      ,[Updated_Datetime] = GETDATE()      
--      ,[IsActive] = 'Y'
-- WHERE Booking_Facility_No = @Booking_Facility_No
--END

--IF @ACTION = 'D'
--BEGIN
--UPDATE [dbo].[YSG_Booking_Facilities]
--   SET [Updated_By] = @created_By
--      ,[Updated_Datetime] = GETDATE()      
--      ,[IsActive] = 'N'
-- WHERE Booking_Facility_No = @Booking_Facility_No
--END

   
END


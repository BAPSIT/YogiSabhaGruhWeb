USE [YogiSabhaGruh]
GO
/****** Object:  StoredProcedure [dbo].[AUD_YSG_Booking_Facilities]    Script Date: 14-05-2016 15:07:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[AUD_YSG_Booking_Facilities]
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
BEGIN


DELETE FROM [YSG_Booking_Facilities] WHERE Booking_No = @Booking_No AND Item_No = @Item_no

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
   
END


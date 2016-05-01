USE [YogiSabhaGruh]
GO

/****** Object:  StoredProcedure [dbo].[AUD_YSG_Booking_Info]    Script Date: 01-05-2016 14:42:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[AUD_YSG_Booking_Info]
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
		   ,[IsActive]
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



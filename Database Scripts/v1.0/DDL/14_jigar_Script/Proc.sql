Text
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROC [dbo].[AUD_YSG_Booking_Info]
@Action Char(1)
,@Booking_No numeric(12,0)=NULL
,@Booking_ID numeric(12,0)=NULL
,@Booking_Date datetime=NULL
,@Booking_FromTime datetime=NULL
,@Booking_ToTime datetime=NULL
,@Event_no numeric(5,0)=NULL
,@Event_Class varchar(50)=NULL
,@Customer_no numeric(10,0)=NULL
,@Booking_Status nvarchar(1)=NULL
,@No_Of_Invitees numeric(6,0)=NULL
,@Booking_calculated_Amt numeric(19,4)=NULL
,@Discount numeric(19,4)=NULL
,@Discount_Reason nvarchar(2000)=NULL
,@Booking_final_Amt numeric(19,4)=NULL
,@RemarkOrComments nvarchar(2000)=NULL
,@Paid_Amt numeric(19,4)=NULL
,@Balance_Amt numeric(19,4)=NULL
,@created_By numeric(5,0)=NULL
----
,@Cancellation_Reason varchar(4000)=NULL
,@Cancellation_Description varchar(4000)=NULL
,@Cancellation_Refunded_Amt numeric(19,4)=NULL
,@Cancellation_Datetime Datetime=NULL


AS
BEGIN
---------------------------------------------------------------
/*
--	Use Below script to ADD/UPDATE/DELETE BOOKING RECORDS
EXEC [AUD_YSG_Booking_Info] 'A',NULL,'20160320002','03/18/2016','9:00 AM','9:00 PM',1,'Medium Class',1,I,500,15000,1000,'SATSANGI',14000,'NO COMMENTS',2000,12000,1
EXEC [AUD_YSG_Booking_Info] 'U',2,'20160320002','03/18/2016','9:00 AM','9:00 PM',1,'Medium Class',1,I,500,15000,1000,'SATSANGI',14000,'NO COMMENTS',2000,12000,1
EXEC [AUD_YSG_Booking_Info] 'D',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1
EXEC [AUD_YSG_Booking_Info] 'C',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'REASON','DESCRIPTION','4000'

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

ELSE IF @ACTION = 'C'
BEGIN
	UPDATE [dbo].[YSG_Booking_Info]
	SET [Booking_Status] = @Action    
		,[Cancellation_Reason] = @Cancellation_Reason
		,[Cancellation_Refunded_Amt] = @Cancellation_Refunded_Amt
		,[Cancellation_Description] = @Cancellation_Description
		,[Cancellation_Datetime] = @Cancellation_Datetime
	WHERE Booking_No = @Booking_No
END

END


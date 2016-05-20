USE [YogiSabhaGruh]
GO

/****** Object:  StoredProcedure [dbo].[LIST_YSG_Booking_Info]    Script Date: 17/05/2016 16:16:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/*
--	Use Below script to ADD/UPDATE/DELETE/CANCEL BOOKING RECORDS
	
	LIST_YSG_Booking_Info '01-April-2016','02-April-2016'

*/

CREATE Proc [dbo].[LIST_YSG_Booking_Info]
	@Booking_From datetime
	,@Booking_To datetime
	,@Customer_no numeric(9) = 0
as
BEGIN
	select Booking_No,
			Booking_ID, 
			convert(varchar(10), Booking_Date,103) Booking_Date, 
			left(convert(varchar(10),Booking_FromTime,108),5) Booking_FromTime,
			left(convert(varchar(10),Booking_ToTime,108),5) Booking_ToTime,
			Customer_name,
			Mobile_No,
			Booking_Status
			--,RemarkOrComments
	from YSG_Booking_Info b 
		inner join YSG_Customer_Info c on b.Customer_no = c.Customer_no
	where 
		Booking_Date between @Booking_From and @Booking_To
		and b.Customer_no = case when @Customer_no = 0 then b.Customer_no else @Customer_no end
END


GO



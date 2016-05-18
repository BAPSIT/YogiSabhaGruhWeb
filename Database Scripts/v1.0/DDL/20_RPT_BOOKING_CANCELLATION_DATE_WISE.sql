CREATE PROCEDURE [dbo].[RPT_BOOKING_CANCELLATION_DATE_WISE]
	@Start_Date DATETIME,
	@End_Date DATETIME,
	@Hall_no numeric
AS

SELECT     dbo.YSG_Booking_Info.Booking_ID, dbo.YSG_Booking_Info.Booking_Date, dbo.YSG_Booking_Info.Booking_FromTime, dbo.YSG_Booking_Info.Booking_ToTime, 
                      dbo.YSG_Booking_Info.Event_no, dbo.YSG_Booking_Info.Event_Class, dbo.YSG_Customer_Info.Customer_name, dbo.YSG_Booking_Info.Cancellation_Reason, 
                      dbo.YSG_Booking_Info.Cancellation_Description, dbo.YSG_Booking_Info.Cancellation_Refunded_Amt, dbo.YSG_Booking_Info.Cancellation_Datetime, 
                      dbo.YSG_Customer_Info.Customer_Address, dbo.YSG_Customer_Info.Mobile_No, dbo.YSG_Booking_Info.IsActive AS Expr1, dbo.YSG_Booking_Info.Hall_no
FROM         dbo.YSG_Booking_Hall_Info RIGHT OUTER JOIN
                      dbo.YSG_Booking_Info LEFT OUTER JOIN
                      dbo.YSG_Customer_Info ON dbo.YSG_Booking_Info.Customer_no = dbo.YSG_Customer_Info.Customer_no ON 
                      dbo.YSG_Booking_Hall_Info.Booking_No = dbo.YSG_Booking_Info.Booking_No LEFT OUTER JOIN
                      dbo.YSG_Hall_Master ON dbo.YSG_Hall_Master.Hall_no = dbo.YSG_Booking_Hall_Info.Hall_no
WHERE     (dbo.YSG_Booking_Info.Booking_Date >= @Start_Date) AND (dbo.YSG_Booking_Info.Booking_Date <= @End_Date) AND (dbo.YSG_Booking_Info.Hall_no = @Hall_No) 
                      AND (dbo.YSG_Booking_Info.Cancellation_Reason IS NOT NULL)
CREATE PROCEDURE Cancel_YSG_Booking_Info
@Cancellation_Reason nvarchar(4000),
@Cancellation_Description nvarchar(4000),
@Cancellation_Refunded_Amt numeric,
@Cancellation_Datetime datetime,
@Booking_No numeric
AS
BEGIN
Update YSG_Booking_Info
Set Cancellation_Datetime = @Cancellation_Datetime,
    Cancellation_Reason = @Cancellation_Reason,
	Cancellation_Description = @Cancellation_Description,
	Cancellation_Refunded_Amt = @Cancellation_Refunded_Amt,
	IsActive='N',
	Booking_Status='C'
Where Booking_No = @Booking_No
END


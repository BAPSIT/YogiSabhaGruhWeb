USE [YogiSabhaGruh]
GO
/****** Object:  StoredProcedure [dbo].[Get_BookingInfoByDate]    Script Date: 21-05-2016 16:18:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[Get_BookingInfoByDate]
@startDate datetime,
@endDate datetime
AS
BEGIN
  SELECT b.*, e.*   FROM YSG_Booking_Info b JOIN YSG_Event_Master e ON b.Event_no = e.Event_no
  WHERE b.Booking_FromTime>= @startDate and b.Booking_ToTime<=@enddate AND Booking_Status != 'C'
END




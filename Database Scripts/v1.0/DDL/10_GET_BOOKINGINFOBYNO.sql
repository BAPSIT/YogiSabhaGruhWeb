USE [YogiSabhaGruh]
GO
/****** Object:  StoredProcedure [dbo].[Get_BookingInfoById]    Script Date: 05-05-2016 19:30:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Get_BookingInfoByNo]
@booking_no int
AS
BEGIN
  SELECT b.*   FROM YSG_Booking_Info b 
  WHERE b.Booking_No = @booking_no
END




USE [YogiSabhaGruh]
GO

/****** Object:  StoredProcedure [dbo].[Get_BookingInfoById]    Script Date: 04-05-2016 22:57:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[Get_BookingInfoById]
@booking_id int
AS
BEGIN
  SELECT b.*   FROM YSG_Booking_Info b 
  WHERE b.Booking_ID = @booking_id
END




GO



USE [YogiSabhaGruh]
GO
/****** Object:  StoredProcedure [dbo].[Get_Booking_Facilities]    Script Date: 05-05-2016 17:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Get_Booking_Facilities] 
@Booking_No int=0
AS
BEGIN
  -- get_inventory 1,0 -- new event, get default inventory
   IF @Booking_No < 1
 BEGIN
	  Select * From YSG_Inventory_Master Where IsDefault = 1 AND IsActive = 'Y'

  END
 ELSE
  BEGIN
	  SELECT f.Booking_Facility_No, f.booking_no, f.Required_Qty, f.Calculated_Amount, f.Remarks, i.Item_no, i.Item_name, i.Available_Qty, i.Rent_per_Qty FROM  YSG_Inventory_Master i LEFT OUTER JOIN  YSG_Booking_Facilities f 
	  ON f.Item_no  = i.Item_no
	  Where f.Booking_No = @Booking_No
  END

END


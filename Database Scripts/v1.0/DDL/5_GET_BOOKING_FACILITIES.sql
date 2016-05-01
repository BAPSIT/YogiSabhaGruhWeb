USE [YogiSabhaGruh]
GO

/****** Object:  StoredProcedure [dbo].[Get_Booking_Facilities]    Script Date: 01-05-2016 20:06:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Get_Booking_Facilities] 
--@DefaultOnly bit = 1,
@Booking_No int=0
AS
BEGIN
  -- get_inventory 1,0 -- new event, get default inventory
  -- get 
 IF @Booking_No = 0
 BEGIN
	 SELECT f.Booking_Facility_No, f.booking_no, f.Required_Qty, f.Calculated_Amount, f.Remarks,  i.Item_no, i.Item_name, i.Available_Qty, i.Rent_per_Qty FROM  YSG_Inventory_Master i LEFT OUTER JOIN  YSG_Booking_Facilities f 
	  ON f.Item_no  = i.Item_no
	  Where i.IsDefault = 1 AND f.booking_facility_no IS NULL
  END
 ELSE
  BEGIN
	  SELECT f.Booking_Facility_No, f.booking_no, f.Required_Qty, f.Calculated_Amount, f.Remarks, i.Item_no, i.Item_name, i.Available_Qty, i.Rent_per_Qty FROM  YSG_Inventory_Master i LEFT OUTER JOIN  YSG_Booking_Facilities f 
	  ON f.Item_no  = i.Item_no
	  Where f.Booking_No = @Booking_No
  END

END


GO



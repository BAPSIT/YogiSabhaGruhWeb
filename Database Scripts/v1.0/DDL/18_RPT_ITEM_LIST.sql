CREATE PROCEDURE [dbo].[RPT_ITEM_LIST]
	@Start_Date DATETIME,
	@End_Date DATETIME,
	@Hall_no numeric
AS
BEGIN
	SELECT        Booking_Date,
				Hall_name,				
				YSG_Booking_Facilities.Item_no,
				Item_name,
				MAX(Required_Qty) Required_Qty
FROM            YSG_Booking_Info LEFT JOIN
                         YSG_Customer_Info ON YSG_Booking_Info.Customer_no = YSG_Customer_Info.Customer_no LEFT JOIN
                         YSG_Booking_Facilities ON YSG_Booking_Info.Booking_No = YSG_Booking_Facilities.Booking_No LEFT JOIN
                         YSG_Inventory_Master ON YSG_Booking_Facilities.Item_no = YSG_Inventory_Master.Item_no LEFT JOIN
                         YSG_Department_Master ON YSG_Inventory_Master.Related_Dept_No = YSG_Department_Master.Dept_no LEFT JOIN
                         YSG_Employee_Master ON YSG_Department_Master.Dept_no = YSG_Employee_Master.Dept_no LEFT JOIN
				         YSG_Booking_Hall_Info ON YSG_Booking_Hall_Info.Booking_No = YSG_Booking_Info.Booking_No LEFT JOIN
				         YSG_Hall_Master ON YSG_Hall_Master.Hall_no = YSG_Booking_Hall_Info.Hall_no
WHERE Booking_Date>=@Start_Date AND
Booking_Date<=@End_Date AND
YSG_Booking_Info.Hall_no = @Hall_No
GROUP BY Booking_Date,Hall_name,YSG_Booking_Facilities.Item_no,Item_name
union all
SELECT NULL,Hall_name,Item_no,Item_name,SUM(Required_Qty)
FROM 
(SELECT			Booking_Date,
				Hall_name,				
				YSG_Booking_Facilities.Item_no,
				Item_name,
				MAX(Required_Qty) Required_Qty
FROM            YSG_Booking_Info LEFT JOIN
                         YSG_Customer_Info ON YSG_Booking_Info.Customer_no = YSG_Customer_Info.Customer_no LEFT JOIN
                         YSG_Booking_Facilities ON YSG_Booking_Info.Booking_No = YSG_Booking_Facilities.Booking_No LEFT JOIN
                         YSG_Inventory_Master ON YSG_Booking_Facilities.Item_no = YSG_Inventory_Master.Item_no LEFT JOIN
                         YSG_Department_Master ON YSG_Inventory_Master.Related_Dept_No = YSG_Department_Master.Dept_no LEFT JOIN
                         YSG_Employee_Master ON YSG_Department_Master.Dept_no = YSG_Employee_Master.Dept_no LEFT JOIN
				         YSG_Booking_Hall_Info ON YSG_Booking_Hall_Info.Booking_No = YSG_Booking_Info.Booking_No LEFT JOIN
				         YSG_Hall_Master ON YSG_Hall_Master.Hall_no = YSG_Booking_Hall_Info.Hall_no
WHERE Booking_Date>=@Start_Date AND
Booking_Date<=@End_Date AND
YSG_Booking_Info.Hall_no = @Hall_No
GROUP BY Booking_Date,Hall_name,YSG_Booking_Facilities.Item_no,Item_name)S
GROUP BY Hall_name, Item_no,Item_name

END


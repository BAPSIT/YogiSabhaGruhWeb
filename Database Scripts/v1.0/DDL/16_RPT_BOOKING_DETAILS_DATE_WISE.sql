CREATE PROCEDURE [dbo].[RPT_BOOKING_DETAILS_DATE_WISE]
	@Start_Date DATETIME,
	@End_Date DATETIME,
	@Hall_no numeric
AS

SELECT        YSG_Booking_Info.Booking_ID, YSG_Booking_Info.Booking_Date, YSG_Booking_Info.Booking_FromTime, YSG_Booking_Info.Booking_ToTime, YSG_Booking_Info.Event_no, YSG_Booking_Info.Event_Class, 
                         YSG_Customer_Info.Customer_name, YSG_Customer_Info.Customer_Address, YSG_Customer_Info.Mobile_No, YSG_Booking_Facilities.Item_no, YSG_Booking_Facilities.Required_Qty, 
                         YSG_Booking_Facilities.Calculated_Amount, YSG_Booking_Facilities.Remarks, YSG_Booking_Facilities.created_By, YSG_Booking_Facilities.created_datetime, YSG_Booking_Facilities.Updated_By, 
                         YSG_Booking_Facilities.Updated_Datetime, YSG_Booking_Facilities.IsActive, YSG_Booking_Info.IsActive AS Expr1, YSG_Inventory_Master.Item_name, YSG_Inventory_Master.Rent_per_Qty, 
                         YSG_Inventory_Master.Available_Qty, YSG_Inventory_Master.Description, YSG_Inventory_Master.IsActive AS Expr2, YSG_Department_Master.Dept_name, YSG_Employee_Master.Emp_name, 
                         YSG_Employee_Master.Mobile_No AS Expr3, YSG_Employee_Master.Email_id, YSG_Employee_Master.IsDept_Head
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
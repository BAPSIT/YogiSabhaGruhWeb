CREATE PROCEDURE RPT_HALL_UTILIZATION
	@Start_Date DATETIME,
	@End_Date DATETIME,
	@Hall_no numeric
AS
BEGIN


SELECT YSG_Hall_Master.Hall_name,
YSG_Booking_Info.Booking_Date,
SUM(DATEDIFF(HOUR,Booking_FromTime,Booking_ToTime)) Total_Booking_hours,
COUNT(YSG_Booking_Info.Booking_No) Total_Bookings,
CASE WHEN SUM(DATEDIFF(HOUR,Booking_FromTime,Booking_ToTime)) > 4 OR COUNT(YSG_Booking_Info.Booking_No)>1 THEN 1 
	 WHEN SUM(DATEDIFF(HOUR,Booking_FromTime,Booking_ToTime)) <= 4 AND COUNT(YSG_Booking_Info.Booking_No) = 1 THEN 0.5
	 ELSE 0 END Hall_Utilization
FROM            YSG_Booking_Info LEFT JOIN
                YSG_Customer_Info ON YSG_Booking_Info.Customer_no = YSG_Customer_Info.Customer_no LEFT JOIN
                YSG_Booking_Facilities ON YSG_Booking_Info.Booking_No = YSG_Booking_Facilities.Booking_No LEFT JOIN
                YSG_Inventory_Master ON YSG_Booking_Facilities.Item_no = YSG_Inventory_Master.Item_no LEFT JOIN
				YSG_Booking_Hall_Info ON YSG_Booking_Hall_Info.Booking_No = YSG_Booking_Info.Booking_No LEFT JOIN
				YSG_Hall_Master ON YSG_Hall_Master.Hall_no = YSG_Booking_Hall_Info.Hall_no
                         
WHERE Booking_Date>=@Start_Date AND
Booking_Date<=@End_Date AND
YSG_Booking_Info.Hall_no = @Hall_no
GROUP BY YSG_Hall_Master.Hall_name,
YSG_Booking_Info.Booking_Date
UNION ALL

SELECT S.Hall_name,
NULL ALL_DATE,
--(SELECT DATEDIFF(DAY,@Start_Date,@End_Date)) TOTAL_DAYS,
SUM(Total_Booking_hours) Total_Booking_hours,
SUM(Total_Bookings) Total_Bookings,
(SUM(Hall_Utilization)*100)/(SELECT DATEDIFF(DAY,@Start_Date,@End_Date)) Hall_Utilization
FROM
(SELECT 
YSG_Hall_Master.Hall_name,
SUM(DATEDIFF(HOUR,Booking_FromTime,Booking_ToTime)) Total_Booking_hours,
COUNT(YSG_Booking_Info.Booking_No) Total_Bookings,
CASE WHEN SUM(DATEDIFF(HOUR,Booking_FromTime,Booking_ToTime)) > 4 OR COUNT(YSG_Booking_Info.Booking_No)>1 THEN 1 
	 WHEN SUM(DATEDIFF(HOUR,Booking_FromTime,Booking_ToTime)) <= 4 AND COUNT(YSG_Booking_Info.Booking_No) = 1 THEN 0.5
	 ELSE 0 END Hall_Utilization
FROM            YSG_Booking_Info LEFT JOIN
                YSG_Customer_Info ON YSG_Booking_Info.Customer_no = YSG_Customer_Info.Customer_no LEFT JOIN
                YSG_Booking_Facilities ON YSG_Booking_Info.Booking_No = YSG_Booking_Facilities.Booking_No LEFT JOIN
                YSG_Inventory_Master ON YSG_Booking_Facilities.Item_no = YSG_Inventory_Master.Item_no LEFT JOIN
				YSG_Booking_Hall_Info ON YSG_Booking_Hall_Info.Booking_No = YSG_Booking_Info.Booking_No LEFT JOIN
				YSG_Hall_Master ON YSG_Hall_Master.Hall_no = YSG_Booking_Hall_Info.Hall_no
                         
WHERE Booking_Date>=@Start_Date AND
Booking_Date<=@End_Date AND
YSG_Booking_Info.Hall_no in(@Hall_No)
GROUP BY YSG_Hall_Master.Hall_name)S
GROUP BY S.Hall_name

END
GO

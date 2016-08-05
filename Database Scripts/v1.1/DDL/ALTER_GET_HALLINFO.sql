ALTER PROCEDURE [dbo].[Get_HallInfo]
AS
BEGIN
SELECT Hall_No,[Hall_name],[Rent_per_hour],[Capacity_chairs],[Capacity_seating] FROM YSG_Hall_Master
where IsActive<>'N' or IsActive is null
END
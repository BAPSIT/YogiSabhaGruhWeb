CREATE PROC [dbo].[AUD_YSG_Hall_Info]
@Action Char(1)
,@Hall_No numeric(12,0)
,@Hall_Name nvarchar(50)
,@Capacity_seating numeric
,@capacity_chairs numeric
,@Rent_per_hour numeric
AS
BEGIN
IF @ACTION = 'A'
BEGIN
INSERT INTO [dbo].[YSG_Hall_Master]
           (
		   Hall_name,
		   Capacity_chairs,
		   Capacity_seating,
		   Rent_per_hour,
		   created_datetime,
		   IsActive
		   )
		   values
		   (
		   @Hall_Name,
		   @capacity_chairs,
		   @Capacity_seating,
		   @Rent_per_hour,
		   GETDATE(),
		   'Y'
		   )

SELECT @@IDENTITY


END

ELSE IF @ACTION = 'U'
BEGIN
UPDATE [dbo].[YSG_Hall_Master]
 SET
		   Hall_name=@Hall_name,
		   Capacity_chairs = @capacity_chairs,
		   Capacity_seating =@Capacity_seating,
		   Rent_per_hour=@Rent_per_hour,
		   Updated_Datetime = GETDATE()
Where Hall_no = @Hall_No
 
END
ELSE IF @ACTION = 'D'
BEGIN
UPDATE [dbo].[YSG_Hall_Master]
   SET IsActive = 'N'    
     
      ,[Updated_Datetime] = GETDATE()
 WHERE Hall_no =@Hall_No
 SELECT @Hall_No
END
END



GO
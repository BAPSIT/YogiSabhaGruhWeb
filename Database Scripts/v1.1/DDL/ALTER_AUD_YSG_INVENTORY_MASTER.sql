USE [YogiSabhaGruh]
GO

/****** Object:  StoredProcedure [dbo].[AUD_YSG_Inventory_Master]    Script Date: 30-07-2016 13:28:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[AUD_YSG_Inventory_Master]
@ACTION CHAR(1)
,@Item_no NUMERIC(5)
,@Item_name nvarchar(50)
,@Related_Dept_No numeric(5,0)
,@Available_Qty numeric(18,0)
,@Rent_per_Qty numeric(19,4)
,@Description nvarchar(2000)
,@created_By numeric(5,0)

AS
-------------------------------------------------------------------
--	THIS PROC IS USED FOR ADD/UPDATE/DELETE RECORDS INTO [YSG_Booking_Contact_Persons] TABLE
--	EXEC AUD_YSG_Inventory_Master 'A',NULL,'SPEAKER',10,2,1200,'Audio SPEAKER',1
--	EXEC AUD_YSG_Inventory_Master 'U',2,'SPEAKER',10,12,1500,'Audio SPEAKER',1
--	EXEC AUD_YSG_Inventory_Master 'D',2,NULL,NULL,NULL,NULL,NULL,1
-------------------------------------------------------------------
BEGIN

IF @ACTION = 'A'
BEGIN
INSERT INTO [dbo].[YSG_Inventory_Master]
           ([Item_name]
           ,[Related_Dept_No]
           ,[Available_Qty]
           ,[Rent_per_Qty]
           ,[Description]
		   ,IsActive
           ,[created_By]
           ,[created_datetime],
		    [isDefault])
     VALUES
           (@Item_name
			,@Related_Dept_No
			,@Available_Qty
			,@Rent_per_Qty
			,@Description
			,'Y'
			,@created_By
			,GETDATE(),
			0)
END
ELSE IF @ACTION = 'U'
BEGIN
UPDATE [dbo].[YSG_Inventory_Master]
   SET [Item_name] = @Item_name
      ,[Related_Dept_No] = @Related_Dept_No
      ,[Available_Qty] = @Available_Qty
      ,[Rent_per_Qty] = @Rent_per_Qty
      ,[Description] = @Description
      ,[Updated_By] = @created_By
      ,[Updated_Datetime] = GETDATE()
 WHERE Item_no = @Item_no
END
ELSE IF @ACTION = 'D'
BEGIN
 UPDATE [YSG_Inventory_Master]
 SET IsActive = 'N'
 ,[Updated_By] = @created_By
 ,[Updated_Datetime] = GETDATE()  
 WHERE Item_no = @Item_no
END


END



GO
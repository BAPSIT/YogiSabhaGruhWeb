USE [YogiSabhaGruh]
GO

/****** Object:  StoredProcedure [dbo].[Get_Inventory_Master]    Script Date: 20-05-2016 23:50:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Get_Inventory_Master] 
AS
 BEGIN
  SELECT * FROM YSG_Inventory_Master WHERE IsActive = 'Y' AND IsDefault  = 0
 END

GO



USE [YogiSabhaGruh]
GO
/****** Object:  StoredProcedure [dbo].[Get_Inventory_Master]    Script Date: 30-07-2016 16:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_User_List] 
AS
 BEGIN
  SELECT * FROM YSG_User_Master WHERE IsActive = 'Y' 
 END




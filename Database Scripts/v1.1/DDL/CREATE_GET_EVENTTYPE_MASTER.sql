USE [YogiSabhaGruh]
GO
/****** Object:  StoredProcedure [dbo].[Get_Inventory_Master]    Script Date: 29-05-2016 18:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_EventType_Master] 
AS
 BEGIN
  SELECT * FROM YSG_Event_Master
 END




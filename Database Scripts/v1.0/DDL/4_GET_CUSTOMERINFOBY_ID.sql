USE [YogiSabhaGruh]
GO

/****** Object:  StoredProcedure [dbo].[Get_CustomerInfoById]    Script Date: 01-05-2016 14:44:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[Get_CustomerInfoById]
@customer_no int
AS
BEGIN
  SELECT b.*   FROM YSG_Customer_Info b 
  WHERE b.Customer_no = @customer_no
END




GO



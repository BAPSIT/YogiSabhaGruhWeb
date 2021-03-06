USE [YogiSabhaGruh]
GO
DELETE FROM [dbo].[YSG_Inventory_Master]
GO
SET IDENTITY_INSERT [dbo].[YSG_Inventory_Master] ON 

GO
INSERT [dbo].[YSG_Inventory_Master] ([Item_no], [Item_name], [Related_Dept_No], [Available_Qty], [Rent_per_Qty], [Description], [created_By], [created_datetime], [Updated_By], [Updated_Datetime], [IsActive], [IsDefault]) VALUES (CAST(1 AS Numeric(5, 0)), N'Cushion Chairs', NULL, CAST(1000 AS Numeric(18, 0)), 2.0000, NULL, CAST(1 AS Numeric(5, 0)), CAST(0x0000A5F900000000 AS DateTime), NULL, CAST(0x0000A5F901157C2F AS DateTime), N'Y', 1)
GO
INSERT [dbo].[YSG_Inventory_Master] ([Item_no], [Item_name], [Related_Dept_No], [Available_Qty], [Rent_per_Qty], [Description], [created_By], [created_datetime], [Updated_By], [Updated_Datetime], [IsActive], [IsDefault]) VALUES (CAST(2 AS Numeric(5, 0)), N'3 Seater Sofa', NULL, CAST(50 AS Numeric(18, 0)), 100.0000, NULL, CAST(1 AS Numeric(5, 0)), CAST(0x0000A5F900000000 AS DateTime), NULL, CAST(0x0000A5F90115AF3C AS DateTime), N'Y', 1)
GO
INSERT [dbo].[YSG_Inventory_Master] ([Item_no], [Item_name], [Related_Dept_No], [Available_Qty], [Rent_per_Qty], [Description], [created_By], [created_datetime], [Updated_By], [Updated_Datetime], [IsActive], [IsDefault]) VALUES (CAST(3 AS Numeric(5, 0)), N'Amplifier', NULL, CAST(10 AS Numeric(18, 0)), 250.0000, NULL, CAST(1 AS Numeric(5, 0)), CAST(0x0000A5F900000000 AS DateTime), NULL, CAST(0x0000A5F90115AF3C AS DateTime), N'Y', 1)
GO
INSERT [dbo].[YSG_Inventory_Master] ([Item_no], [Item_name], [Related_Dept_No], [Available_Qty], [Rent_per_Qty], [Description], [created_By], [created_datetime], [Updated_By], [Updated_Datetime], [IsActive], [IsDefault]) VALUES (CAST(4 AS Numeric(5, 0)), N'Speakers', NULL, CAST(20 AS Numeric(18, 0)), 125.0000, NULL, CAST(1 AS Numeric(5, 0)), CAST(0x0000A5F900000000 AS DateTime), NULL, CAST(0x0000A5F90115AF3C AS DateTime), N'Y', 1)
GO
INSERT [dbo].[YSG_Inventory_Master] ([Item_no], [Item_name], [Related_Dept_No], [Available_Qty], [Rent_per_Qty], [Description], [created_By], [created_datetime], [Updated_By], [Updated_Datetime], [IsActive], [IsDefault]) VALUES (CAST(5 AS Numeric(5, 0)), N'Dining Table', NULL, CAST(100 AS Numeric(18, 0)), 60.0000, NULL, CAST(1 AS Numeric(5, 0)), CAST(0x0000A5F900000000 AS DateTime), NULL, CAST(0x0000A5F90115AF3C AS DateTime), N'Y', 0)
GO
SET IDENTITY_INSERT [dbo].[YSG_Inventory_Master] OFF
GO

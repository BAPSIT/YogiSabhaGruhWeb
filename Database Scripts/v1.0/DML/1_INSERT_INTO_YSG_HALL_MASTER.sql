USE [YogiSabhaGruh]
GO
DELETE FROM [dbo].[YSG_Hall_Master]
GO

SET IDENTITY_INSERT [dbo].[YSG_Hall_Master] ON 

GO
INSERT [dbo].[YSG_Hall_Master] ([Hall_no], [Hall_name], [Capacity_seating], [Capacity_chairs], [Rent_per_hour], [Description], [created_By], [created_datetime], [Updated_By], [Updated_Datetime]) VALUES (CAST(1 AS Numeric(5, 0)), N'Yogi Hall', CAST(2000 AS Numeric(10, 0)), CAST(1000 AS Numeric(10, 0)), CAST(10000.0000 AS Numeric(19, 4)), N'Yogi Hall', CAST(1 AS Numeric(5, 0)), CAST(0x0000A5F800000000 AS DateTime), NULL, CAST(0x0000A5F801335E6A AS DateTime))
GO
INSERT [dbo].[YSG_Hall_Master] ([Hall_no], [Hall_name], [Capacity_seating], [Capacity_chairs], [Rent_per_hour], [Description], [created_By], [created_datetime], [Updated_By], [Updated_Datetime]) VALUES (CAST(2 AS Numeric(5, 0)), N'Yogi Mandapam', CAST(1000 AS Numeric(10, 0)), CAST(500 AS Numeric(10, 0)), CAST(7000.0000 AS Numeric(19, 4)), N'Yogi Mandapam', CAST(1 AS Numeric(5, 0)), CAST(0x0000A5F800000000 AS DateTime), NULL, CAST(0x0000A5F8013396B4 AS DateTime))
GO
INSERT [dbo].[YSG_Hall_Master] ([Hall_no], [Hall_name], [Capacity_seating], [Capacity_chairs], [Rent_per_hour], [Description], [created_By], [created_datetime], [Updated_By], [Updated_Datetime]) VALUES (CAST(3 AS Numeric(5, 0)), N'Yogi Hall  + Balcony', CAST(4000 AS Numeric(10, 0)), CAST(2000 AS Numeric(10, 0)), CAST(15000.0000 AS Numeric(19, 4)), N'Yogi Hall With Balcony', NULL, CAST(0x0000A5F80133D1FA AS DateTime), NULL, CAST(0x0000A5F80133D1FA AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[YSG_Hall_Master] OFF
GO

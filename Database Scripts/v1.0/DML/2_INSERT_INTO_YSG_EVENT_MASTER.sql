DELETE FROM [dbo].[YSG_Event_Master]
GO
SET IDENTITY_INSERT [dbo].[YSG_Event_Master] ON 

GO
INSERT [dbo].[YSG_Event_Master] ([Event_no], [Event_name], [Description], [created_By], [created_datetime], [Updated_By], [Updated_Datetime]) VALUES (CAST(1 AS Numeric(5, 0)), N'Mandir Event', N'BAPS Mandir Event', CAST(1 AS Numeric(5, 0)), CAST(0x0000A5DC00000000 AS DateTime), NULL, CAST(0x0000A5DC00EF05C2 AS DateTime))
GO
INSERT [dbo].[YSG_Event_Master] ([Event_no], [Event_name], [Description], [created_By], [created_datetime], [Updated_By], [Updated_Datetime]) VALUES (CAST(2 AS Numeric(5, 0)), N'Charitable ', N'Charitable ', CAST(1 AS Numeric(5, 0)), CAST(0x0000A5DC00000000 AS DateTime), NULL, CAST(0x0000A5DC00EF05C2 AS DateTime))
GO
INSERT [dbo].[YSG_Event_Master] ([Event_no], [Event_name], [Description], [created_By], [created_datetime], [Updated_By], [Updated_Datetime]) VALUES (CAST(3 AS Numeric(5, 0)), N'Prathana Sabha', N'Prathana Sabha', CAST(1 AS Numeric(5, 0)), CAST(0x0000A5F800000000 AS DateTime), NULL, CAST(0x0000A5F8013B6F95 AS DateTime))
GO
INSERT [dbo].[YSG_Event_Master] ([Event_no], [Event_name], [Description], [created_By], [created_datetime], [Updated_By], [Updated_Datetime]) VALUES (CAST(4 AS Numeric(5, 0)), N'Educational', N'Educational', CAST(1 AS Numeric(5, 0)), CAST(0x0000A5F800000000 AS DateTime), NULL, CAST(0x0000A5F8013B919C AS DateTime))
GO
INSERT [dbo].[YSG_Event_Master] ([Event_no], [Event_name], [Description], [created_By], [created_datetime], [Updated_By], [Updated_Datetime]) VALUES (CAST(5 AS Numeric(5, 0)), N'Political', N'Political', CAST(1 AS Numeric(5, 0)), CAST(0x0000A5F800000000 AS DateTime), NULL, CAST(0x0000A5F8013BA708 AS DateTime))
GO
INSERT [dbo].[YSG_Event_Master] ([Event_no], [Event_name], [Description], [created_By], [created_datetime], [Updated_By], [Updated_Datetime]) VALUES (CAST(6 AS Numeric(5, 0)), N'Other', N'Other', CAST(1 AS Numeric(5, 0)), CAST(0x0000A5F800000000 AS DateTime), NULL, CAST(0x0000A5F8013BB5C0 AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[YSG_Event_Master] OFF
GO



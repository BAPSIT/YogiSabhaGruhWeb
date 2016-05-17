
/****** Object:  Table [dbo].[YSG_Booking_Info]    Script Date: 15/05/2016 11:17:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[YSG_Booking_Info](
	[Booking_No] [numeric](12, 0) IDENTITY(1,1) NOT NULL,
	[Booking_ID] [numeric](12, 0) NULL,
	[Booking_Date] [datetime] NULL CONSTRAINT [DF__YSG_Booki__Booki__31EC6D26]  DEFAULT (getdate()),
	[Booking_FromTime] [datetime] NULL CONSTRAINT [DF__YSG_Booki__Booki__32E0915F]  DEFAULT (getdate()),
	[Booking_ToTime] [datetime] NULL CONSTRAINT [DF__YSG_Booki__Booki__33D4B598]  DEFAULT (getdate()),
	[Event_no] [numeric](5, 0) NULL,
	[Event_Class] [varchar](50) NULL,
	[Customer_no] [numeric](10, 0) NULL,
	[Booking_Status] [nvarchar](1) NULL,
	[No_Of_Invitees] [numeric](6, 0) NULL,
	[Booking_calculated_Amt] [numeric](19, 4) NULL,
	[Discount] [numeric](19, 4) NULL,
	[Discount_Reason] [nvarchar](2000) NULL,
	[Booking_final_Amt] [numeric](19, 4) NULL,
	[RemarkOrComments] [nvarchar](2000) NULL,
	[Paid_Amt] [numeric](19, 4) NULL,
	[Balance_Amt] [numeric](19, 4) NULL,
	[created_By] [numeric](5, 0) NULL,
	[created_datetime] [datetime] NULL CONSTRAINT [DF__YSG_Booki__creat__34C8D9D1]  DEFAULT (getdate()),
	[Updated_By] [numeric](5, 0) NULL,
	[Updated_Datetime] [datetime] NULL CONSTRAINT [DF__YSG_Booki__Updat__35BCFE0A]  DEFAULT (getdate()),
	[IsActive] [char](1) NULL CONSTRAINT [DF_YSG_Booking_Info_IsActive]  DEFAULT ('Y'),
	[Cancellation_Reason] [varchar](4000) NULL,
	[Cancellation_Description] [varchar](4000) NULL,
	[Cancellation_Refunded_Amt] [numeric](19, 4) NULL,
	[Cancellation_Datetime] [datetime] NULL,
 CONSTRAINT [PK__YSG_Book__35AB94AB109AF86F] PRIMARY KEY CLUSTERED 
(
	[Booking_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[YSG_Booking_Info]  WITH CHECK ADD  CONSTRAINT [FK__YSG_Booki__Event__5535A963] FOREIGN KEY([Event_no])
REFERENCES [dbo].[YSG_Event_Master] ([Event_no])
GO

ALTER TABLE [dbo].[YSG_Booking_Info] CHECK CONSTRAINT [FK__YSG_Booki__Event__5535A963]
GO

ALTER TABLE [dbo].[YSG_Booking_Info]  WITH CHECK ADD  CONSTRAINT [FK_YSG_Booking_Info_YSG_Customer_Info] FOREIGN KEY([Customer_no])
REFERENCES [dbo].[YSG_Customer_Info] ([Customer_no])
GO

ALTER TABLE [dbo].[YSG_Booking_Info] CHECK CONSTRAINT [FK_YSG_Booking_Info_YSG_Customer_Info]
GO




ALTER TABLE [dbo].[YSG_BOOKING_INFO]
ADD Hall_no NUMERIC(5,0) 

ALTER TABLE [dbo].[ysg_booking_info]  WITH CHECK ADD FOREIGN KEY([Hall_no])
REFERENCES [dbo].[YSG_Hall_Master] ([Hall_no])
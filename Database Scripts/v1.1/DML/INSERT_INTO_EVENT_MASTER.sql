
DELETE FROM YSG_Event_Master WHERE Event_name = 'Political'

INSERT INTO YSG_Event_Master(Event_name, [Description], created_By, created_datetime)
VALUES('Religious','Religious',1, GETDATE())
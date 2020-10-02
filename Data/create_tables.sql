drop table IF exists Chironomist_Gesture;
drop table IF exists Gesture;
drop table IF exists Chironomist;
drop table IF exists Instrumentalist;
drop table IF exists Register;
drop table IF exists Unattributed_Inscription;
drop table IF exists OEE_Scene;
drop table IF exists Reference;
drop table IF exists Scene;
drop table IF exists OEE_Scene_Detail;
drop table IF exists Tomb_Number;
drop table IF exists Chronology;
drop table IF exists Tomb;
drop table IF exists Reign;
drop table IF exists Location;
.mode csv
.header on

-- telling SQLite to recognise nulls
-- UPDATE table SET column = NULL WHERE column = '';

-- Selecting (i.e. showing) possible updates when (re)-running in Terminal
-- SELECT *
--   FROM table
--  LIMIT 3;

create table Location (
  Location_ID	integer primary key,
  Site text,
  Cemetery text,
  Country text,
  Latitude text,
  Longitude text,
  Pleiades_Entry text
);

.import csv_files/Location.csv Location

UPDATE Location SET Cemetery = NULL WHERE Cemetery = '';
UPDATE Location SET Latitude = NULL WHERE Latitude = '';
UPDATE Location SET Longitude = NULL WHERE Longitude = '';
UPDATE Location SET Pleiades_Entry = NULL WHERE Pleiades_Entry = '';



create table Reign (
  Reign text primary key,
  Sort_Order text,
  Dynasty text
);

.import csv_files/Reign.csv Reign



create table Tomb (
  Tomb_ID integer primary key,
  Location_ID integer references Location,
  Chronology_ID integer references Chronology,
  Appellation text
);

.import csv_files/Tomb.csv Tomb

UPDATE Tomb SET Location_ID = NULL WHERE Location_ID = '';



create table Chronology (
  Chronology_ID integer primary key,
  Period_Start text,
  Period_End text,
  Dynasty_Start text,
  Dynasty_End text,
  Reign_Start text references Reign,
  Reign_End text references Reign
);

.import csv_files/Chronology.csv Chronology

UPDATE Chronology SET Dynasty_Start = NULL WHERE Dynasty_Start = '';
UPDATE Chronology SET Dynasty_End = NULL WHERE Dynasty_End = '';
UPDATE Chronology SET Reign_Start = NULL WHERE Reign_Start = '';
UPDATE Chronology SET Reign_End = NULL WHERE Reign_End = '';



create table Tomb_Number (
  Tomb_ID integer references Tomb,
  Database text,
  Tomb_Number text,
  URL text,
  primary key (Tomb_ID, Database, Tomb_Number)
);

.import csv_files/Tomb_Number.csv Tomb_Number

UPDATE Tomb_Number SET Database = NULL WHERE Database = '';
UPDATE Tomb_Number SET URL = NULL WHERE URL = '';


create table OEE_Scene_Detail (
  OEE_ID integer primary key,
  OEE_Scene_Detail text,
  OEE_Scene_Detail_Name text,
  OEE_Query_URL text
);

.import csv_files/OEE_Scene_Detail.csv OEE_Scene_Detail



create table Scene (
  Scene_ID integer primary key,
  Tomb_ID integer references Tomb,
  Context text,
  Room integer,
  Wall text,
  State_of_Preservation text,
  Note text
);

.import csv_files/Scene.csv Scene

UPDATE Scene SET Context = NULL WHERE Context = '';
UPDATE Scene SET Room = NULL WHERE Room = '';
UPDATE Scene SET Wall = NULL WHERE Wall = '';
UPDATE Scene SET State_of_Preservation = NULL WHERE State_of_Preservation = '';
UPDATE Scene SET Note = NULL WHERE Note = '';



create table Reference (
  Reference_ID integer primary key,
  Scene_ID integer references Scene,
  Main_Reference text
);

.import csv_files/Reference.csv Reference



create table OEE_Scene (
  OEE_ID integer references OEE_Scene_Detail,
  Tomb_ID integer references Tomb,
  primary key (OEE_ID, Tomb_ID)
);

.import csv_files/OEE_Scene.csv OEE_Scene



create table Unattributed_Inscription (
  Unattributed_Inscription_ID integer primary key,
  Scene_ID integer references Scene,
  Inscription text,
  Inscription_Orientation text,
  Forearm_Determinative_Upper_Arm_Angle text,
  Forearm_Determinative_Palm_Orientation text,
  Forearm_Determinative_Wrist_Angle text,
  "Forearm_Determinative_.t-ending_Position" text
);

.import csv_files/Unattributed_Inscription.csv Unattributed_Inscription

UPDATE Unattributed_Inscription SET Inscription_Orientation = NULL WHERE Inscription_Orientation = '';
UPDATE Unattributed_Inscription SET Forearm_Determinative_Upper_Arm_Angle = NULL WHERE Forearm_Determinative_Upper_Arm_Angle = '';



create table Register (
  Resgister_ID integer primary key,
  Scene_ID integer references Scene,
  Register integer,
  Subregister real
);

.import csv_files/Register.csv Register

UPDATE Register SET Register = NULL WHERE Register = '';
UPDATE Register SET Subregister = NULL WHERE Subregister = '';



create table Instrumentalist (
  Instrumentalist_ID integer primary key,
  Scene_ID integer references Scene,
  Sex text,
  Instrument text,
  Inscription text,
  Orientation_Body text,
  Orientation_Face text,
  Scene_Order_left_to_right integer,
  Subregister_Order_left_to_right integer
);

.import csv_files/Instrumentalist.csv Instrumentalist

UPDATE Instrumentalist SET Sex = NULL WHERE Sex = '';
UPDATE Instrumentalist SET Instrument = NULL WHERE Instrument = '';
UPDATE Instrumentalist SET Inscription = NULL WHERE Inscription = '';
UPDATE Instrumentalist SET Orientation_Body = NULL WHERE Orientation_Body = '';
UPDATE Instrumentalist SET Orientation_Face = NULL WHERE Orientation_Face = '';
UPDATE Instrumentalist SET Scene_Order_left_to_right = NULL WHERE Scene_Order_left_to_right = '';
UPDATE Instrumentalist SET Subregister_Order_left_to_right = NULL WHERE Subregister_Order_left_to_right = '';



create table Chironomist (
  Chironomist_ID integer primary key,
  Scene_ID integer references Scene,
  Sex	text,
  Orientation_Body text,
  Orientation_Face text,
  Orientation_Arms text,
  Scene_Order_left_to_right	integer,
  Subregister_Order_left_to_right integer,
  Inscription	text,
  Inscription_Orientation	text,
  Forearm_Determinative_Upper_Arm_Angle text,
  Forearm_Determinative_Palm_Orientation text,
  Forearm_Determinative_Wrist_Angle text,
  "Forearm_Determinative_.t-ending_Position" text
);

.import csv_files/Chironomist.csv Chironomist

UPDATE Chironomist SET Sex = NULL WHERE Sex = '';
UPDATE Chironomist SET Inscription = NULL WHERE Inscription = '';
UPDATE Chironomist SET Orientation_Body = NULL WHERE Orientation_Body = '';
UPDATE Chironomist SET Orientation_Face = NULL WHERE Orientation_Face = '';
UPDATE Chironomist SET Orientation_Arms = NULL WHERE Orientation_Arms = '';
UPDATE Chironomist SET Scene_Order_left_to_right = NULL WHERE Scene_Order_left_to_right = '';
UPDATE Chironomist SET Subregister_Order_left_to_right = NULL WHERE Subregister_Order_left_to_right = '';
UPDATE Chironomist SET Forearm_Determinative_Upper_Arm_Angle = NULL WHERE Forearm_Determinative_Upper_Arm_Angle = '';
UPDATE Chironomist SET Forearm_Determinative_Palm_Orientation = NULL WHERE Forearm_Determinative_Palm_Orientation = '';
UPDATE Chironomist SET Forearm_Determinative_Wrist_Angle = NULL WHERE Forearm_Determinative_Wrist_Angle = '';
UPDATE Chironomist SET "Forearm_Determinative_.t-ending_Position" = NULL WHERE "Forearm_Determinative_.t-ending_Position" = '';



create table Gesture (
  Gesture_ID text primary key,
  Name text,
  Description text
);

.import csv_files/Gesture.csv Gesture



create table Chironomist_Gesture (
  Chironomist_ID integer references Chironomist,
  Hand_NF	text,
  Hand_RL text,
  Gesture_ID text references Gesture,
  Arm_Height_Description text,
  Arm_Angle_Description text,
  primary key (Chironomist_ID, Hand_NF)
);

.import csv_files/Chironomist_Gesture.csv Chironomist_Gesture

UPDATE Chironomist_Gesture SET Gesture_ID = NULL WHERE Gesture_ID = '';
UPDATE Chironomist_Gesture SET Arm_Height_Description = NULL WHERE Arm_Height_Description = '';
UPDATE Chironomist_Gesture SET Arm_Angle_Description = NULL WHERE Arm_Angle_Description = '';






DROP VIEW IF EXISTS 'For building Appendix A';
CREATE VIEW 'For building Appendix A' AS
SELECT Scene_ID,
	     Appellation,
	     Site || ', ' || Cemetery AS 'Site, Cemetery',
	     Reign_Start || ', ' || Dynasty_Start AS 'Date Start',
	     Reign_End || ', ' || Dynasty_End AS 'Date End',
	     Main_Reference
  FROM Tomb
  JOIN Scene USING (Tomb_ID)
  JOIN Location USING (Location_ID)
  JOIN Chronology USING (Chronology_ID)
  JOIN Reference USING (Scene_ID)
;

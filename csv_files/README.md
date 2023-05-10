# Dictionary for /data tables

## Overview

This folder holds CSV tables used for inputting data into the DB. There are 15 tables of data. These are stored in .csv files. These were imported into an SQLite database (old_kingdom_musical_ensemble_scenes.db) after running the creation statement in *add later*/create_tables.sql via create_database.sh.

These tables hold various types of iconographical, textual, geographic, typological, and referential data related to the corpus of 101 musical ensemble scenes from Old Kingdom Egypt.

## The Tables

Key:
- **primary key** (bolded)
- *foreign key* (italicised)

The **15** data tables and their columns are:

### 1. Location
* **Location_ID**
* Site
* Cemetery
* Country
* Latitude
* Longitude
* Pleiades_Entry
### 2. Reign
* **Reign**
* Sort_Order
* Dynasty
### 3. Chronology
* **Chronology_ID**
* Period_Start
* Period_End
* Dynasty_Start
* Dynasty_End
* *Reign_Start*
* *Reign_End*
### 4. **Tomb**
* **Tomb_ID**
* *Location_ID*
* *Chronology_ID*
* Appellation
### 5. Tomb_Number
* **Tomb_ID**
* **Database**
* **Tomb_Number**
* URL
### 6. OEE_Scene_Detail
* **OEE_ID**
* OEE_Scene_Detail
* OEE_Scene_Detail_Name
* OEE_Query_URL
### 7. **OEE_Scene**
* ***OEE_ID***
* ***Tomb_ID***
### 8. Scene
* **Sene_ID**
* *Tomb_ID*
* Context
* Room
* Wall
* State_of_Preservation
* Note
### 9. Reference
* **Reference_ID**
* *Scene_ID*
* Main_Reference
### 10. Unattributed_Inscription
* **Unattributed_Inscription_ID**
* *Scene_ID*
* Inscription
* Inscription_Orientation
* Forearm_Determinative_Upper_Arm_Angle
* Forearm_Determinative_Palm_Orientation
* Forearm_Determinative_Wrist_Angle
* Forearm_Determinative_.t-ending_Position
### 11. Register
* **Register_ID**
* *Scene_ID*
* Register
* Subregister
### 12. Instrumentalist
* **Instrumentalist_ID**
* *Scene_ID*
* Sex
* Instrument
* Inscription
* Orientation_Body
* Orientation_Face
* Scene_Order_left_to_right
* Subregister_Order_left_to_right
### 13. Chironomist
* **Chironomist_ID**
* *Scene_ID*
* Sex
* Orientation_Body
* Orientation_Face
* Orientation_Arms
* Scene_Order_left_to_right
* Subregister_Order_left_to_right
* Inscription
* Inscription_Orientation
* * Forearm_Determinative_Upper_Arm_Angle
* Forearm_Determinative_Palm_Orientation
* Forearm_Determinative_Wrist_Angle
* Forearm_Determinative_.t-ending_Position
### 14. Gesture
* **Gesture_ID**
* Name
* Description
### 15. Chironomist_Gesture
* ***Chironomist_ID***
* **Hand_NF**
* Hand_RL
* *Gesture_ID*
* Arm_Height_Description
* Arm_Angle_Description

## Table Field Descriptions

### Location

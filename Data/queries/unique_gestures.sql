-- Scenes in which unique gestures appear


SELECT Appellation,
	   Scene_ID, 
	   Chironomist_ID, 
	   Hand_RL, 
	   Gesture_ID, 
	   Arm_Angle_Description, 
	   Arm_Height_Description
  FROM Chironomist
  JOIN Chironomist_Gesture USING (Chironomist_ID)
  JOIN Scene USING (Scene_ID)
  JOIN Tomb USING (Tomb_ID)
 WHERE Chironomist_ID IN (114, 115, 134, 21) 

;
-- do something amusing

-- HOW MANY CHIRONOMISTS ARE AT GIZA lol

SELECT Site || ', ' || Cemetery AS "Location",
	   Appellation AS "Tomb",
	   Scene_ID,
	   Chironomist_ID,
	   Sex,
	   Hand_RL || ' - ' || Name AS "Gesture",
	   Inscription
  FROM Chironomist
  JOIN Chironomist_Gesture USING (Chironomist_ID)
  JOIN Gesture USING (Gesture_ID)
  JOIN Scene USING (Scene_ID)
  JOIN Tomb USING (Tomb_ID)
  JOIN Location USING (Location_ID)
 WHERE Site = 'Giza' 

  ;


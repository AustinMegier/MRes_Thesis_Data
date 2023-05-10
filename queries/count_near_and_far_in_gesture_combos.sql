-- count near and far for combination of gestures
-- "for combination G3+ G4, near/far irrespective,
--  G1 is near x times, far y times, g2 is near x times, far y times"


-- get all gesture combos
DROP VIEW IF EXISTS gesture_combo;
CREATE VIEW gesture_combo AS 
  SELECT Scene_ID, Chironomist_ID, Gesture_ID_Combination_Key, Gesture_ID_Near, Gesture_ID_Far
    FROM Chironomist 
	JOIN (SELECT Chironomist_ID, Gesture_ID AS Gesture_ID_Near
	        FROM Chironomist_Gesture
		   WHERE Hand_NF = 'near') USING (Chironomist_ID)
	JOIN (SELECT Chironomist_ID, Gesture_ID AS Gesture_ID_Far
	        FROM Chironomist_Gesture
		   WHERE Hand_NF = 'far') USING (Chironomist_ID)
-- brian is not thinking well today. This is a hack.
    JOIN (SELECT Chironomist_ID, group_concat(Gesture_ID,'+') AS Gesture_ID_Combination_Key
	        FROM (SELECT * 
			        FROM Chironomist_Gesture
				   ORDER BY Gesture_ID)
		   GROUP BY Chironomist_ID) USING (Chironomist_ID)
		   
		  ;

-- All chironomists with gesture combo x. Highlight this query to run
SELECT * From gesture_combo WHERE Gesture_ID_Combination_Key = 'G1+G2';	

 SELECT Gesture_id_combination_key, 
	    Gesture_id_near, 
		Gesture_id_far, 
	    count(*) AS Gesture_count

   FROM gesture_combo
--   add WHERE command for individual combos (saved default G3+G4)
--   WHERE Gesture_ID_Combination_Key = 'G3+G4'
   GROUP BY Gesture_id_combination_key, gesture_id_near, gesture_id_far
   
 
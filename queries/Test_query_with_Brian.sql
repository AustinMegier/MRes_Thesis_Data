-- List of all chironomists featuring both Gesture_ID 1 & 3


-- List the ID, Scene, and sex of all chiros who are showing BOTH gestures one and three

-- Show us ID , Sex , blah from Chironomist
-- Remove all chironomists who do not feature Gesture_ID 1
--   INCLUDE only those IDs who have 1
-- remove all who do not have Gesture_ID 3
--   INCLUDE only those IDs who have 3


SELECT Chironomist_ID,  Scene_ID, Sex
  FROM Chironomist
--  JOIN Chironomist_Gesture USING (Chironomist_ID);
 WHERE Chironomist_ID IN (SELECT Chironomist_ID
                            FROM Chironomist_Gesture
						   WHERE Gesture_ID = 1)
   AND Chironomist_ID IN (SELECT Chironomist_ID
                            FROM Chironomist_Gesture
						   WHERE Gesture_ID = 3)
						   ;

 -- Chironomist_ID, Gender, Hand_RL, Gesture_ID, Name, and Context, Room, Wall
SELECT Chironomist_ID, Sex, Hand_RL, Gesture_ID, Name, Context, Room, Wall
  FROM Chironomist
  JOIN Chironomist_Gesture USING (Chironomist_ID)
  JOIN Gesture USING (Gesture_ID)
  JOIN Scene USING (Scene_ID)

  ;

SELECT Chironomist_ID,
       Sex,
       R_Hand_RL as "Right hand gesture",
--	   L_Hand_RL as "Left hand gesture",
	   Context,
	   Room,
	   Wall
  FROM Chironomist
  -- What is the purpose and function of this subquery?
  JOIN (SELECT Chironomist_ID, Hand_RL ||' blah ' ||Name as R_Hand_RL
          FROM Chironomist_Gesture
		  JOIN Gesture USING (Gesture_ID)
		 WHERE Hand_RL = 'R'
		   --AND Gesture_ID IN (1,3)
		   AND (Gesture_ID = 1 OR Gesture_ID = 3)
		   )
		 USING (Chironomist_ID)
  JOIN Scene USING (Scene_ID)

  ;

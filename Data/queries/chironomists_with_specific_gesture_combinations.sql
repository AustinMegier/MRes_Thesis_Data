-- Select all chironomists featuring specific gesture combinations

-- The saved example is for chironomists featuring Gesture_IDs 1 & 3

SELECT Scene_ID, Chironomist_ID, Sex
-- Add DISTINCT above if you want to know purely 'how many' chironomists.
  FROM Chironomist
-- If you want to also select the columns from Chironomist_Gesture (e.g. Gesture_ID, Hand_RL),
-- then include the below command and emend SELECT.
--  JOIN Chironomist_Gesture USING (Chironomist_ID)
 WHERE Chironomist_ID IN (SELECT Chironomist_ID
                            FROM Chironomist_Gesture
						   WHERE Gesture_ID = 1)
   AND Chironomist_ID IN (SELECT Chironomist_ID
                            FROM Chironomist_Gesture
						   WHERE Gesture_ID = 3)
						   ;

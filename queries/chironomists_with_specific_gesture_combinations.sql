-- An alternate version of this query is now saved in count_near_and_far_in_gesture_combo. 

-- Select all chironomists featuring specific gesture combinations

-- The saved example is for chironomists featuring Gesture_IDs G1 & G2

SELECT Scene_ID, Chironomist_ID, Sex
-- Add DISTINCT above if you want to know purely 'how many' chironomists.
  FROM Chironomist
-- If you want to also select the columns from Chironomist_Gesture (e.g. Gesture_ID, Hand_RL),
-- then include the below command and emend SELECT.
--  JOIN Chironomist_Gesture USING (Chironomist_ID)
 WHERE Chironomist_ID IN (SELECT Chironomist_ID
                            FROM Chironomist_Gesture
						   WHERE Gesture_ID = 'G1')
   AND Chironomist_ID IN (SELECT Chironomist_ID
                            FROM Chironomist_Gesture
						   WHERE Gesture_ID = 'G2')
						   ;

-- show me all musicians from each scene 

-- ordered by register/subregister order?

-- this is very poorly done. but it works for now.

SELECT Scene_ID,
	   Instrumentalist_ID,
	   Instrument, 
	   Instrumentalist.Scene_Order_left_to_right,
	   Chironomist_ID,
	   Gesture_ID,
	   Hand_NF,
-- IF/when I add the View for gesture combos into my create_database.sql, I can (cheat by)
	-- replacing Gesture_ID with 
	  -- Gesture_ID_Near || '+' || Gesture_ID_Far AS Gesture_ID_Near_Far,
	  -- don't know if this will work.
	   Chironomist.Scene_Order_left_to_right
  FROM Scene
  JOIN Instrumentalist USING (Scene_ID)
  JOIN Chironomist USING (Scene_ID)
  JOIN Chironomist_Gesture USING (Chironomist_ID)
  -- JOIN gesture_combo USING (Chironomist_ID)
 WHERE Instrumentalist.Scene_Order_left_to_right OR Chironomist.Scene_Order_left_to_right IS NOT NULL
 ORDER BY Scene_ID ASC, Instrumentalist_ID ASC, Chironomist_ID ASC, Hand_NF DESC 
 
  ;
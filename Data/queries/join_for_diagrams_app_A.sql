-- show me all musicians from each scene 

-- ordered by register/subregister order?

-- this is very poorly done. but it works for now.

SELECT Scene_ID, 
	   Instrumentalist_ID,
	   Instrument, 
	   Instrumentalist.Scene_Order_left_to_right,
	   Chironomist_ID,
	   Chironomist.Scene_Order_left_to_right
  FROM Scene
  JOIN Instrumentalist USING (Scene_ID)
  JOIN Chironomist USING (Scene_ID)
 WHERE Instrumentalist.Scene_Order_left_to_right OR Chironomist.Scene_Order_left_to_right IS NOT NULL
 ORDER BY Scene_ID ASC, Instrumentalist_ID ASC, Chironomist_ID ASC 
 
  ;
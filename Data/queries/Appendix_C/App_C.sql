-- A query that will eventually become the VIEW for Appendix C

-- It might be a good idea to include a surrogate "Instrumentalist_ID" type column 

SELECT Scene_ID AS "Scene",
	   Appellation AS "Tomb Appellation",
	   Sex,
	   Instrument,
	   Inscription,
	   Scene_Order_left_to_right AS "Scene Order (left to right, bottom to top)"
	  -- *
  FROM Instrumentalist
  JOIN Scene USING (Scene_ID)
  JOIN Tomb USING (Tomb_ID)
 ORDER BY Scene_ID, Instrumentalist_ID
  ;
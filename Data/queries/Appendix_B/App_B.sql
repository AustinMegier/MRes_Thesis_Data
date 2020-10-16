-- A query that will eventually become the view for Appendix B

-- It could be a good idea to include a surrogate "Instrumentalist_ID" type column.
	-- The Gesture_ID_Combination_Key serves as another identifier, but not a unique identifier.
	-- Remember as well that 57b is still 101.

SELECT Scene.Scene_ID AS "Scene",
	   Appellation AS "Tomb Appellation",
	   Chironomist.Sex,
	   (coalesce(Gesture_ID_Near, "G?")  || '+' || coalesce(Gesture_ID_Far, "G?")) AS "Gesture Combination",
	   Inscription,
	   Scene_Order_left_to_right AS "Scene Order (left to right, bottom to top)"
 -- if i remove the *, the query fucks up. Why?
  FROM Chironomist
  JOIN Scene USING (Scene_ID)
  JOIN Tomb USING (Tomb_ID)
  JOIN gesture_combo USING (Chironomist_ID)
 ORDER BY Scene.Scene_ID, Chironomist_ID
 ;
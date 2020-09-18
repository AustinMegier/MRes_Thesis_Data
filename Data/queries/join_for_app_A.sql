-- FOR BUILDING APPENDIX A - join Tomb, Location, Chronology, Scene, and Reference

SELECT Scene_ID,
	   Tomb_ID,
	   Appellation,
	   Location_ID,
	   Site || ', ' || Cemetery AS 'Site, Cemetery',
	   Chronology_ID, 
	   Reign_Start || ', ' || Dynasty_Start AS 'Date Start', 
	   Reign_End || ', ' || Dynasty_End AS 'Date End', 
	   Main_Reference
  FROM Tomb
  JOIN Scene USING (Tomb_ID)
  JOIN Location USING (Location_ID)
  JOIN Chronology USING (Chronology_ID)
  JOIN Reference USING (Scene_ID)
;
-- Are there multiple scenes on the same wall in the same room - Nulls included?

-- Yes:
-- Ptahhotep II (Scene_ID 57, 101 in Tomb_ID 53), 
-- Schneider(?) (Scene_ID, 76, 77 in Tomb_ID 70); walls are both 'Null', so we don't know.

  SELECT Scene_ID,
		 Tomb_ID,
		 Appellation,
		 Tomb_ID,
		 Room,
		 Wall
    FROM Scene
    JOIN Tomb USING (Tomb_ID)
   WHERE Appellation IN ("Ptahhotep II", "Schneider")
ORDER BY Tomb_ID ASC;
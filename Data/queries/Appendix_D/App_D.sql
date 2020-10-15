-- A query that will eventually become the VIEW for Appendix D(?) or something


SELECT Scene_ID AS "Scene",
	   Appellation,
	   Inscription
	   -- Inscription_Orientation

  FROM Unattributed_Inscription
  JOIN Scene USING (Scene_ID)
  JOIN Tomb USING (Tomb_ID)
 ORDER BY Scene_ID
  ;
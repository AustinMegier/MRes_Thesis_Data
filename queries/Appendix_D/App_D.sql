-- A query that will eventually become the VIEW for Appendix D(?) or something

-- Right now, it's just Unnattributed Inscriptions. I could have the appendix be ALL inscriptions??
	-- Remember as well that 57b is still 101.

SELECT Scene_ID AS "Scene",
	   Appellation,
	   Inscription
	   -- Inscription_Orientation

  FROM Unattributed_Inscription
  JOIN Scene USING (Scene_ID)
  JOIN Tomb USING (Tomb_ID)
 ORDER BY Scene_ID
  ;
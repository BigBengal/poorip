select a.CTY_NAME, b.CTR_NAME from city a, country b
	where a.CTR_SEQ = b.CTR_SEQ
	  and a.CTY_NAME like '%르셀%';
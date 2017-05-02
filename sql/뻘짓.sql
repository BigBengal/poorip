	select a.usr_email as email, count(case when a.USR_PREF1 = usr1.usr_pref1 then 1 end)+
			count(case when a.USR_PREF2 = usr1.usr_pref2 then 1 end)+
			count(case when a.USR_PREF3 = usr1.usr_pref3 then 1 end)+
			count(case when a.USR_PREF4 = usr1.usr_pref4 then 1 end)+
			count(case when a.USR_PREF5 = usr1.usr_pref5 then 1 end) as pref_prior
	from users a, 
		 (select usr_email, usr_pref1, usr_pref2, usr_pref3,usr_pref4,usr_pref5
			 from users 
			where usr_email = 'hanys123@gmail.com') usr1
	where 1=1
	and a.usr_email <> usr1.usr_email
	group by a.usr_email
	order by pref_prior desc
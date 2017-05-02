-------------------------------country--------------------------------
select * from country;

insert into country values (null, '그리스', now());

delete from country where ctr_name = '프랑스';
delete from country where ctr_name = '이탈리아';
update country set ctr_name = '러시아' where ctr_seq = 8;


commit;

rollback;
-------------------------------city--------------------------------
select *  FROM city;

insert INTO city values(null, '피렌체', now(), 9);

delete from city where CTY_seq=7;

update city SET cty_name='파리', ctr_seq=9 WHERE CTY_seq=14;

select c1.cty_seq, c1.cty_name, c1.crt_date, c1.ctr_seq, c.ctr_name
	from country c, city c1
where c1.CTR_SEQ = c.CTR_SEQ;

insert 
			  into city 
			values (null, '베니스', now(), 3);
			

;
select auto_increment
from information_schema.tables
where table_schema='bengal'
 and table_name='post'
 
;
-------------------------------category--------------------------------
select * from category;


-------------------------------travelinfo--------------------------------
-- getScrapInfo
select travel_info.crt_date, travel_info.NAME, travel_info.CONTENTS,hours, location, picture, price, map_url, contact 
from scrap, travel_info 
where scrap.TRV_SEQ=travel_info.TRV_SEQ
AND scrap.USR_EMAIL = 'test';

select * FROM travel_info;

--insert
insert into travel_info
	values(null,
		   '에펠탑',
		   '1889년 파리 마르스 광장에 지어진 탑이다.',
		   '24h',
		   '프랑스 파리 시',
		   'TourEiffel.png',
		   '0 won',
		   now(),
		   14,
		   1,
		   null,
		   '연락정보');
		   
-- getInfo   
select crt_date, name, contents, hours, location, picture, price, map_url, contact
from travel_info;

--delete
DELETE FROM travel_info WHERE NAME = '에펠탑';

-------------------------------travelinfoPic--------------------------------
select * from travel_info;

-- insert
insert into travel_info_pic values(null, 'D:\bigdate2017', 'TourEiffel.png', 4, now());

-- delete
delete from travel_info_pic where FILE_NAME = 'TourEiffel.png';

-- select
select tip.path as path, tip.file_Name as fileName
	from travel_info_pic tip, travel_info ti
where ti.TRV_SEQ = tip.TRV_SEQ;

select * from scrap;
select * from users;
select * from travel_info_pic;

select * from post;
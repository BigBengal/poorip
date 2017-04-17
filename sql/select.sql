select * from users;

select * from scrap_city s;

insert 
into users 
values (0, 'bengal@naver.com','자기소개','M','KOR','20000101','닉네임','간략소개','해쉬태크','1','1','5','3','2','N',now(), now(),'N');



insert into scrap_city values(null, str_to_date('04/12/2017', '%c/%e/%Y'), str_to_date('04/12/2017','%c/%e/%Y') , now());
select*from scrap_city;

insert into scrap values(null, 1, 1, 2, now());

select * from country;
select * from city;


select * from category;

select * from travel_info;

select * from scrap;

select * from travel_info_pic;

select * from post;

select * from post_pic;

select * from pool_party;

select * from pool_member;

SELECT * from pool_post;

select ci.cty_seq as 도시번호,
	   ci.cty_name as 도시이름,
	   ci.CTR_SEQ as 나라번호,
	   cu.CTR_NAME as 나라이름
	from city ci, country cu
where ci.CTR_SEQ = cu.CTR_SEQ;

select ci.CTY_SEQ, ci.CTY_NAME, cu.CTR_NAME
	from city ci, country cu
where (ci.CTY_NAME like '%르셀%'
or cu.CTR_NAME like '%르셀%')
and ci.CTR_SEQ = cu.CTR_SEQ;

select ci.CTY_SEQ, ci.CTY_NAME, cu.CTR_NAME
	from city ci, country cu
where ci.CTR_SEQ = cu.CTR_SEQ;

select a.CTY_NAME, b.CTR_NAME from city a, country b
	where a.CTR_SEQ = b.CTR_SEQ
	  and a.CTY_NAME like '%르셀%';

create view search
	as select ci.CTY_SEQ, ci.CTY_NAME, cu.CTR_NAME
	from city ci, country cu
where ci.CTR_SEQ = cu.CTR_SEQ;

select * from seach;

select cty_seq from seach where cty_name = '파리';

select CAT_SEQ as catSeq, CAT_NAME as catName from category;

select CTR_SEQ as ctrSeq, CTR_NAME as ctrName from country;

select CTY_SEQ as ctySeq, CTY_NAME as ctyName from city
	where CTR_SEQ = 1;

select * from city;

insert into travel_info values(null,'혜영이','꽃같은 혜영이','항상 24시간','파리에 없당 비트에 있당','2017317518780.png',2,4,'01088397290');


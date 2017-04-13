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
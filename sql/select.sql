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

create view city_search
	as select ci.CTY_SEQ, ci.CTY_NAME, cu.CTR_NAME
	from city ci, country cu
where ci.CTR_SEQ = cu.CTR_SEQ;

drop view seach;

select * from city_search;

select cty_seq from city_search where cty_name = '파리';

select CAT_SEQ as catSeq, CAT_NAME as catName from category;

select CTR_SEQ as ctrSeq, CTR_NAME as ctrName from country;

select CTY_SEQ as ctySeq, CTY_NAME as ctyName from city
	where CTR_SEQ = 1;

select * from city;

insert into travel_info values(null,'혜영이','꽃같은 혜영이','항상 24시간','파리에 없당 비트에 있당','2017317518780.png',2,4,'01088397290');

select * from post_pic;
select * from post;

insert into post values(null, "d" , "d", "Y", 1, 23, now());
insert into post_pic values(null, "path", "file_name2", (select max(post_seq)from post where usr_seq=1), now());

insert into
				post_pic values(null,
								'path',
								'file_name2',
								(select max(post_seq) as postSeq
									from post
								where usr_seq = 14),
								now());
insert into
	post_pic values(null,
					#{path },
					#{fileName },
					(select max(post_seq) as postSeq
						from post
					where usr_seq = 14),
					now());	
								
delete from post where post_seq = 49;

select count(*)
		  from post
		  where usr_seq =14;
		  


select p.post_seq,
		   		 title,
				 contents,
		 		 p.usr_seq,
				 p.crt_date
			  from post p, users u
	where p.USR_SEQ = u.USR_SEQ
	  and p.usr_seq = 14
    order by crt_date desc
	limit 0, 3;

select rownum as rn, a.*
	from ( select p.post_seq,
		   		 title,
				 contents,
		 		 p.usr_seq,
				 p.crt_date
			  from post p, users u
	where p.USR_SEQ = u.USR_SEQ
	  and p.usr_seq = 14
    order by crt_date desc) a;

		 
		 select a.POST_SEQ as postSeq, 
				   a.title as title, 
				   a.contents as contents, 
				   a.CRT_DATE as crtDate, 
				   a.TRV_SEQ as trvSeq 
					   from post a, travel_info b 
					   where a.TRV_SEQ = b.trv_seq 
					   and a.REVIEW_PUB_YN='Y' and b.trv_seq=14
				   order by crtDate desc
				limit 0, 1;
				
select * from post_pic;
			select*from travel_info;
select * from post;

select p.post_seq as postSeq,
	   title,
	   contents,
	   path,
	   file_name as fileName,
	   p.crt_date as crtDate
	   		from post p, post_pic pp
   where p.post_seq = pp.post_seq
	  and p.usr_seq = 14
      and pp.post_seq = (select max(post.post_seq) as postSeq
	  									from post post, post_pic postpic
							where post.POST_SEQ = postpic.POST_SEQ
							  and post.usr_seq = 14); 
							  
select*from post a, post_pic b where a.`POST_SEQ`=b.`POST_SEQ`;							  
select * from post;
select * from post_pic;
select p.post_seq as postSeq,
				   title,
				   contents,
				   p.usr_seq as usrSeq,
				   p.crt_date as crtDate
				from post p, users u
			where p.USR_SEQ = u.USR_SEQ
			  and p.usr_seq = 14
	order by p.crt_date desc
		limit 0,3;
			
select file_name as fileName
	from post_pic pp, post p
		where pp.post_seq = p.post_seq
	  	  and pp.post_seq = 68;
		  
		  select p.post_seq as postSeq,
				   title,
				   contents,
				   p.usr_seq as usrSeq,
				   p.crt_date as crtDate
				from post p, users u, post_pic pp
			where p.USR_SEQ = u.USR_SEQ
			  and p.usr_seq = 14
			order by p.crt_date desc
			limit 0, 18;
			
			select p.post_seq as postSeq,
				   title,
				   contents,
				   p.usr_seq as usrSeq,
				   p.crt_date as crtDate
				from post p, pool_post pp
			where p.POST_SEQ = pp.POST_SEQ
			  and pp.POOL_SEQ = 10
	order by p.crt_date desc;
drop table if exists video;
create table video(
video_id integer primary key not null,
title text not null,
length integer not null,
URL text not null
);

insert into video
values(1, 'SQL Tutorial - Full Database Course for Beginners', 260, 
	   'https://www.youtube.com/watch?v=HXV3zeQKqGY');

insert into video
values(2, 'TOP 23 SQL INTERVIEW QUESTIONS & ANSWERS! (SQL Interview Tips + How to PASS an SQL interview!)', 
	   18, 'https://www.youtube.com/watch?v=l_dph6Qu4LA');


insert into video
values(3, 'PostgreSQL (Postgres) - Installation & Overview |¦| SQL Tutorial |¦| SQL for Beginners', 
	   8, 'https://www.youtube.com/watch?v=fZQI7nBu32M');


select * from video;

drop table if exists populate_Reviewers;
create table populate_reviewers(
	user_id integer primary key,
	video_id integer not null, 
	user_name varchar(30) not null,
	rating integer check(rating<=5 and rating >=0),
	review text,
	foreign key (video_id) references video(video_id)
);


insert into populate_reviewers
values(1,2,'User1', 5, 'super useful');

insert into populate_reviewers
values(2,2,'User2', 4, 'Very practical');

insert into populate_reviewers
values(3,1,'User3', 5, 'SQL 101 class');

insert into populate_reviewers
values(4,1,'User4', 5, 'best SQL class');

select * from populate_reviewers;

select * from 
video v
join populate_reviewers p
on v.video_id = p.video_id; 
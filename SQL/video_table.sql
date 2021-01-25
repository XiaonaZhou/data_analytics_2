drop table if exists video;
create table video(
video_id integer primary key not null,
title text not null,
length integer not null,
URL text not null
);

insert into video
values(1, 'SQL Tutorial - Full Database Course for Beginners', 260, 'https://www.youtube.com/watch?v=HXV3zeQKqGY');

insert into video
values(2, 'TOP 23 SQL INTERVIEW QUESTIONS & ANSWERS! (SQL Interview Tips + How to PASS an SQL interview!)', 18, 'https://www.youtube.com/watch?v=l_dph6Qu4LA');


insert into video
values(3, 'PostgreSQL (Postgres) - Installation & Overview |¦| SQL Tutorial |¦| SQL for Beginners', 8, 'https://www.youtube.com/watch?v=fZQI7nBu32M');


drop table if exist populate_Reviewers;
create table populate_reviewers(

%sql
--top 10 channels
select channel_title
, sum(views) as total_views
, sum(likes) as total_likes 
, sum(dislikes) as total_dislikes 
, sum(likes) - sum(dislikes) as popularity
from cavideos_csv 
group by channel_title 
order by popularity desc
limit 10

%sql
--top 10 contraversal
select title
, sum(views) as total_views
, sum(likes) as total_likes 
, sum(dislikes) as total_dislikes 
, sum(dislikes)/sum(likes) as contraversal
from cavideos_csv 
group by title 
having total_dislikes > 100000
and total_likes > 100000
order by contraversal desc
limit 10

%sql
--viral_videos
select 
title
--,tags
,category_id
,count(*) as cnt_days_tranding
,sum(views) as total_views
,sum(likes) as total_likes
,sum(comment_count) as total_comments
from cavideos_csv 
where title is not null
group by 1,2--,3
having total_views is not null
order by cnt_days_tranding desc
limit 10

%sql
--viral_videos
select 
title
,tags
,category_id
,count(*) as cnt
,sum(views) as total_views
,sum(likes) as total_likes
,sum(comment_count) as total_comments
from cavideos_csv 
where title is not null
group by 1,2,3
having total_views is not null
order by cnt desc
limit 10

%sql
--top 10 channels

select 
'CA' as country
, channel_title
, sum(views) as total_views
, sum(likes) as total_likes 
, sum(dislikes) as total_dislikes 
, sum(likes) - sum(dislikes) as popularity
from cavideos_csv 
group by channel_title , country

UNION

select 
'US' as country
, channel_title
, sum(views) as total_views
, sum(likes) as total_likes 
, sum(dislikes) as total_dislikes 
, sum(likes) - sum(dislikes) as popularity
from usvideos_csv 
group by channel_title , country

%sql 
DROP TABLE IF EXISTS all_channels;

CREATE TABLE all_channels AS
select 
 'CA' as country
, channel_title
, sum(views) as total_views
, sum(likes) as total_likes 
, sum(dislikes) as total_dislikes 
, sum(likes) - sum(dislikes) as popularity
from cavideos_csv 
group by channel_title 
order by popularity desc
limit 10

 %sql
INSERT INTO all_channels 
select 
 'US' as country
, channel_title
, sum(views) as total_views
, sum(likes) as total_likes 
, sum(dislikes) as total_dislikes 
, sum(likes) - sum(dislikes) as popularity
from usvideos_csv 
group by channel_title 
order by popularity desc
limit 10

%sql
INSERT INTO all_channels 
select 
 'DE' as country
, channel_title
, sum(views) as total_views
, sum(likes) as total_likes 
, sum(dislikes) as total_dislikes 
, sum(likes) - sum(dislikes) as popularity
from devideos_csv 
group by channel_title 
order by popularity desc
limit 10

%sql
INSERT INTO all_channels 
select 
 'FR' as country
, channel_title
, sum(views) as total_views
, sum(likes) as total_likes 
, sum(dislikes) as total_dislikes 
, sum(likes) - sum(dislikes) as popularity
from frvideos_csv 
group by channel_title 
order by popularity desc
limit 10

%sql
INSERT INTO all_channels 
select 
 'GB' as country
, channel_title
, sum(views) as total_views
, sum(likes) as total_likes 
, sum(dislikes) as total_dislikes 
, sum(likes) - sum(dislikes) as popularity
from gbvideos_csv 
group by channel_title 
order by popularity desc
limit 10

%sql
select channel_title, popularity from all_channels
order by popularity desc
limit 5

%sql
select country, popularity from all_channels
order by popularity desc
limit 5

%sql

--top 10 contraversal
DROP TABLE IF EXISTS all_contraversal;

CREATE TABLE all_contraversal AS
select 
'CA' as country
, title
, sum(views) as total_views
, sum(likes) as total_likes 
, sum(dislikes) as total_dislikes 
, sum(dislikes)/sum(likes) as contraversal
from cavideos_csv 
group by title 
having total_dislikes > 100000
and total_likes > 100000
order by contraversal desc
limit 10

%sql

--top 10 contraversal
DROP TABLE IF EXISTS all_contraversal;

CREATE TABLE all_contraversal AS
select 
'CA' as country
, title
, sum(views) as total_views
, sum(likes) as total_likes 
, sum(dislikes) as total_dislikes 
, sum(dislikes)/sum(likes) as contraversal
from cavideos_csv 
group by title 
having total_dislikes > 100000
and total_likes > 100000
order by contraversal desc
limit 10

%sql

INSERT INTO all_contraversal
select 
'GB' as country
, title
, sum(views) as total_views
, sum(likes) as total_likes 
, sum(dislikes) as total_dislikes 
, sum(dislikes)/sum(likes) as contraversal
from gbvideos_csv 
group by title 
having total_dislikes > 100000
and total_likes > 100000
order by contraversal desc
limit 10

%sql

INSERT INTO all_contraversal
select 
'FR' as country
, title
, sum(views) as total_views
, sum(likes) as total_likes 
, sum(dislikes) as total_dislikes 
, sum(dislikes)/sum(likes) as contraversal
from frvideos_csv 
group by title 
having total_dislikes > 100000
and total_likes > 100000
order by contraversal desc
limit 10

%sql

INSERT INTO all_contraversal
select 
'DE' as country
, title
, sum(views) as total_views
, sum(likes) as total_likes 
, sum(dislikes) as total_dislikes 
, sum(dislikes)/sum(likes) as contraversal
from devideos_csv 
group by title 
having total_dislikes > 100000
and total_likes > 100000
order by contraversal desc
limit 10

%sql
select * from all_contraversal
order by contraversal desc
limit 5

Select Count(Distinct utm_source) as 'Source' 
,count(Distinct utm_campaign) as ‘Campaign' 
from page_visits;

Select Distinct utm_source as Source
From page_visits;

Select Count(Distinct(utm_source)) as Source
From page_visits;

Select Distinct utm_campaign as ‘Campaign’
From page_visits;

Select Count(Distinct utm_campaign) as ‘Campaign’ 
From page_visits;

Select Distinct page_name from page_visits;

WITH first_touch AS (
SELECT user_id,
MIN(timestamp) as first_touch_at
FROM page_visits
GROUP BY user_id)
SELECT pv.utm_campaign AS 'Campaign'
,Count(first_touch_at) first_touches
FROM first_touch ft
JOIN page_visits pv
ON ft.user_id = pv.user_id
AND ft.first_touch_at = pv.timestamp
Group By pv.utm_campaign
Order By first_touches desc;

WITH last_touch AS (
    SELECT user_id,
        MAX(timestamp) as last_touch_at
    FROM page_visits
    GROUP BY user_id)
SELECT pv.utm_source AS 'Source'
,Count(last_touch_at) 'Last_Touch'
,pv.page_name as 'Page'
FROM last_touch lt
JOIN page_visits pv
    ON lt.user_id = pv.user_id
    AND lt.last_touch_at = pv.timestamp
    Where pv.page_name='4 - purchase'
    Group By pv.utm_source
    Order By Count(last_touch_at) desc;

WITH last_touch AS (
    SELECT user_id,
        MAX(timestamp) as last_touch_at
    FROM page_visits
    GROUP BY user_id)
SELECT pv.utm_campaign AS 'Campaign'
,Count(last_touch_at) 'Last_Touch'
,pv.page_name as 'Page'
FROM last_touch lt
JOIN page_visits pv
    ON lt.user_id = pv.user_id
    AND lt.last_touch_at = pv.timestamp
    Where pv.page_name='4 - purchase'
    Group By pv.utm_campaign
    Order By Count(last_touch_at) desc;



WITH last_touch AS (
    SELECT user_id,
        MAX(timestamp) as last_touch_at
    FROM page_visits
    GROUP BY user_id)
SELECT pv.utm_campaign AS 'Campaign'
,Count(last_touch_at) 'Last_Touch'
,pv.page_name as 'Page'
FROM last_touch lt
JOIN page_visits pv
    ON lt.user_id = pv.user_id
    AND lt.last_touch_at = pv.timestamp
    Where pv.page_name='4 - purchase'
    Group By pv.utm_campaign
    Order By Count(last_touch_at) desc;


WITH first_touch AS (
SELECT user_id,
MIN(timestamp) as first_touch_at
FROM page_visits
GROUP BY user_id)
SELECT pv.utm_campaign AS 'Campaign'
,Count(first_touch_at) 'First_Touches'
FROM first_touch ft
JOIN page_visits pv
ON ft.user_id = pv.user_id
AND ft.first_touch_at = pv.timestamp
Group By pv.utm_campaign
Order By Count(first_touch_at) desc;


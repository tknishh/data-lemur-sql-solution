WITH split AS(
SELECT ag.age_bucket,
SUM(CASE WHEN a.activity_type = 'open' then a.time_spent END) as open_time,
SUM(CASE WHEN a.activity_type = 'send' then a.time_spent END) as send_time
FROM activities a
INNER JOIN age_breakdown ag ON a.user_id = ag.user_id
GROUP BY ag.age_bucket
)

SELECT age_bucket,
ROUND(SUM(send_time) / (SUM(send_time)+SUM(open_time)) * 100, 2) as send_perc,
ROUND(SUM(open_time) / (SUM(send_time)+SUM(open_time)) * 100, 2) as open_perc
FROM split
GROUP BY age_bucket
ORDER BY age_bucket;


-- SELECT a.age_bucket, COUNT(ac.user_id) as users
-- FROM age_breakdown as a
-- LEFT JOIN
-- activities as ac ON a.user_id = ac.user_id
-- GROUP BY a.age_bucket; 
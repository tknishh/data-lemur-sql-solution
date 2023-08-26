SELECT DISTINCT p.page_id 
FROM pages as p
LEFT JOIN
page_likes as pl ON p.page_id = pl.page_id
WHERE pl.page_id IS NULL
ORDER BY p.page_id ASC;
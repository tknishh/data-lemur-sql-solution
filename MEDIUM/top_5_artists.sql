WITH top_5 as (
SELECT a.artist_name,
  DENSE_RANK() OVER(ORDER BY COUNT(s.song_id) DESC) AS artist_rank
FROM artists a
INNER JOIN songs s
  ON a.artist_id = s.artist_id
INNER JOIN global_song_rank g
  ON s.song_id = g.song_id
WHERE g.rank<=10
GROUP BY a.artist_name)

SELECT * FROM top_5
WHERE artist_rank<=5;
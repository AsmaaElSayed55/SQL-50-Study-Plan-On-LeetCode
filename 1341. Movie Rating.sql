WITH UserCounts AS (
    SELECT 
        u.name,
        COUNT(*) AS rated_count
    FROM MovieRating mr
    JOIN Users u ON mr.user_id = u.user_id
    GROUP BY u.name
),
TopUser AS (
    SELECT TOP 1 name
    FROM UserCounts
    ORDER BY rated_count DESC, name ASC
),
FebRatings AS (
    SELECT 
        m.title,
        AVG(CAST(mr.rating AS FLOAT)) AS avg_rating
    FROM MovieRating mr
    JOIN Movies m ON mr.movie_id = m.movie_id
    WHERE mr.created_at >= '2020-02-01'
      AND mr.created_at < '2020-03-01'
    GROUP BY m.title
),
TopMovie AS (
    SELECT TOP 1 title
    FROM FebRatings
    ORDER BY avg_rating DESC, title ASC
)
SELECT name AS results FROM TopUser
UNION ALL
SELECT title FROM TopMovie;

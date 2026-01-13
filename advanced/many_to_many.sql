SELECT s.title,
    rs.rating
FROM series s
    JOIN reviews rs ON s.id = rs.series_id;

SELECT s.title,
    ROUND(AVG(rs.rating), 2) AS avg_rating
FROM series s
    JOIN reviews rs ON s.id = rs.series_id
GROUP BY s.title
ORDER BY avg_rating;

SELECT r.first_name,
    r.last_name,
    r2.rating
FROM reviewers r
    JOIN reviews r2 ON r2.reviewer_id = r.id;

SELECT title AS unreviewed_series
FROM series s
    LEFT JOIN reviews r on s.id = r.series_id
WHERE rating IS NULL;
SELECT s.genre,
    AVG(rating) AS avg_rating
FROM series s
    LEFT JOIN reviews r ON s.id = r.series_id
GROUP BY s.genre;

SELECT r.first_name,
    r.last_name,
    COUNT(r2.rating) AS COUNT,
    IFNULL(MIN(r2.rating), 0) AS MIN,
    IFNULL(MAX(r2.rating), 0) AS MAX,
    IFNULL(AVG(r2.rating), 0) AS AVG,
    IF(COUNT(r2.rating) > 0, 'ACTIVE', 'INACTIVE')
FROM reviewers r
    LEFT JOIN reviews r2 ON r.id = r2.reviewer_id
GROUP BY r.first_name,
    r.last_name;
    
SELECT s.title,
    r.rating,
    CONCAT(r2.first_name, ' ', r2.last_name) AS reviewer
FROM series s
    JOIN reviews r ON s.id = r.series_id
    JOIN reviewers r2 ON r.reviewer_id = r2.id;
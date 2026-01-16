-- Find the 5 oldest users.
SELECT *
FROM users
ORDER BY created_at
LIMIT 5;

-- What day of the week do most users register on?
SELECT DAYNAME(created_at) AS day,
	COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC;

-- Find the users who have never posted a photo
SELECT DISTINCT u.id,
	u.username
FROM users u
	LEFT JOIN photos p ON u.id = p.user_id
WHERE p.user_id IS NULL
ORDER BY u.id;

-- Who can get the most likes on a single photo?
SELECT username,
	p.id AS photo_id,
	COUNT(*) AS total
FROM photos p
	JOIN likes l ON p.id = l.photo_id
	JOIN users u ON p.user_id = u.id
GROUP BY p.id
ORDER BY total DESC
LIMIT 1;

-- How many photos does every user post?
SELECT (
		SELECT COUNT(*)
		FROM photos
	) / (
		SELECT COUNT(*)
		FROM users
	) AS avg_photos_per_user;

-- What are the top 5 most commonly used hashtags?
SELECT *
FROM photo_tags;
SELECT tag_name,
	COUNT(*) AS total
FROM tags t
	JOIN photo_tags p ON t.id = p.tag_id
GROUP BY t.id
ORDER BY total DESC
LIMIT 5;

-- Find users who have liked every single photo on the site
SELECT username,
	COUNT(l.user_id) AS num_likes
FROM likes l
	JOIN users u ON u.id = l.user_id
GROUP BY username
HAVING num_likes = (
		SELECT COUNT(*)
		FROM photos
	);
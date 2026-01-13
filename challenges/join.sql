CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL
);

CREATE TABLE papers (
    title VARCHAR(255) NOT NULL,
    grade INT NOT NULL,
    student_id INT,
    FOREIGN KEY(student_id) REFERENCES students(id) ON DELETE CASCADE
);

INSERT INTO students (first_name)
VALUES ('Caleb'),
    ('Samantha'),
    ('Raj'),
    ('Carlos'),
    ('Lisa');

INSERT INTO papers (student_id, title, grade)
VALUES (1, 'My First Book Report', 60),
    (1, 'My Second Book Report', 75),
    (2, 'Russian Lit Through The Ages', 94),
    (2, 'De Montaigne and The Art of The Essay', 98),
    (4, 'Borges and Magical Realism', 89);

-- Solution
SELECT
	s.first_name ,
	p.title,
	p.grade
FROM
	students s
JOIN papers p
		ON
	s.id = p.student_id
ORDER BY p.grade DESC;

SELECT
	s.first_name ,
	p.title,
	p.grade
FROM
	students s
LEFT JOIN papers p
		ON
	s.id = p.student_id;

SELECT
	s.first_name ,
	IFNULL(p.title, 'MISSING') AS title,
	IFNULL(p.grade, 0) AS grade
FROM
	students s
LEFT JOIN papers p
		ON
	s.id = p.student_id;

SELECT
	s.first_name ,
	IFNULL(AVG(p.grade), 0) AS average
FROM
	students s
LEFT JOIN papers p
		ON
	s.id = p.student_id
GROUP BY
	s.first_name
ORDER BY average DESC;

SELECT
	s.first_name ,
	IFNULL(AVG(p.grade), 0) AS average,
	CASE
		WHEN IFNULL(AVG(p.grade), 0) >= 75 THEN 'PASSING'
		ELSE 'FAILING'
	END AS passing_status
FROM
	students s
LEFT JOIN papers p
		ON
	s.id = p.student_id
GROUP BY
	s.first_name
ORDER BY
	average DESC;
--retirement_titles.csv
SELECT e.emp_no, 
	e.first_name, 
	e.last_name, 
	t.title, 
	t.from_date,
	t.to_date
INTO retiremment_titles 
FROM employees as e
LEFT JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

--adding starter code 
-- now quiery theretierment_titles table for latest title 
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retiremment_titles as rt
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, to_date;

-- get the count of each title 
SELECT COUNT(title),
title
INTO retiring_titles
FROM retiremment_titles
GROUP BY title
ORDER BY COUNT(title) DESC;
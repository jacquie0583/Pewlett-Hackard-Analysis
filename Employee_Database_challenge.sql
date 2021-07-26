___Deliverable 1 Part 1 
-- Retirement Titles - Join tables, filter from birth dates, ORDER BY employee numbers
SELECT e.emp_no,
	   e.first_name,
	   e.last_name,
	   t.title,
	   t.from_date,
  	   t.to_date
INTO rt
FROM employees AS e
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;

___Deliverable 1 Part 2
-- Use Dictinct with Orderby to remove duplicate rows DESC
SELECT DISTINCT ON (rt.emp_no) rt.emp_no, 
rt.first_name,
rt.last_name, 
rt.title
INTO unique_titles
FROM rt
ORDER BY emp_no ASC, to_date DESC;

___Deliverable 1 Part 3
-- Retrieve number of employees by recent job title, filter by count
SELECT COUNT(ut.emp_no),ut.title
INTO ut
FROM unique_titles as ut
GROUP BY ut.title 
ORDER BY ut.count DESC;

--Deliverable part 2
SELECT DISTINCT ON(e.emp_no)e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title
--DISTINCT ON(emp_no)
INTO mentor_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1962-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;
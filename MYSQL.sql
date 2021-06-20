USE student_performance;
SELECT sc.name, s.sex, ROUND(AVG(s.age),2)AS avg_age
FROM students s
JOIN school sc
ON s.school_id = sc.id
GROUP BY s.school_id,s.sex
ORDER BY s.sex;

USE student_performance;
SELECT COUNT(*) AS num_of_students
FROM students s
JOIN students_family sf
ON s.id = sf.student_id
WHERE s.sex = 'M'
AND sf.famsize = 6
AND sf.m_job <> sf.f_job;

USE student_performance;
SELECT sp.student_id, s.name AS student_name
FROM students s
JOIN students_profile sp
ON s.id = sp.student_id
WHERE s.school_id = 'MS'
AND sp.higher_edu = 'yes'
AND sp.internet = 'no'
AND sp.study_time >= 300;

USE student_performance;
SELECT pj.occupation,COUNT(*) as num_of_fathers
FROM students s
JOIN students_family sf
ON s.id = sf.student_id
JOIN parent_job pj
ON sf.f_job = pj.id
WHERE sf.f_job IN (1,2,3)
GROUP BY pj.occupation
ORDER BY COUNT(*) DESC
LIMIT 1;

USE students_performance;
SELECT sp.student_id, s.name AS student_name, sc.name AS school_name
FROM students s
JOIN students_profile sp
ON s.id = sp.student_id
JOIN school sc
ON s.school_id = sc.id
WHERE s.sex = 'M'
AND s.address <> 'Urban'
ORDER BY s.age DESC,sp.num_of_absences DESC,sp.free_time DESC
LIMIT 7;
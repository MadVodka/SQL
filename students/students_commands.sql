#1
SELECT name
FROM student;

#2
SELECT name
FROM student
ORDER BY name;

#3
SELECT name,
       mark AS mark_java
FROM student st
INNER JOIN mark ON st.student_id = mark.student_id
WHERE mark.subject = 'Java';

#4
SELECT name,
       avg(mark) AS avg_mark
FROM student
INNER JOIN mark ON student.student_id = mark.student_id
GROUP BY name
HAVING student.name = 'Петров';

#5
SELECT subject,
       avg(mark) AS avg_mark
FROM student st
INNER JOIN mark ON st.student_id = mark.student_id
GROUP BY subject;

#6
SELECT `group`,
       avg(mark) AS avg_mark_java
FROM student st
INNER JOIN mark ON st.student_id = mark.student_id
WHERE mark.`subject` = 'Java'
GROUP BY st.`group`;

#7
SELECT name,
       count(mark) AS count_marks
FROM student st
INNER JOIN mark ON st.student_id = mark.student_id
GROUP BY name;

#8
SELECT name
FROM student st
INNER JOIN mark ON st.student_id = mark.student_id
WHERE mark = 2
GROUP BY name
HAVING count(mark)=2;

#9
SELECT subject
FROM student st
INNER JOIN mark ON st.student_id = mark.student_id
WHERE mark = 2
GROUP BY subject
HAVING count(mark)>2;

#10
DELETE
FROM student del_stu
WHERE del_stu.student_id IN
    (SELECT sel_stu.student_id
     FROM
       (SELECT st.student_id
        FROM student st
        INNER JOIN mark ON st.student_id = mark.student_id
        WHERE mark.mark = 2
        GROUP BY st.student_id
        HAVING count(mark.mark)=3) sel_stu);
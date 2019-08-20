#1
SELECT name FROM student;

#2
select name from student order by name;

#3
select name, mark as mark_java from student st inner join mark on st.student_id = mark.student_id where mark.subject = 'Java';

#4
select name, avg(mark) as avg_mark from student inner join mark on student.student_id = mark.student_id group by name having student.name = 'Петров';

#5
select subject, avg(mark) as avg_mark from student st inner join mark on st.student_id = mark.student_id group by subject;

#6
select `group`, avg(mark) as avg_mark_java from student st inner join mark on st.student_id = mark.student_id where mark.`subject` = 'Java' group by st.`group`;

#7
select name, count(mark) as count_marks from student st inner join mark on st.student_id = mark.student_id group by name;

#8
select name from student st inner join mark on st.student_id = mark.student_id where mark = 2 group by name having count(mark)=2;

#9
select subject from student st inner join mark on st.student_id = mark.student_id where mark = 2 group by subject having count(mark)>2;

#10
delete from student e where e.student_id in (select x.student_id from (select st.student_id from student st inner join mark on st.student_id = mark.student_id where mark.mark = 2 group by st.student_id having count(mark.mark)=3) x);
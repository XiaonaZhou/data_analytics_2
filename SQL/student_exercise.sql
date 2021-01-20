-- students with the highest marks in Unit 4
select student_id 
from student_mark
where unit4=(select max(unit4) from student_mark);

-- students scored between 89 and 100 unit4
select student_id
from student_mark
where unit4 BETWEEN 89 and 100; 
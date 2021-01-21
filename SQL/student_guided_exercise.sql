-- 1. students with the highest marks in Unit 4
select student_id 
from student_mark
where unit4=(select max(unit4) from student_mark);

-- 2. students scored between 89 and 100 unit4
select student_id
from student_mark
where unit4 BETWEEN 89 and 100; 

-- 3. how many male stduents?
select count(gender)
from student_data
where gender='Male';

-- 4. how many female stduents?
select count(gender)
from student_data
where gender='Female';

-- 5. how many students prefered hardcopy?
select count(BOOK_PREFERENCE_HARDCOPY) 
from student_data 
where BOOK_PREFERENCE_HARDCOPY ='true';

-- 6. how many students do not prefered hardcopy?
select count(BOOK_PREFERENCE_HARDCOPY) 
from student_data 
where BOOK_PREFERENCE_HARDCOPY ='false';

-- 7. What was the highest score on each unit test?
select max(unit2), max(unit3), max(unit4), max(unit5)
from student_mark;

-- 8. how many people score 100 on each unit test?
select count(unit2)
from student_mark
where unit2=10;

select count(unit3)
from student_mark
where unit3=10;

select count(unit4)
from student_mark
where unit4=10;

select count(unit5)
from student_mark
where unit5=10;

-- 9. who has the highest total score 

select student_id , unit2+unit3+unit4+unit5 as total
from student_mark
order by total desc
limit 1;

-- 10. How many emails ends with .com

select count(email)
from student_data 
where email like '%.com';
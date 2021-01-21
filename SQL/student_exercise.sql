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
select count(unit2), 
from student_mark
where unit2=100;
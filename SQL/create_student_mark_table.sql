DROP TABLE IF EXISTS student_marks;
CREATE TABLE student_marks
(
    id serial PRIMARY KEY,
    student_reg_id integer,
    student_id integer,
	unit2 integer,
	unit3 integer,
	unit4 integer,
	unit5 integer    
);

copy student_marks(student_reg_id,student_id,unit2,unit3,unit4,unit5)
--set the path for file location of student_marks.csv
from 'C:\TEMP\student_mark.csv'
delimiter ',' CSV header
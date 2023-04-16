
# in without parameter
CREATE PROCEDURE `japan`(in age int)
BEGIN
select count(*) from student where student.age=31;
END


# normal

CREATE DEFINER=`root`@`localhost` PROCEDURE `japan`()
BEGIN
select from student where student.age=31;
END


# inout
CREATE DEFINER=`root`@`localhost` PROCEDURE `japan`(inout room int,in age int)
BEGIN
select count(*) into room from student where student.age=age;
END


# out
CREATE PROCEDURE `japan`(out records int)
BEGIN
select count(*) into records from student where student.age=31;
END
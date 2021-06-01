create database  if not exists xuesheng default charset = utf8;

use xuesheng ;
create table  Student(
Sno varchar(7) Primary key, 
Sname varchar(10) not null,
Ssex varchar(2)  check(Ssex='男' or Ssex='女'),  
Sage int check(Sage<=45 and Sage>=15),
Sdept varchar(20) default '计算机系'
);

show tables;


create table Course(
Cno varchar(10) primary key,
Cname varchar(20) not null ,
Ccredit  int  check(Ccredit >0),
Semster int check(Semster >0) ,
Cperiod int check(Cperiod >0) 
);
show tables;



create table SC(
Sno varchar(7) ,
Cno varchar(10) ,
Grade int check(Grade >0 and Grade <=100),
foreign key(Cno) references Course(Cno),
foreign key(Sno) references Student(Sno)
);

alter table SC add XKLB char(4);
alter table  SC modify column XKlb char(6);
alter table Course DROP Cperiod;

 alter table Student CHANGE Ssex sex  varchar(2) ; 


insert into Student(Sno,Sname,sex,Sage,Sdept) values('9512101','李勇','男',19,'计算机系'),
														('9512102' , '刘晨', '男', 20, '计算机系'),
														('9512103' , '王敏', '女', 20, '计算机系'),
														('9521101' , '张立', '男', 22, '信息系'),
			('9521102' , '吴宾', '女', 21, '信息系'),
			('9521103' , '张海', '男', 20, '信息系'),
			('9531101' , '钱小平','女',18, '信息系'),
			('9531102' , '王大力','男',19, '信息系');
	truncate table Student;
select *from  Student;
show tables;




insert into Course(Cno,Cname,Ccredit,Semster)
values('C01','计算机文化学',3,1),
('C02','VB',2,3),
('C03','计算机网络',4,7),
('C04','数据库基础',6,6),
('C05','高等数学',8,2),
('C06','数据结构',5,4)

select *from  Course;


insert into SC values
('9512101','c01',90,'必修'),
('9512101','c02',86,'选修'),
('9512101','c06',null,'必修'),
('9512102','c02',78,'选修'),

('9512102','c04',66,'必修'),
('9512102','c06',82,'必修'),
('9512102','c02',75,'选修'),
('9512102','c04',92,'必修'),
('9512102','c05',50,'必修'),
('9512103','c02',68,'选修'),
('9512103','c06',null,'必修'),
('9512101','c01',80,'选修'),
('9512101','c05',95,'必修'),
('9512102','c05',85,'必修');
select *from  SC;

-- 查询全体学生的学好与姓名
select Sno,Sname  from Student;
-- 查询全体学生的姓名 学好和所在系
select Sno,Sname,Sdept  from Student;
-- 查询全体学生的姓名即出生年份
select *from Student left join SC on Student.Sno = SC.Sno left join Course on SC.cno=Course.Cno;
-- 查询全体学生的姓名和出生年份 并在出生年份列之间加入一个列，
select Sname,2021-Sage as'出生年龄' from Student;
select Sname,'Year of Birch',2021-Sage as'出生年龄' from Student;
-- 在选课表中查询那血学生选修了课程，并列出学好
select   Sno  from SC  where Xklb='选修';
查新计算机系所有学生的名字

select Sname from Student where Sdept='计算机系';
-- 查询所有年龄在20岁以下的学生的姓名及年龄
select Sname ,Sage from Student where Sage <20;
 -- 查询考试成绩不及格的学生的姓名
select Sname  from Student,SC where Student.Sno=SC.sno and SC.grade<60;

-- 查询年龄在20-23岁之间的学生的姓名，所在系和年龄
select Sname,Sdept,Sage from Student where Sage>=20 and Sage<23; 
-- 查询年龄不在20-23之间的学生的名字，所在系和年龄
select Sname,Sdept,Sage from Student where  not Sage>=20 and Sage<23; 
-- 查询信息系 数学系 计算机系的学生的姓名和性别
select Sname,sex from Student where Sdept in ('信息系','数学系','计算机系');

-- 查询既不属于信息系，数学系，也不属于计算机系的学生的姓名和性别
select Sname,sex from Student where Sdept  not in ('信息系','数学系','计算机系');
-- 查询学生表中姓张的学生
select*from Student where Sname like '张%';
-- 查询学生表中，姓李张刘的学生
select*from Student where Sname like '张%'or Sname like '刘%'or Sname like '李%';


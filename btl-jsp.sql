create database MarkManagement
go

use MarkManagement
go

drop table Class(
	id int primary key identity,
	className varchar(150) not null unique,
	[status] tinyint default 1,
	createdDate date default getdate()
)
go

select*from SubjectScore

create table Student(
	id varchar(11) primary key,
	[name] nvarchar(100) not null,
	[status] tinyint default 1,
	sex bit not null,
	classId int not null foreign key references Class(id),
	birthday Date not null
)
go

create table [Subject](
	id Int primary key identity,
	[name] nvarchar(100) not null unique,
	[session] Int not null
)
go

create table SubjectScore(
	studentId Varchar(11) foreign key references Student(id),
	subjectId Int foreign key references [Subject](id),
	score float	not null
)
go

create table [Admin](
	id Int primary key identity,
	name Nvarchar(150) not null,
	email Varchar(150) not null unique,
	[password] Varchar(50) not null
)
go

/*
	create proc for Class
*/
create proc sp_getAllClass
as
select * from Class
go



create proc sp_createClass @name varchar(50), @status tinyint
as 
insert into Class(className,status) values (@name,@status)
go


create proc sp_updateClass @name varchar(50), @status tinyint,@id int
as update Class
set className = @name, status = @status
where id = @id
go

create proc sp_deleteClass @id int
as
delete from Class where id = @id
go

create proc sp_getClassById @id int
as
select * from Class where id = @id
go

create proc getClassPaginate 
(@records int , @page int, @totalPage int output) 
as
select * from Class 
order by id desc
OFFSET @records*(@page-1) ROWS
FETCH NEXT @records ROWS ONLY
SET @totalPage = CEILING(CONVERT(float, (SELECT COUNT(*) FROM Class)) / @records);
go

create proc sp_searchPaginateClass
@records int, 
@page int,
@search varchar(50),
@totalPage int output
as
select * from Class where className like @search
order by id desc
OFFSET @records*(@page-1) ROWS
FETCH NEXT @records ROWS ONLY
SET @totalPage = CEILING(CONVERT(float, (SELECT COUNT(*) FROM Class where className like @search)) / @records);
go

create proc sp_getTotalStudent @id int
as
select count(*) from Class c join Student s on c.id = s.classId where c.id = @id
go

select * from Class where className like '%d%'
go
/**
	create proc for Student table
*/
create proc sp_getAllStudent
as 
select * from Student
go

create proc sp_createStudent 
@id varchar(11),
@name nvarchar(100),
@status tinyint,
@sex bit,
@classId int,
@birthday Date
as 
insert into Student (id,name,status,sex,classId,birthday) 
values (@id,@name,@status,@sex,@classId,@birthday)
go

create proc sp_updateStudent
@name nvarchar(100),
@status tinyint,
@sex bit,
@classId int,
@birthday Date,
@id varchar(11)
as update Student
set name = @name,status = @status,sex = @sex,classId = @classId,birthday = @birthday
where id = @id
go

exec sp_updateStudent 'Demo',1,1,33,'1998-02-01','B8888'
go

create proc sp_deleteStudent @id varchar(11)
as
delete from Student where id = @id
go

create proc sp_getStudentById @id varchar(11)
as 
select * from Student where id = @id
go

create proc getStudentPaginate 
(@records int , @page int, @totalPage int output) 
as
select * from Student 
order by id desc
OFFSET @records*(@page-1) ROWS
FETCH NEXT @records ROWS ONLY
SET @totalPage = CEILING(CONVERT(float, (SELECT COUNT(*) FROM Student)) / @records);
go

create proc sp_searchStudent
@records int, 
@page int,
@search nvarchar(50),
@totalPage int output
as
select * from Student where id like @search OR name like @search
order by id desc
OFFSET @records*(@page-1) ROWS
FETCH NEXT @records ROWS ONLY
SET @totalPage = CEILING(CONVERT(float, (SELECT COUNT(*) FROM Student where id like @search OR name like @search)) / @records);
go

create proc sp_getStudentByClass
@records int, 
@page int,
@classId int,
@totalPage int output
as
select * from Student where classId = @classId
order by id desc
OFFSET @records*(@page-1) ROWS
FETCH NEXT @records ROWS ONLY
SET @totalPage = CEILING(CONVERT(float, (SELECT COUNT(*) FROM Student where classId = @classId)) / @records);
go

create proc sp_getStudentPagination
@records int, 
@page int,
@search nvarchar(50),
@classId int,
@totalPage int output
as
select * from Student where classId = @classId AND (id like @search OR name like N'%'+@search+'%')
order by id desc
OFFSET @records*(@page-1) ROWS
FETCH NEXT @records ROWS ONLY
SET @totalPage = CEILING(CONVERT(float, (SELECT COUNT(*) FROM Student where classId = @classId AND id like @search OR name like @search)) / @records);
go

exec sp_getStudentPagination 6,1,'a',2,1
go

select * from Student where classId = 2 and name like '%a%'


create proc sp_studentByClassId @classId int
as
select * from Student where classId = @classId 
order by id desc
go
/*
	thủ tục bảng subject
*/
create proc sp_getSubject
as
select * from Subject 
order by id desc
go



create proc sp_createSubject @name nvarchar(50), @session int
as 
insert into Subject(name,session) values (@name,@session)
go


create proc sp_updateSubject @name nvarchar(50), @session int,@id int
as update Subject
set name = @name, session = @session
where id = @id
go

create proc sp_deleteSubject @id int
as
delete from Subject where id = @id
go

create proc sp_getSubjectById @id int
as
select * from Subject where id = @id
go

create proc getSubjectPaginate 
(@records int , @page int, @totalPage int output) 
as
select * from Subject 
order by id desc
OFFSET @records*(@page-1) ROWS
FETCH NEXT @records ROWS ONLY
SET @totalPage = CEILING(CONVERT(float, (SELECT COUNT(*) FROM Subject)) / @records);
go

create proc sp_searchSubject
@records int, 
@page int,
@search nvarchar(50),
@totalPage int output
as
select * from Subject where name like @search
order by id desc
OFFSET @records*(@page-1) ROWS
FETCH NEXT @records ROWS ONLY
SET @totalPage = CEILING(CONVERT(float, (SELECT COUNT(*) FROM Subject where name like @search)) / @records);
go

/*
	thủ tục bảng admin
*/

create proc sp_getAdmin
as
select * from Admin 
order by id desc
go



create proc sp_createAdmin @name nvarchar(50), @email varchar(100),@password varchar(50)
as 
insert into Admin(name,email,password) values(@name,@email,@password)
go


create proc sp_updateAdmin @name nvarchar(50), @email varchar(100),@password varchar(50),@id int
as update Admin
set name = @name, email = @email , password = @password
where id = @id
go

create proc sp_loginAdmin @email varchar(100), @password varchar(50)
as
select * from Admin where email = @email AND password = @password
go

create proc sp_getAdminById @id int
as
select * from Admin where id = @id
go

/*
	thủ tục bảng subject score
*/
create proc sp_getScore
as
select * from SubjectScore
go

create proc sp_checkScore @studentId varchar(11)
as
select * from SubjectScore where studentId = @studentId
go

create proc sp_addScore @studentId varchar(11), @subjectId int, @score float
as
insert into SubjectScore(studentId,subjectId,score) values(@studentId,@subjectId,@score)
go

create proc sp_updateScore @studentId varchar(11), @subjectId int, @score float
as
update SubjectScore set score = @score where studentId = @studentId and subjectId = @subjectId
go

create proc sp_getById 
@studentId varchar(11), 
@subjectId int
as
select * from SubjectScore where studentId = @studentId and subjectId = @subjectId
go

/* chưa tạo */
create proc sp_searchScore 
@records int, 
@page int,
@search nvarchar(50),
@totalPage int output
as
select * from SubjectScore
where studentId = @search
order by score desc
OFFSET @records*(@page-1) ROWS
FETCH NEXT @records ROWS ONLY
SET @totalPage = CEILING(CONVERT(float, (SELECT COUNT(*) FROM SubjectScore where studentId = @search)) / @records);
go


exec sp_searchScore 6,1,'b8533',1
go

create proc getScorePaginate 
(@records int , @page int, @totalPage int output) 
as
select * from SubjectScore 
order by score desc
OFFSET @records*(@page-1) ROWS
FETCH NEXT @records ROWS ONLY
SET @totalPage = CEILING(CONVERT(float, (SELECT COUNT(*) FROM SubjectScore)) / @records);
go

create proc sp_getSubjectNotIn @studentId varchar(11)
as
select * from Subject where id not in (select s.id from SubjectScore ss 
join Student std on ss.studentId = std.id
join Subject s on ss.subjectId = s.id
where ss.studentId = @studentId)
go

create proc sp_getSubjectNotInsertScore @classId int
as
select * from Subject where id not in 
(select ss.subjectId from Student s
join SubjectScore ss on s.id = ss.studentId
where classId = @classId)
go

select * from Subject where id not in 
(select ss.subjectId from Student s
join SubjectScore ss on s.id = ss.studentId
where classId = 1)
go


/* Điểm theo lớp */
create proc sp_scoreByClass 
@records int, 
@page int,
@classId int,
@totalPage int output
as
select * from SubjectScore 
where studentId in (select s.id from Class c
join Student s on c.id = s.classId
where c.id = @classId)
order by score desc
OFFSET @records*(@page-1) ROWS
FETCH NEXT @records ROWS ONLY
SET @totalPage = CEILING(CONVERT(float, (SELECT COUNT(*) FROM SubjectScore where studentId in (select s.id from Class c
join Student s on c.id = s.classId
where c.id = @classId))) / @records)
go

declare @total int;
set @total = CEILING(CONVERT(float,(SELECT COUNT(*) FROM SubjectScore where studentId in (select s.id from Class c join Student s on c.id = s.classId
where c.id = 1))) / 6);
select @total;
go

select * from SubjectScore sc where sc.studentId in (select s.id from Class c
join Student s on c.id = s.classId
join Subject sub on sub.id = sc.subjectId
where c.id = 1 and sub.id = 1)
go

/* điểm theo môn getScoreBySubject*/
create proc getScoreBySubject 
@records int, 
@page int,
@subjectId int,
@totalPage int output
as
select * from SubjectScore  where subjectId = @subjectId
order by score desc
OFFSET @records*(@page-1) ROWS
FETCH NEXT @records ROWS ONLY
SET @totalPage = CEILING(CONVERT(float, (SELECT COUNT(*) FROM SubjectScore where subjectId = @subjectId)) / @records);
go

/* điểm theo lớp và môn */

create proc sp_getScoreByClassAndSub
@subjectId int,
@classId int
as
select * from SubjectScore  
where subjectId = @subjectId and
studentId in (select s.id from Class c
join Student s on c.id = s.classId
where c.id = @classId)
order by score desc
go

select * from SubjectScore  
where subjectId = 1 and
studentId in (select s.id from Class c
join Student s on c.id = s.classId
where c.id = 1)
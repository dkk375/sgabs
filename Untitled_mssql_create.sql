CREATE TABLE [Course] (
	courseid int NOT NULL,
	coursename string NOT NULL,
	grade int NOT NULL,
	shortname string NOT NULL,
	isactive int NOT NULL,
  CONSTRAINT [PK_COURSE] PRIMARY KEY CLUSTERED
  (
  [courseid] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Class] (
	classid int NOT NULL,
	classname string NOT NULL,
	classsize int NOT NULL,
	classcapacity int NOT NULL,
	classgrade int NOT NULL,
	semester int NOT NULL,
	section int NOT NULL,
  CONSTRAINT [PK_CLASS] PRIMARY KEY CLUSTERED
  (
  [classid] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [User] (
	userid string NOT NULL,
	firstname string NOT NULL,
	lastname string NOT NULL,
	username string NOT NULL,
	password string NOT NULL,
	email string NOT NULL,
	phonenumber varchar(255) NOT NULL,
	address varchar(255) NOT NULL,
	lastlogin string(255) NOT NULL,
	registerdate varchar(255) NOT NULL,
	birthdate varchar(255) NOT NULL,
	age int(255) NOT NULL,
	isconfirmed int NOT NULL,
	isactive int NOT NULL,
	usertype varchar(255) NOT NULL,
  CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED
  (
  [userid] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Student] (
	studentid int NOT NULL,
	school varchar(255) NOT NULL,
	grade int NOT NULL,
	section int NOT NULL,
	userid int NOT NULL,
	studentclass int NOT NULL,
  CONSTRAINT [PK_STUDENT] PRIMARY KEY CLUSTERED
  (
  [studentid] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [CourseSchedule] (
	classid int NOT NULL,
	courseid int NOT NULL,
	coursehour int NOT NULL,
	courseday int NOT NULL
)
GO
CREATE TABLE [School] (
	id int NOT NULL,
	name varchar(255) NOT NULL,
  CONSTRAINT [PK_SCHOOL] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Semester] (
	semesterid int NOT NULL,
	semesterdescription varchar(255) NOT NULL,
	startingdate varchar(255) NOT NULL,
	startingdate varchar(255) NOT NULL,
	endingdate varchar(255) NOT NULL,
	isactive int(255) NOT NULL,
  CONSTRAINT [PK_SEMESTER] PRIMARY KEY CLUSTERED
  (
  [semesterid] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Section] (
	id bigint NOT NULL,
	name varchar(255) NOT NULL,
	shortname varchar(255) NOT NULL,
  CONSTRAINT [PK_SECTION] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Parent] (
	parentid int NOT NULL,
	firstname varchar(255) NOT NULL,
	lastname varchar(255) NOT NULL,
	phone varchar(255) NOT NULL,
	email varchar(255) NOT NULL,
	address varchar(255) NOT NULL,
	birthdate varchar(255) NOT NULL,
  CONSTRAINT [PK_PARENT] PRIMARY KEY CLUSTERED
  (
  [parentid] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Teacher] (
	teacherid int NOT NULL,
	firstname varchar(255) NOT NULL,
	lastname varchar(255) NOT NULL,
	phone varchar(15) NOT NULL,
	email varchar(250) NOT NULL,
	address varchar(250) NOT NULL,
	birthdate varchar(250) NOT NULL,
  CONSTRAINT [PK_TEACHER] PRIMARY KEY CLUSTERED
  (
  [teacherid] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [CourseTeacher] (
	courseid int NOT NULL,
	teacherid int NOT NULL
)
GO
CREATE TABLE [StudentParent] (
	studentid int NOT NULL,
	parentid int NOT NULL
)
GO
CREATE TABLE [ExamResult] (
	resultid int NOT NULL,
	studentid int NOT NULL,
	courseid int NOT NULL,
	grade int NOT NULL,
	date varchar(255) NOT NULL,
  CONSTRAINT [PK_EXAMRESULT] PRIMARY KEY CLUSTERED
  (
  [resultid] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Attendance] (
	studentid int NOT NULL,
	courseid int NOT NULL,
	isattended int NOT NULL,
	date varchar(255) NOT NULL
)
GO



ALTER TABLE [Student] WITH CHECK ADD CONSTRAINT [Student_fk0] FOREIGN KEY ([userid]) REFERENCES [User]([userid])
ON UPDATE CASCADE
GO
ALTER TABLE [Student] CHECK CONSTRAINT [Student_fk0]
GO

ALTER TABLE [CourseSchedule] WITH CHECK ADD CONSTRAINT [CourseSchedule_fk0] FOREIGN KEY ([classid]) REFERENCES [Class]([classid])
ON UPDATE CASCADE
GO
ALTER TABLE [CourseSchedule] CHECK CONSTRAINT [CourseSchedule_fk0]
GO
ALTER TABLE [CourseSchedule] WITH CHECK ADD CONSTRAINT [CourseSchedule_fk1] FOREIGN KEY ([courseid]) REFERENCES [Course]([courseid])
ON UPDATE CASCADE
GO
ALTER TABLE [CourseSchedule] CHECK CONSTRAINT [CourseSchedule_fk1]
GO






ALTER TABLE [CourseTeacher] WITH CHECK ADD CONSTRAINT [CourseTeacher_fk0] FOREIGN KEY ([courseid]) REFERENCES [Course]([courseid])
ON UPDATE CASCADE
GO
ALTER TABLE [CourseTeacher] CHECK CONSTRAINT [CourseTeacher_fk0]
GO
ALTER TABLE [CourseTeacher] WITH CHECK ADD CONSTRAINT [CourseTeacher_fk1] FOREIGN KEY ([teacherid]) REFERENCES [Teacher]([teacherid])
ON UPDATE CASCADE
GO
ALTER TABLE [CourseTeacher] CHECK CONSTRAINT [CourseTeacher_fk1]
GO

ALTER TABLE [StudentParent] WITH CHECK ADD CONSTRAINT [StudentParent_fk0] FOREIGN KEY ([studentid]) REFERENCES [Student]([studentid])
ON UPDATE CASCADE
GO
ALTER TABLE [StudentParent] CHECK CONSTRAINT [StudentParent_fk0]
GO
ALTER TABLE [StudentParent] WITH CHECK ADD CONSTRAINT [StudentParent_fk1] FOREIGN KEY ([parentid]) REFERENCES [Parent]([parentid])
ON UPDATE CASCADE
GO
ALTER TABLE [StudentParent] CHECK CONSTRAINT [StudentParent_fk1]
GO

ALTER TABLE [ExamResult] WITH CHECK ADD CONSTRAINT [ExamResult_fk0] FOREIGN KEY ([studentid]) REFERENCES [Student]([studentid])
ON UPDATE CASCADE
GO
ALTER TABLE [ExamResult] CHECK CONSTRAINT [ExamResult_fk0]
GO
ALTER TABLE [ExamResult] WITH CHECK ADD CONSTRAINT [ExamResult_fk1] FOREIGN KEY ([courseid]) REFERENCES [Course]([courseid])
ON UPDATE CASCADE
GO
ALTER TABLE [ExamResult] CHECK CONSTRAINT [ExamResult_fk1]
GO

ALTER TABLE [Attendance] WITH CHECK ADD CONSTRAINT [Attendance_fk0] FOREIGN KEY ([studentid]) REFERENCES [Student]([studentid])
ON UPDATE CASCADE
GO
ALTER TABLE [Attendance] CHECK CONSTRAINT [Attendance_fk0]
GO
ALTER TABLE [Attendance] WITH CHECK ADD CONSTRAINT [Attendance_fk1] FOREIGN KEY ([courseid]) REFERENCES [Course]([courseid])
ON UPDATE CASCADE
GO
ALTER TABLE [Attendance] CHECK CONSTRAINT [Attendance_fk1]
GO


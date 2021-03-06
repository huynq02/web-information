USE [PRJ301_SP22]
GO
/****** Object:  UserDefinedFunction [dbo].[getNameFPT]    */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getNameFPT] ( @str NVARCHAR(4000) )
RETURNS NVARCHAR(2000)
AS
BEGIN
    DECLARE @retval NVARCHAR(2000);

    SET @str=RTRIM(LTRIM(@str));
    SET @retval=LEFT(@str,1);

    WHILE CHARINDEX(' ',@str,1)>0 BEGIN
        SET @str=LTRIM(RIGHT(@str,LEN(@str)-CHARINDEX(' ',@str,1)));
        SET @retval+=LEFT(@str,1);
    END

    RETURN @retval;
END
GO
/* Object:  Table [dbo].[Academic]  */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Academic_HE151369](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Academic_HE151369] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Academic_Student]    */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Academic_Student_HE151369](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[rollNumber] [varchar](10) NOT NULL,
	[oldRollnumber] [varchar](10) NULL,
	[memberCode] [nvarchar](20) NOT NULL,
	[enrollDate] [date] NOT NULL,
	[mode] [nvarchar](20) NOT NULL,
	[studentId] [int] NOT NULL,
 CONSTRAINT [PK_Academic_Student_HE151369] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campus]   */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campus_HE151369](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Campus_HE151369] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campus_Academic]   */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campus_Academic_HE151369](
	[campusId] [int] NOT NULL,
	[academicId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parent] */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parent_HE151369](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[phoneNumber] [int] NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[job] [nvarchar](50) NOT NULL,
	[placeWork] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Parent_HE151369] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specialized]    */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialized_HE151369](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nameSpecialized] [nvarchar](50) NOT NULL,
	[code] [varchar](2) NOT NULL,
 CONSTRAINT [PK_Specialized_HE151369] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Subject]    */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject_HE151369](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nameSub] [nvarchar](50) NOT NULL,
	[code] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Subject_HE151369] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher] */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher_HE151369](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[gender] [bit] NOT NULL,
	[cardNo] [int] NULL,
	[phoneNumber] [int] NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Teacher_HE151369] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Teacher_Subject]   */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher_Subject_HE151369](
	[teacherId] [int] NOT NULL,
	[subjectId] [int] NOT NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Special_Subject]   */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Special_Subject_HE151369](
	[specialId] [int] NOT NULL,
	[subjectId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassStudent] */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassStudent_HE151369](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](50) NOT NULL,
	[code] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ClassStudent_HE151369] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[News] */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News_HE151369](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](250) NOT NULL,
	[content] [nvarchar](1000) NOT NULL,
	[discreption] [nvarchar](250) NOT NULL,
	[createddate] [date] NOT NULL,
	images	[nvarchar](100)	NOT NULL
 CONSTRAINT [PK_News_HE151369] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher_Class]   */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher_Class_HE151369](
	[teacherId] [int] NOT NULL,
	[classId] [int] NOT NULL
) ON [PRIMARY]
GO
/* Object:  Table [dbo].[Image_Student]  */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image_Student_HE151369](
	[imgId] [int] IDENTITY(1,1) NOT NULL,
	[url] [nvarchar](250) NOT NULL,
	[studentId] [int] NOT NULL,
 CONSTRAINT [PK_Image_Student_HE151369] PRIMARY KEY CLUSTERED 
(
	[imgId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]  */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_HE151369](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [nvarchar](25) NOT NULL,
	[lastName] [nvarchar](25) NOT NULL,
	[DOB] [date] NOT NULL,
	[gender] [bit] NOT NULL,
	[cardNo] [int] NULL,
	[cardDate] [date] NULL,
	[cardPlace] [nvarchar](255) NULL,
	[address] [nvarchar](255) NOT NULL,
	[telephone] [int] NOT NULL,
	[email] [varchar](50) NOT NULL,
	[specializedId] [int] NULL,
	[campusId] [int] NULL,
	[parentId] [int] NULL,
	[classId] [int] NULL,
	[subId] [int] NULL,
 CONSTRAINT [PK_Student_HE151369] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Go

SET IDENTITY_INSERT [dbo].[Academic_HE151369] ON 

INSERT [dbo].[Academic_HE151369] ([id], [username], [password], [email]) VALUES (1, N'admin', N'123456', N'tuananh462001@gmail.com')
SET IDENTITY_INSERT [dbo].[Academic_HE151369] OFF
SET IDENTITY_INSERT [dbo].[Academic_Student_HE151369] ON 

INSERT [dbo].[Academic_Student_HE151369] ([id], [rollNumber], [oldRollnumber], [memberCode], [enrollDate], [mode], [studentId]) VALUES (12, N'FU-HL1', NULL, N'HoaPNSB1', CAST(N'2018-08-08' AS Date), N'cao dang', 1)
INSERT [dbo].[Academic_Student_HE151369] ([id], [rollNumber], [oldRollnumber], [memberCode], [enrollDate], [mode], [studentId]) VALUES (15, N'FU-HL1024', NULL, N'HoaPSE1024', CAST(N'2018-08-16' AS Date), N'chinh quy', 1024)
INSERT [dbo].[Academic_Student_HE151369] ([id], [rollNumber], [oldRollnumber], [memberCode], [enrollDate], [mode], [studentId]) VALUES (16, N'FU-HL2', NULL, N'NhatTQSE2', CAST(N'2018-08-17' AS Date), N'Cao Dang', 2)
INSERT [dbo].[Academic_Student_HE151369] ([id], [rollNumber], [oldRollnumber], [memberCode], [enrollDate], [mode], [studentId]) VALUES (18, N'FU-HCM1025', NULL, N'ThuyNPHSB1025', CAST(N'2018-08-08' AS Date), N'abcd', 1025)
INSERT [dbo].[Academic_Student_HE151369] ([id], [rollNumber], [oldRollnumber], [memberCode], [enrollDate], [mode], [studentId]) VALUES (19, N'FU-HL1027', NULL, N'ĐucPVIA1027', CAST(N'2018-08-16' AS Date), N'dai hoc', 1027)
INSERT [dbo].[Academic_Student_HE151369] ([id], [rollNumber], [oldRollnumber], [memberCode], [enrollDate], [mode], [studentId]) VALUES (20, N'FU-HL1028', NULL, N'HoaPSE1028', CAST(N'2018-08-16' AS Date), N'chinh quy', 1028)
INSERT [dbo].[Academic_Student_HE151369] ([id], [rollNumber], [oldRollnumber], [memberCode], [enrollDate], [mode], [studentId]) VALUES (21, N'FU-HL5', NULL, N'ĐucPASB5', CAST(N'2018-08-16' AS Date), N'dai hoc', 5)
INSERT [dbo].[Academic_Student_HE151369] ([id], [rollNumber], [oldRollnumber], [memberCode], [enrollDate], [mode], [studentId]) VALUES (22, N'FU-HL8', NULL, N'NhiLBSE8', CAST(N'2018-08-16' AS Date), N'chinh quy', 8)
INSERT [dbo].[Academic_Student_HE151369] ([id], [rollNumber], [oldRollnumber], [memberCode], [enrollDate], [mode], [studentId]) VALUES (23, N'FU-HL10', NULL, N'NamVDSE10', CAST(N'2018-08-16' AS Date), N'dai hoc', 10)
INSERT [dbo].[Academic_Student_HE151369] ([id], [rollNumber], [oldRollnumber], [memberCode], [enrollDate], [mode], [studentId]) VALUES (24, N'FU-HL12', NULL, N'PhuongLTSE12', CAST(N'2018-08-16' AS Date), N'chinh quy', 12)
INSERT [dbo].[Academic_Student_HE151369] ([id], [rollNumber], [oldRollnumber], [memberCode], [enrollDate], [mode], [studentId]) VALUES (25, N'FU-HL14', NULL, N'TrangNTSE14', CAST(N'2018-08-16' AS Date), N'dai hoc', 14)
INSERT [dbo].[Academic_Student_HE151369] ([id], [rollNumber], [oldRollnumber], [memberCode], [enrollDate], [mode], [studentId]) VALUES (26, N'FU-HL15', NULL, N'PhuongPTSB15', CAST(N'2018-08-16' AS Date), N'chinh quy', 15)
INSERT [dbo].[Academic_Student_HE151369] ([id], [rollNumber], [oldRollnumber], [memberCode], [enrollDate], [mode], [studentId]) VALUES (27, N'FU-HL16', NULL, N'NgaPTSE16', CAST(N'2018-08-16' AS Date), N'chinh quy', 16)


SET IDENTITY_INSERT [dbo].[Academic_Student_HE151369] OFF
SET IDENTITY_INSERT [dbo].[Campus_HE151369] ON 

INSERT [dbo].[Campus_HE151369] ([id], [name]) VALUES (8, N'FU-HL')
INSERT [dbo].[Campus_HE151369] ([id], [name]) VALUES (9, N'FU-HCM')
INSERT [dbo].[Campus_HE151369] ([id], [name]) VALUES (10, N'FU-DN')
INSERT [dbo].[Campus_HE151369] ([id], [name]) VALUES (11, N'FU-CT')

SET IDENTITY_INSERT [dbo].[Campus_HE151369] OFF
INSERT [dbo].[Campus_Academic_HE151369] ([campusId], [academicId]) VALUES (8, 1)
SET IDENTITY_INSERT [dbo].[Parent_HE151369] ON 

INSERT [dbo].[Parent_HE151369] ([id], [name], [phoneNumber], [address], [email], [job], [placeWork]) VALUES (1, N'Phạm Văn Quang', 986246813, N'Ninh Bình', N'quangpd@gmail.com', N'Free', N'Ninh Bình')
INSERT [dbo].[Parent_HE151369] ([id], [name], [phoneNumber], [address], [email], [job], [placeWork]) VALUES (2, N'Trần Quang Hải', 684235774, N'Vinh', N'hai7x@gmail.com', N'Bác Si', N'Vinh')
INSERT [dbo].[Parent_HE151369] ([id], [name], [phoneNumber], [address], [email], [job], [placeWork]) VALUES (3, N'Nguyễn Hải Nam', 169125486, N'Cà Mau', N'namesimple@gmail.com', N'Công An', N'Cà Mau')
INSERT [dbo].[Parent_HE151369] ([id], [name], [phoneNumber], [address], [email], [job], [placeWork]) VALUES (4, N'Đỗ Quang Thắng', 159631547, N'Hưng Yên', N'hongvan@gmail.com', N'Giáo Viên', N'Hưng Yên')
INSERT [dbo].[Parent_HE151369] ([id], [name], [phoneNumber], [address], [email], [job], [placeWork]) VALUES (5, N'Nguyễn Kỳ Duyên',987526718, N'Hà Nội', N'kyduyen@gmail.com', N'Tiếp Viên', N'VietNamArilines')
INSERT [dbo].[Parent_HE151369] ([id], [name], [phoneNumber], [address], [email], [job], [placeWork]) VALUES (6, N'Phạm Thúy Ngân', 943516548, N'Hải Phòng', N'thuyngan@gmail.com', N'LTV', N'Hà Nội')
INSERT [dbo].[Parent_HE151369] ([id], [name], [phoneNumber], [address], [email], [job], [placeWork]) VALUES (7, N'Ông Gia Bách', 987512378, N'Hải Dương', N'giabach@gmail.com', N'Lái xe', N'Hải Dương')
INSERT [dbo].[Parent_HE151369] ([id], [name], [phoneNumber], [address], [email], [job], [placeWork]) VALUES (8, N'Lại Thảo Mai',	651656546, N'Hà Nội', N'thaomai@gmailcom', N'Giáo Viên', N'Hà Nội')
INSERT [dbo].[Parent_HE151369] ([id], [name], [phoneNumber], [address], [email], [job], [placeWork]) VALUES (9, N'Trần Bảo Vy', 321654846, N'Lào Cai', N'baovy@gmail.com', N'Giáo Viên', N'Lào Cai')
INSERT [dbo].[Parent_HE151369] ([id], [name], [phoneNumber], [address], [email], [job], [placeWork]) VALUES (10,	N'Nguyễn Cát Tường', 656544464,	N'Cao Bằng', N'cattuong@gmail.com', N'Công An', N'Cao Bằng')
INSERT [dbo].[Parent_HE151369] ([id], [name], [phoneNumber], [address], [email], [job], [placeWork]) VALUES (11, N'Trần Bảo Vy', 321654846, N'Lào Cai', N'baovy@gmail.com', N'Giáo Viên', N'Lào Cai')
INSERT [dbo].[Parent_HE151369] ([id], [name], [phoneNumber], [address], [email], [job], [placeWork]) VALUES (12,	N'Nguyễn Cát Tường', 656544464,	N'Cao Bằng', N'cattuong@gmail.com', N'Công An', N'Cao Bằng')
INSERT [dbo].[Parent_HE151369] ([id], [name], [phoneNumber], [address], [email], [job], [placeWork]) VALUES (13,	N'Nguyễn Hoài An', 516549849, N'Hà Nội', N'hoaian@gmail.com', N'Bác Sĩ', N'Hà Nội')
INSERT [dbo].[Parent_HE151369] ([id], [name], [phoneNumber], [address], [email], [job], [placeWork]) VALUES (14,	N'Nguyễn Khả Hân', 545446846, N'Hải Dương', N'khahan@gmailcom',	N'Y Tá', N'Hải Dương')
INSERT [dbo].[Parent_HE151369] ([id], [name], [phoneNumber], [address], [email], [job], [placeWork]) VALUES (15,	N'Trần Khánh Ngọc', 626189455, N'Hà Nội', N'khanhngoc@gmail.com', N'Luật Sư', N'Hà Nội')


SET IDENTITY_INSERT [dbo].[Parent_HE151369] OFF
SET IDENTITY_INSERT [dbo].[Specialized_HE151369] ON 

INSERT [dbo].[Specialized_HE151369] ([id], [nameSpecialized], [code]) VALUES (1, N'Kỹ Thuật Phần Mềm', N'SE')
INSERT [dbo].[Specialized_HE151369] ([id], [nameSpecialized], [code]) VALUES (2, N'An Toàn Thông Tin', N'IA')
INSERT [dbo].[Specialized_HE151369] ([id], [nameSpecialized], [code]) VALUES (3, N'Quản Trị Kinh Doanh', N'SB')
SET IDENTITY_INSERT [dbo].[Specialized_HE151369] OFF
SET IDENTITY_INSERT [dbo].[ClassStudent_HE151369] ON 

INSERT [dbo].[ClassStudent_HE151369] ([Id], [ClassName], [code]) VALUES (1, N'SE1536', N'SE1')
INSERT [dbo].[ClassStudent_HE151369] ([Id], [ClassName], [code]) VALUES (2, N'SE1512', N'SE2')
INSERT [dbo].[ClassStudent_HE151369] ([Id], [ClassName], [code]) VALUES (3, N'SE1467', N'SE3')
INSERT [dbo].[ClassStudent_HE151369] ([Id], [ClassName], [code]) VALUES (4, N'SB1500', N'SB1')
INSERT [dbo].[ClassStudent_HE151369] ([Id], [ClassName], [code]) VALUES (5, N'IA1578', N'IA1')
INSERT [dbo].[ClassStudent_HE151369] ([Id], [ClassName], [code]) VALUES (6, N'SE1598', N'SE4')
SET IDENTITY_INSERT [dbo].[ClassStudent_HE151369] OFF
SET IDENTITY_INSERT [dbo].[Student_HE151369] ON 

INSERT [dbo].[Student_HE151369] ([id], [firstName], [lastName], [DOB], [gender], [cardNo], [cardDate], [cardPlace], [address], [telephone], [email], [specializedId], [campusId], [parentId],[classId],[subId]) VALUES (1, N'Phạm Ngọc', N'Hòa', CAST(N'1998-03-20' AS Date), 1, NULL, NULL, NULL, N'FPT University, Thạch Hòa, Thạch Thất, Hà Nội, +84968038714', 968038714, N'ngochoa@gmail.com', 3, 8, 1, 2, Null)
INSERT [dbo].[Student_HE151369] ([id], [firstName], [lastName], [DOB], [gender], [cardNo], [cardDate], [cardPlace], [address], [telephone], [email], [specializedId], [campusId], [parentId],[classId],[subId]) VALUES (2, N'Trần Quang', N'Nhật', CAST(N'1998-03-10' AS Date), 1, NULL, NULL, NULL, N'Vinh', 123456789, N'NhatTQSE2@fpt.edu.vn', 1, 8, 2, 1, NULL)
INSERT [dbo].[Student_HE151369] ([id], [firstName], [lastName], [DOB], [gender], [cardNo], [cardDate], [cardPlace], [address], [telephone], [email], [specializedId], [campusId], [parentId],[classId],[subId]) VALUES (3, N'Nguyễn Xuân', N'Cường', CAST(N'1998-05-20' AS Date), 1, NULL, NULL, NULL, N'Bắc Ninh', 968034874, N'cuongnx98@gmail.com', 1, 8, NULL, NULL, NULL)
INSERT [dbo].[Student_HE151369] ([id], [firstName], [lastName], [DOB], [gender], [cardNo], [cardDate], [cardPlace], [address], [telephone], [email], [specializedId], [campusId], [parentId],[classId],[subId]) VALUES (4, N'Đỗ Quang', N'Hiệp', CAST(N'1997-09-30' AS Date), 1, NULL, NULL, NULL, N'Hưng Yên', 968481349, N'hongthuy@gmail.com', 1, 8, NULL, NULL, NULL)
INSERT [dbo].[Student_HE151369] ([id], [firstName], [lastName], [DOB], [gender], [cardNo], [cardDate], [cardPlace], [address], [telephone], [email], [specializedId], [campusId], [parentId],[classId],[subId]) VALUES (1024, N'Phạm', N'Hòa', CAST(N'2018-08-09' AS Date), 1, NULL, NULL, NULL, N'FPT University, Thạch Hòa, Thạch Thất, Hà Nội, +84968038714', 968038714, N'phamhoa@gmail.com', 1, 8, 5, 1, NULL)
INSERT [dbo].[Student_HE151369] ([id], [firstName], [lastName], [DOB], [gender], [cardNo], [cardDate], [cardPlace], [address], [telephone], [email], [specializedId], [campusId], [parentId],[classId],[subId]) VALUES (1025, N'Nguyễn Phương Hồng', N'Thủy', CAST(N'2018-08-10' AS Date), 0, NULL, NULL, NULL, N'FPT University, Thạch Hòa, Thạch Thất, Hà Nội, +84968038714', 968038714, N'ThuyNPHSB1025@fpt.edu.vn', 3, 9, 3, 5, NULL)
INSERT [dbo].[Student_HE151369] ([id], [firstName], [lastName], [DOB], [gender], [cardNo], [cardDate], [cardPlace], [address], [telephone], [email], [specializedId], [campusId], [parentId],[classId],[subId]) VALUES (1027, N'Phan Văn', N'Đức', CAST(N'2018-08-16' AS Date), 1, NULL, NULL, NULL, N'Hà Nội', 968038714, N'ÐucPVIA1027@fpt.edu.vn', 3, 8, 4, 5, NULL)
INSERT [dbo].[Student_HE151369] ([id], [firstName], [lastName], [DOB], [gender], [cardNo], [cardDate], [cardPlace], [address], [telephone], [email], [specializedId], [campusId], [parentId],[classId],[subId]) VALUES (1028, N'Phạm', N'Hòa', CAST(N'2018-08-24' AS Date), 0, NULL, NULL, NULL, N'FPT University, Thạch Hòa, Thạch Thất, Hà Nội, +84968038714', 968038714, N'HoaPSE1028@fpt.edu.vn', 1, 8, 5, 1, NULL)
INSERT [dbo].[Student_HE151369] ([id], [firstName], [lastName], [DOB], [gender], [cardNo], [cardDate], [cardPlace], [address], [telephone], [email], [specializedId], [campusId], [parentId],[classId],[subId]) VALUES (5, N'Pham Anh', N'Đức', CAST(N'2018-08-16' AS Date), 1, NULL, NULL, NULL, N'Hà Nội', 968038714, N'ÐucPVIA1027@fpt.edu.vn', 3, 8, 6, 5, NULL)
INSERT [dbo].[Student_HE151369] ([id], [firstName], [lastName], [DOB], [gender], [cardNo], [cardDate], [cardPlace], [address], [telephone], [email], [specializedId], [campusId], [parentId],[classId],[subId]) VALUES (8, N'Lê Bảo', N'Nhi', CAST(N'2014-08-24' AS Date), 0, NULL, NULL, NULL, N'Hà Giang', 968038714, N'HoaPSE1028@fpt.edu.vn', 1, 8, 7, 3, NULL)
INSERT [dbo].[Student_HE151369] ([id], [firstName], [lastName], [DOB], [gender], [cardNo], [cardDate], [cardPlace], [address], [telephone], [email], [specializedId], [campusId], [parentId],[classId],[subId]) VALUES (10, N'Vũ Đức', N'Nam', CAST(N'2012-08-24' AS Date), 1, NULL, NULL, NULL, N'Lào Cai', 968038714, N'HoaPSE1028@fpt.edu.vn', 2, 8, 8, 5, NULL)
INSERT [dbo].[Student_HE151369] ([id], [firstName], [lastName], [DOB], [gender], [cardNo], [cardDate], [cardPlace], [address], [telephone], [email], [specializedId], [campusId], [parentId],[classId],[subId]) VALUES (12, N'Lê Thị', N'Phượng', CAST(N'2018-08-24' AS Date), 0, NULL, NULL, NULL, N'Nghệ Ăn', 968038714, N'HoaPSE1028@fpt.edu.vn', 1, 8, 9, 1, NULL)
INSERT [dbo].[Student_HE151369] ([id], [firstName], [lastName], [DOB], [gender], [cardNo], [cardDate], [cardPlace], [address], [telephone], [email], [specializedId], [campusId], [parentId],[classId],[subId]) VALUES (14, N'Nguyễn Thu', N'Trang', CAST(N'2010-08-24' AS Date), 0, NULL, NULL, NULL, N'Vinh', 968038714, N'HoaPSE1028@fpt.edu.vn', 1, 8, 10, 3, NULL)
INSERT [dbo].[Student_HE151369] ([id], [firstName], [lastName], [DOB], [gender], [cardNo], [cardDate], [cardPlace], [address], [telephone], [email], [specializedId], [campusId], [parentId],[classId],[subId]) VALUES (15, N'Phan Thị', N'Phượng', CAST(N'2009-08-16' AS Date), 0, NULL, NULL, NULL, N'Hà Nội', 968038714, N'ÐucPVIA1027@fpt.edu.vn', 3, 8, 11, 5, NULL)
INSERT [dbo].[Student_HE151369] ([id], [firstName], [lastName], [DOB], [gender], [cardNo], [cardDate], [cardPlace], [address], [telephone], [email], [specializedId], [campusId], [parentId],[classId],[subId]) VALUES (16, N'Phạm Thuý', N'Nga', CAST(N'2023-08-24' AS Date), 0, NULL, NULL, NULL, N'Điện Biên', 968038714, N'HoaPSE1028@fpt.edu.vn', 1, 8, 12, 1, NULL)
SET IDENTITY_INSERT [dbo].[Student_HE151369] OFF
SET IDENTITY_INSERT [dbo].[Image_Student_HE151369] ON 
INSERT [dbo].[Image_Student_HE151369] ([imgId], [url], [studentId] ) VALUES (1, '../images/HE150068.png', 1)
INSERT [dbo].[Image_Student_HE151369] ([imgId], [url], [studentId] ) VALUES (2,'../images/HE150005.pnG', 2)
INSERT [dbo].[Image_Student_HE151369] ([imgId], [url], [studentId] ) VALUES (3,'	../images/HE141784.png', 5)
INSERT [dbo].[Image_Student_HE151369] ([imgId], [url], [studentId] ) VALUES (4,'	../images/HE140980.png', 8)
INSERT [dbo].[Image_Student_HE151369] ([imgId], [url], [studentId] ) VALUES (5,'	../images/HE170698.png', 1024)
INSERT [dbo].[Image_Student_HE151369] ([imgId], [url], [studentId] ) VALUES (6,'	../images/HE170682.png', 1025)
INSERT [dbo].[Image_Student_HE151369] ([imgId], [url], [studentId] ) VALUES (7,'	../images/HE171100.png', 1027)
INSERT [dbo].[Image_Student_HE151369] ([imgId], [url], [studentId] ) VALUES (8,'	../images/HE170682.png', 1028)
INSERT [dbo].[Image_Student_HE151369] ([imgId], [url], [studentId] ) VALUES (9,'	../images/HS140153.png', 16)
INSERT [dbo].[Image_Student_HE151369] ([imgId], [url], [studentId] ) VALUES (10,'../images/HE170682.png', 10)
INSERT [dbo].[Image_Student_HE151369] ([imgId], [url], [studentId] ) VALUES (11,'../images/HS153342.png', 12)
INSERT [dbo].[Image_Student_HE151369] ([imgId], [url], [studentId] ) VALUES (12,'../images/HS140245.png', 14)
INSERT [dbo].[Image_Student_HE151369] ([imgId], [url], [studentId] ) VALUES (13,'../images/HS140153.png', 15)

SET IDENTITY_INSERT [dbo].[Image_Student_HE151369] OFF
SET IDENTITY_INSERT [dbo].[News_HE151369] ON 
INSERT [dbo].[News_HE151369] ([id],[title],[content],[discreption],[createddate],[images]) VALUES(1, N'Ngành truyền thông đa phương tiện đang tìm kiếm tài năng', N'Truyền thông đa phương tiện là ngành giao thoa giữa công nghệ thông tin và truyền thông, thiết kế, xây dựng những sản phẩm ứng dụng trong truyền hình, phát thanh, báo điện tử, quảng cáo… hay “lấn sân” sang lĩnh vực giải trí như game, điện ảnh, hoạt hình… Đây cũng là nền tảng quan trọng phục vụ các lĩnh vực marketing, giáo dục và giải trí.', N'Đây được coi là ngành học dành cho những người năng động, sáng tạo và được nhiều bạn trẻ săn đón trong thời đại mới. Xã hội và công nghệ ngày càng phát triển, đi kèm những thay đổi trong lĩnh vực quảng cáo – truyền thông.', '2022-02-18', 'images/5.png')
INSERT [dbo].[News_HE151369] ([id],[title],[content],[discreption],[createddate],[images]) VALUES(2, N'SV FPT trau dồi kỹ năng MC cùng FES-CAMP 02 – Trại người dẫn chương trình', N'FES-CAMP là chuỗi hoạt động học tập do Ban Công tác học đường FPT Education tổ chức, dành riêng cho đối tượng học sinh, sinh viên nhà F trên toàn quốc. Sau thành công của trại sáng tạo nội dung mùa 1, mùa 2 của chương trình này đã trở lại và mang đến những kinh nghiệm cũng như những trải nghiệm vô cùng đáng giá cho sinh viên FPTU về kỹ năng dẫn chương trình.', N'Ngày 20/1/1022 vừa qua với chương trình webinar “Master of ceremony” đã chính thức khép lại một tuần hoạt động sôi nổi của Fes-cam 02 – Trại người dẫn chương trình.', '2022-02-11', 'images/6.png')
INSERT [dbo].[News_HE151369] ([id],[title],[content],[discreption],[createddate],[images]) VALUES(3, N'Gala Brothers & Sisters: Một chặng đường mô hình sinh viên giúp SV', N'Brothers & Sisters là một dự án dựa trên mô hình “sinh viên giúp sinh viên” của trường ĐH FPT TP.HCM nhằm hỗ trợ và giúp đỡ các bạn tân sinh viên làm quen với môi trường mới đầy bỡ ngỡ và lạ lẫm. Sau hành trình 4 tháng, 120 “anh trai”, “chị gái” đã hoàn thành nhiệm vụ của mình, Gala Brothers & Sisters chính là cơ hội để nhìn lại một chặng đường đã qua và công nhận những cố gắng, nỗ lực của các bạn Brothers & Sisters.', N'NULĐại học FPT TP.HCM đã tổ chức buổi Gala Brothers & Sisters diễn ra song song ở hai hình thức: Offline tại Hội trường B trường Đại học FPT TP.HCM và livestream tại fanpage FPT Around.L', '2022-01-07', 'images/7.png')
INSERT [dbo].[News_HE151369] ([id],[title],[content],[discreption],[createddate],[images]) VALUES(4, N'Sinh viên Kinh doanh quốc tế ĐH FPT – những con người của sự “ngoại giao”', N'Tại Đại học FPT, nơi mà tiếng Anh là ngôn ngữ chính song hành với đó là giáo trình quốc tế được truyền đạt bởi những giảng viên tận tâm. Rất nhiều sinh viên đã chọn FPT là điểm nơi để trải nghiệm chuyên ngành Kinh doanh quốc tế, với môi trường học tập hiện đại theo đó là lý thuyết đi kèm thực tiễn đã tạo nên những con người đầy sự tự tin và bản lĩnh để bước ra thương trường quốc tế.', N'Sự toàn cầu hóa đang ngày càng được lan rộng trong thời đại mà chúng ta đang sống. Tuy rằng điều này đã diễn ra từ nhiều thế kỷ trước, song việc thế giới đang có nền hòa bình ổn định lại khiến sự kiện toàn cầu hóa dần trở nên rõ rệt hơn.', '2022-07-29', 'images/2.png')
INSERT [dbo].[News_HE151369] ([id],[title],[content],[discreption],[createddate],[images]) VALUES(5, N'Sinh viên Trí tuệ nhân tạo nói gì khi học tập tại ĐH FPT', N'Chuyên ngành Trí tuệ Nhân tạo (AI) là một trong những hướng phát triển vượt bậc của ngành CNTT. Chuyên ngành này sẽ thông qua việc sử dụng các mô hình máy tính, kỹ thuật cao và công nghệ hiện đại để tạo ra máy móc cũng như các hệ thống thông minh với khả năng xử lý thông tin khổng lồ.', N'Chuyên ngành Trí tuệ Nhân tạo (AI) tại Đại học FPT sẽ mang đến cho bạn rất nhiều cơ hội phát triển, không chỉ trong các lĩnh vực kỹ thuật mà còn trên nhiều lĩnh vực công nghiệp.', '2022-02-07', 'images/4.png')
SET IDENTITY_INSERT [dbo].[News_HE151369] OFF

SET IDENTITY_INSERT [dbo].[Subject_HE151369] ON 
INSERT [dbo].[Subject_HE151369] ([id],[nameSub] ,[code]) VALUES (1, N'Japaneses', 'JPD123')
INSERT [dbo].[Subject_HE151369] ([id],[nameSub] ,[code]) VALUES (2, N'Database', 'DBI202')
INSERT [dbo].[Subject_HE151369] ([id],[nameSub] ,[code]) VALUES (3, N'Statistic and Probability', N'MAS291')
INSERT [dbo].[Subject_HE151369] ([id],[nameSub] ,[code]) VALUES (4, N'Chinese', N'CHN111')
INSERT [dbo].[Subject_HE151369] ([id],[nameSub] ,[code]) VALUES (5, N'Computer Organization', N'CEA201')
SET IDENTITY_INSERT [dbo].[Subject_HE151369] OFF

INSERT [dbo].[Special_Subject_HE151369] ([specialId] ,[subjectId]) VALUES (1, 1)
INSERT [dbo].[Special_Subject_HE151369] ([specialId] ,[subjectId]) VALUES (1, 2)
INSERT [dbo].[Special_Subject_HE151369] ([specialId] ,[subjectId]) VALUES (1, 3)
INSERT [dbo].[Special_Subject_HE151369] ([specialId] ,[subjectId]) VALUES (2, 1)
INSERT [dbo].[Special_Subject_HE151369] ([specialId] ,[subjectId]) VALUES (2, 3)
INSERT [dbo].[Special_Subject_HE151369] ([specialId] ,[subjectId]) VALUES (1, 5)
INSERT [dbo].[Special_Subject_HE151369] ([specialId] ,[subjectId]) VALUES (3, 4)
INSERT [dbo].[Special_Subject_HE151369] ([specialId] ,[subjectId]) VALUES (2, 1)
INSERT [dbo].[Special_Subject_HE151369] ([specialId] ,[subjectId]) VALUES (2, 3)

SET IDENTITY_INSERT [dbo].[Teacher_HE151369] ON 
INSERT [dbo].[Teacher_HE151369] ([id],[name] ,[gender] ,[cardNo],[phoneNumber],[address],[email]) VALUES (1, N'Lê Thị Hồng Thơm', 0, 123456, 65154644, N'Hà Nội', N'thomleth@fe.edu.vn')
INSERT [dbo].[Teacher_HE151369] ([id],[name] ,[gender] ,[cardNo],[phoneNumber],[address],[email]) VALUES (2, N'Nguyễn Ngọc Anh', 0, 314644, 21321656, N'Hà Nội', N'anhnn@fe.edu.vn')
INSERT [dbo].[Teacher_HE151369] ([id],[name] ,[gender] ,[cardNo],[phoneNumber],[address],[email]) VALUES (3, N'Trần Quý Ban', 1, 651654, 55165554, N'Hà Nội', N'bantq@fe.edu.vn')
INSERT [dbo].[Teacher_HE151369] ([id],[name] ,[gender] ,[cardNo],[phoneNumber],[address],[email]) VALUES (4, N'Phùng Duy Khương', 1, 213133, 55136546, N'Hải Dương',  N'khuongpd@fe.edu.vn')
INSERT [dbo].[Teacher_HE151369] ([id],[name] ,[gender] ,[cardNo],[phoneNumber],[address],[email]) VALUES (5, N'Nguyễn Thị Ánh Ngọc', 0, 516546, 64646543, N'Nam Đinh', N'ngocnta@fe.edu.vn')
INSERT [dbo].[Teacher_HE151369] ([id],[name] ,[gender] ,[cardNo],[phoneNumber],[address],[email]) VALUES (6, N'Đinh Công Hùng', 1, 354343, 35465431, N'Hà Nội', N'hungdc@fe.edu.vn')
SET IDENTITY_INSERT [dbo].[Teacher_HE151369] OFF


INSERT [dbo].[Teacher_Class_HE151369] ([teacherId],[classId]) VALUES (1, 1)
INSERT [dbo].[Teacher_Class_HE151369] ([teacherId],[classId]) VALUES (2, 2)
INSERT [dbo].[Teacher_Class_HE151369] ([teacherId],[classId]) VALUES (5, 3)
INSERT [dbo].[Teacher_Class_HE151369] ([teacherId],[classId]) VALUES (5, 4)
INSERT [dbo].[Teacher_Class_HE151369] ([teacherId],[classId]) VALUES (5, 5)
INSERT [dbo].[Teacher_Class_HE151369] ([teacherId],[classId]) VALUES (1, 1)
INSERT [dbo].[Teacher_Class_HE151369] ([teacherId],[classId]) VALUES (1, 6)
INSERT [dbo].[Teacher_Class_HE151369] ([teacherId],[classId]) VALUES (1, 1)
INSERT [dbo].[Teacher_Class_HE151369] ([teacherId],[classId]) VALUES (1, 6)
INSERT [dbo].[Teacher_Class_HE151369] ([teacherId],[classId]) VALUES (1, 1)
INSERT [dbo].[Teacher_Class_HE151369] ([teacherId],[classId]) VALUES (1, 2)
INSERT [dbo].[Teacher_Class_HE151369] ([teacherId],[classId]) VALUES (1, 6)

INSERT [dbo].[Teacher_Subject_HE151369] ([teacherId] ,[subjectId]) VALUES (1, 3)
INSERT [dbo].[Teacher_Subject_HE151369] ([teacherId] ,[subjectId]) VALUES (2, 1)
INSERT [dbo].[Teacher_Subject_HE151369] ([teacherId] ,[subjectId]) VALUES (5, 2)
INSERT [dbo].[Teacher_Subject_HE151369] ([teacherId] ,[subjectId]) VALUES (5, 4)
INSERT [dbo].[Teacher_Subject_HE151369] ([teacherId] ,[subjectId]) VALUES (1, 3)
INSERT [dbo].[Teacher_Subject_HE151369] ([teacherId] ,[subjectId]) VALUES (1, 3)
INSERT [dbo].[Teacher_Subject_HE151369] ([teacherId] ,[subjectId]) VALUES (1, 2)
INSERT [dbo].[Teacher_Subject_HE151369] ([teacherId] ,[subjectId]) VALUES (1, 3)

ALTER TABLE [dbo].[Academic_Student_HE151369]  WITH CHECK ADD  CONSTRAINT [FK_Academic_Student_HE151369_Student_HE151369] FOREIGN KEY([studentId])
REFERENCES [dbo].[Student_HE151369] ([id])
GO
ALTER TABLE [dbo].[Academic_Student_HE151369] CHECK CONSTRAINT [FK_Academic_Student_HE151369_Student_HE151369]
GO
ALTER TABLE [dbo].[Academic_Student_HE151369]  WITH CHECK ADD  CONSTRAINT [FK_Academic_Student_HE151369_Student1_HE151369] FOREIGN KEY([studentId])
REFERENCES [dbo].[Student_HE151369] ([id])
GO
ALTER TABLE [dbo].[Academic_Student_HE151369] CHECK CONSTRAINT [FK_Academic_Student_HE151369_Student1_HE151369]
GO
ALTER TABLE [dbo].[Campus_Academic_HE151369]  WITH CHECK ADD  CONSTRAINT [FK_Campus_Academic_HE151369_Academic_HE151369] FOREIGN KEY([academicId])
REFERENCES [dbo].[Academic_HE151369] ([id])
GO
ALTER TABLE [dbo].[Campus_Academic_HE151369] CHECK CONSTRAINT [FK_Campus_Academic_HE151369_Academic_HE151369]
GO
ALTER TABLE [dbo].[Campus_Academic_HE151369]  WITH CHECK ADD  CONSTRAINT [FK_Campus_Academic_HE151369_Campus_HE151369] FOREIGN KEY([campusId])
REFERENCES [dbo].[Campus_HE151369] ([id])
GO
ALTER TABLE [dbo].[Campus_Academic_HE151369] CHECK CONSTRAINT [FK_Campus_Academic_HE151369_Campus_HE151369]
GO
ALTER TABLE [dbo].[Student_HE151369]  WITH CHECK ADD  CONSTRAINT [FK_Student_HE151369_Campus_HE151369] FOREIGN KEY([campusId])
REFERENCES [dbo].[Campus_HE151369] ([id])
GO
ALTER TABLE [dbo].[Student_HE151369] CHECK CONSTRAINT [FK_Student_HE151369_Campus_HE151369]
GO
ALTER TABLE [dbo].[Student_HE151369]  WITH CHECK ADD  CONSTRAINT [FK_Student_HE151369_Parent_HE151369] FOREIGN KEY([parentId])
REFERENCES [dbo].[Parent_HE151369] ([id])
GO
ALTER TABLE [dbo].[Student_HE151369] CHECK CONSTRAINT [FK_Student_HE151369_Parent_HE151369]
GO
ALTER TABLE [dbo].[Student_HE151369]  WITH CHECK ADD  CONSTRAINT [FK_Student_HE151369_Specialized_HE151369] FOREIGN KEY([specializedId])
REFERENCES [dbo].[Specialized_HE151369] ([id])
GO
ALTER TABLE [dbo].[Student_HE151369] CHECK CONSTRAINT [FK_Student_HE151369_Specialized_HE151369]
GO
ALTER TABLE [dbo].[Student_HE151369]  WITH CHECK ADD  CONSTRAINT [FK_Student_HE151369_Subject_HE151369] FOREIGN KEY([SubId])
REFERENCES [dbo].[Subject_HE151369] ([id])
GO
ALTER TABLE [dbo].[Student_HE151369] CHECK CONSTRAINT [FK_Student_HE151369_Subject_HE151369]
GO
ALTER TABLE [dbo].[Student_HE151369]  WITH CHECK ADD  CONSTRAINT [FK_Student_HE151369_ClassStudent_HE151369] FOREIGN KEY([classId])
REFERENCES [dbo].[ClassStudent_HE151369] ([Id])
GO
ALTER TABLE [dbo].[Student_HE151369] CHECK CONSTRAINT [FK_Student_HE151369_ClassStudent_HE151369]
GO
ALTER TABLE [dbo].[Image_Student_HE151369]  WITH CHECK ADD  CONSTRAINT [FK_Image_Student_HE151369_Student_HE151369] FOREIGN KEY([studentId])
REFERENCES [dbo].[Student_HE151369] ([id])
GO
ALTER TABLE [dbo].[Image_Student_HE151369] CHECK CONSTRAINT [FK_Image_Student_HE151369_Student_HE151369]
GO


ALTER TABLE [dbo].[Teacher_Subject_HE151369]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Subject_HE151369_Teacher_HE151369] FOREIGN KEY([teacherId])
REFERENCES [dbo].[Teacher_HE151369] ([id])
GO
ALTER TABLE [dbo].[Teacher_Subject_HE151369] CHECK CONSTRAINT [FK_Teacher_Subject_HE151369_Teacher_HE151369]
GO
ALTER TABLE [dbo].[Teacher_Subject_HE151369]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Subject_HE151369_Subject_HE151369] FOREIGN KEY([subjectId])
REFERENCES [dbo].[Subject_HE151369] ([id])
GO
ALTER TABLE [dbo].[Teacher_Subject_HE151369] CHECK CONSTRAINT [FK_Teacher_Subject_HE151369_Subject_HE151369]
GO


ALTER TABLE [dbo].[Special_Subject_HE151369]  WITH CHECK ADD  CONSTRAINT [FK_Special_Subject_HE151369_Specialized_HE151369] FOREIGN KEY([specialId])
REFERENCES [dbo].[Specialized_HE151369] ([id])
GO
ALTER TABLE [dbo].[Special_Subject_HE151369] CHECK CONSTRAINT [FK_Special_Subject_HE151369_Specialized_HE151369]
GO
ALTER TABLE [dbo].[Special_Subject_HE151369]  WITH CHECK ADD  CONSTRAINT [FK_Special_Subject_HE151369_Subject_HE151369] FOREIGN KEY([subjectId])
REFERENCES [dbo].[Subject_HE151369] ([id])
GO
ALTER TABLE [dbo].[Special_Subject_HE151369] CHECK CONSTRAINT [FK_Special_Subject_HE151369_Subject_HE151369]
GO


ALTER TABLE [dbo].[Teacher_Class_HE151369]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Class_HE151369_Teacher_HE151369] FOREIGN KEY([teacherId])
REFERENCES [dbo].[Teacher_HE151369] ([id])
GO
ALTER TABLE [dbo].[Teacher_Class_HE151369] CHECK CONSTRAINT [FK_Teacher_Class_HE151369_Teacher_HE151369]
GO
ALTER TABLE [dbo].[Teacher_Class_HE151369]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Class_HE151369_ClassStudent_HE151369] FOREIGN KEY([classId])
REFERENCES [dbo].[ClassStudent_HE151369] ([Id])
GO
ALTER TABLE [dbo].[Teacher_Class_HE151369] CHECK CONSTRAINT [FK_Teacher_Class_HE151369_ClassStudent_HE151369]
GO


USE [QLSV]
GO
/****** Object:  Table [dbo].[sexes]    Script Date: 03/08/2017 17:34:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sexes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sex] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_sexes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 03/08/2017 17:34:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](max) NOT NULL,
	[delflg] [int] NOT NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[faculties]    Script Date: 03/08/2017 17:34:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[faculties](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[faculty_name] [nvarchar](max) NOT NULL,
	[delflg] [int] NOT NULL,
 CONSTRAINT [PK_faculty] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[classes]    Script Date: 03/08/2017 17:34:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[classes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[class_name] [nvarchar](max) NOT NULL,
	[faculty_id] [int] NOT NULL,
	[delflg] [int] NOT NULL,
	[class_code] [nvarchar](max) NULL,
 CONSTRAINT [PK_classes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 03/08/2017 17:34:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](max) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[faculty_id] [int] NOT NULL,
	[delflg] [int] NOT NULL,
	[role_id] [int] NOT NULL,
	[full_name] [nvarchar](max) NULL,
	[birthday] [datetime] NULL,
	[sex] [int] NULL,
	[residence] [nvarchar](max) NULL,
	[country] [nvarchar](max) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[scores]    Script Date: 03/08/2017 17:34:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[scores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [int] NOT NULL,
	[class_id] [int] NOT NULL,
	[score] [float] NULL,
	[delflg] [int] NOT NULL,
 CONSTRAINT [PK_scores] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_classes_faculties]    Script Date: 03/08/2017 17:34:57 ******/
ALTER TABLE [dbo].[classes]  WITH CHECK ADD  CONSTRAINT [FK_classes_faculties] FOREIGN KEY([faculty_id])
REFERENCES [dbo].[faculties] ([id])
GO
ALTER TABLE [dbo].[classes] CHECK CONSTRAINT [FK_classes_faculties]
GO
/****** Object:  ForeignKey [FK_scores_classes]    Script Date: 03/08/2017 17:34:57 ******/
ALTER TABLE [dbo].[scores]  WITH CHECK ADD  CONSTRAINT [FK_scores_classes] FOREIGN KEY([class_id])
REFERENCES [dbo].[classes] ([id])
GO
ALTER TABLE [dbo].[scores] CHECK CONSTRAINT [FK_scores_classes]
GO
/****** Object:  ForeignKey [FK_scores_users]    Script Date: 03/08/2017 17:34:57 ******/
ALTER TABLE [dbo].[scores]  WITH CHECK ADD  CONSTRAINT [FK_scores_users] FOREIGN KEY([student_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[scores] CHECK CONSTRAINT [FK_scores_users]
GO
/****** Object:  ForeignKey [fk_Sex]    Script Date: 03/08/2017 17:34:57 ******/
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [fk_Sex] FOREIGN KEY([sex])
REFERENCES [dbo].[sexes] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [fk_Sex]
GO
/****** Object:  ForeignKey [FK_users_faculties]    Script Date: 03/08/2017 17:34:57 ******/
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_faculties] FOREIGN KEY([faculty_id])
REFERENCES [dbo].[faculties] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_faculties]
GO
/****** Object:  ForeignKey [FK_users_roles]    Script Date: 03/08/2017 17:34:57 ******/
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_roles]
GO

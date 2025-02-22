USE [master] 
GO
/****** Object:  Database [UniversityMedicalCenterHR]    Script Date: 10/5/2024 10:18:23 PM ******/
CREATE DATABASE [UniversityMedicalCenterHR]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UniversityMedicalCenterHR', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\UniversityMedicalCenterHR.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UniversityMedicalCenterHR_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\UniversityMedicalCenterHR_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [UniversityMedicalCenterHR] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UniversityMedicalCenterHR].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UniversityMedicalCenterHR] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniversityMedicalCenterHR] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniversityMedicalCenterHR] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniversityMedicalCenterHR] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniversityMedicalCenterHR] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniversityMedicalCenterHR] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UniversityMedicalCenterHR] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniversityMedicalCenterHR] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityMedicalCenterHR] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniversityMedicalCenterHR] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UniversityMedicalCenterHR] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniversityMedicalCenterHR] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniversityMedicalCenterHR] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniversityMedicalCenterHR] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniversityMedicalCenterHR] SET  ENABLE_BROKER 
GO
ALTER DATABASE [UniversityMedicalCenterHR] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniversityMedicalCenterHR] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UniversityMedicalCenterHR] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UniversityMedicalCenterHR] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniversityMedicalCenterHR] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniversityMedicalCenterHR] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UniversityMedicalCenterHR] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UniversityMedicalCenterHR] SET RECOVERY FULL 
GO
ALTER DATABASE [UniversityMedicalCenterHR] SET  MULTI_USER 
GO
ALTER DATABASE [UniversityMedicalCenterHR] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UniversityMedicalCenterHR] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UniversityMedicalCenterHR] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UniversityMedicalCenterHR] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UniversityMedicalCenterHR] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UniversityMedicalCenterHR] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'UniversityMedicalCenterHR', N'ON'
GO
ALTER DATABASE [UniversityMedicalCenterHR] SET QUERY_STORE = ON
GO
ALTER DATABASE [UniversityMedicalCenterHR] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [UniversityMedicalCenterHR]
GO
/****** Object:  Table [dbo].[Application]    Script Date: 10/5/2024 10:18:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Application](
	[ApplicationId] [int] IDENTITY(50001,1) NOT NULL,
	[CandidateId] [int] NOT NULL,
	[JobOpeningId] [int] NOT NULL,
	[ApplicationDate] [date] NOT NULL,
	[Status] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BackgroundCheck]    Script Date: 10/5/2024 10:18:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BackgroundCheck](
	[BackgroundCheckId] [int] IDENTITY(90001,1) NOT NULL,
	[CandidateId] [int] NOT NULL,
	[CheckType] [varchar](100) NOT NULL,
	[CheckDate] [date] NOT NULL,
	[Status] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BackgroundCheckId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Candidate]    Script Date: 10/5/2024 10:18:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidate](
	[CandidateId] [int] IDENTITY(30001,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
	[Profile] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CandidateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Documents]    Script Date: 10/5/2024 10:18:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documents](
	[DocumentId] [int] IDENTITY(40001,1) NOT NULL,
	[CandidateId] [int] NOT NULL,
	[DocumentType] [varchar](50) NOT NULL,
	[DocumentURL] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DocumentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DrugTest]    Script Date: 10/5/2024 10:18:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrugTest](
	[DrugTestId] [int] IDENTITY(100001,1) NOT NULL,
	[CandidateId] [int] NOT NULL,
	[TestType] [varchar](100) NOT NULL,
	[TestDate] [date] NOT NULL,
	[Result] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DrugTestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evaluation]    Script Date: 10/5/2024 10:18:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evaluation](
	[EvaluationId] [int] IDENTITY(110001,1) NOT NULL,
	[ApplicationId] [int] NOT NULL,
	[Notes] [text] NOT NULL,
	[Result] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EvaluationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Interview]    Script Date: 10/5/2024 10:18:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Interview](
	[InterviewId] [int] IDENTITY(70001,1) NOT NULL,
	[ApplicationId] [int] NOT NULL,
	[InterviewerId] [int] NOT NULL,
	[InterviewType] [varchar](50) NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[InterviewMedium] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InterviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Interviewers]    Script Date: 10/5/2024 10:18:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Interviewers](
	[InterviewerId] [int] IDENTITY(60001,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Department] [varchar](255) NOT NULL,
	[Title] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InterviewerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Job]    Script Date: 10/5/2024 10:18:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job](
	[JobId] [int] IDENTITY(10001,1) NOT NULL,
	[Position] [varchar](255) NOT NULL,
	[Title] [varchar](255) NOT NULL,
	[JobType] [varchar](100) NOT NULL,
	[JobMedium] [varchar](100) NOT NULL,
	[JobDescription] [varchar](max) NOT NULL,
	[JobCategory] [varchar](100) NOT NULL,
	[JobStartDate] [date] NOT NULL,
	[NumberOfPositions] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[JobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobOpenings]    Script Date: 10/5/2024 10:18:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobOpenings](
	[JobOpeningId] [int] IDENTITY(20001,1) NOT NULL,
	[JobId] [int] NOT NULL,
	[NumberOfPositions] [int] NOT NULL,
	[AvailablePositions] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[JobOpeningId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Onboarding]    Script Date: 10/5/2024 10:18:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Onboarding](
	[OnboardingId] [int] IDENTITY(130001,1) NOT NULL,
	[CandidateId] [int] NOT NULL,
	[JobOpeningId] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[Status] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OnboardingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reimbursement]    Script Date: 10/5/2024 10:18:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reimbursement](
	[ReimbursementId] [int] IDENTITY(120001,1) NOT NULL,
	[ApplicationId] [int] NOT NULL,
	[ExpenseType] [varchar](100) NOT NULL,
	[Amount] [decimal](10, 2) NOT NULL,
	[Status] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReimbursementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test]    Script Date: 10/5/2024 10:18:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test](
	[TestId] [int] IDENTITY(80001,1) NOT NULL,
	[ApplicationId] [int] NOT NULL,
	[TestType] [varchar](100) NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[Result] [varchar](50) NOT NULL,
	[ComplaintStatus] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[TestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Application_CandidateId]    Script Date: 10/5/2024 10:18:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Application_CandidateId] ON [dbo].[Application]
(
	[CandidateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BackgroundCheck_CandidateId]    Script Date: 10/5/2024 10:18:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_BackgroundCheck_CandidateId] ON [dbo].[BackgroundCheck]
(
	[CandidateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DrugTest_CandidateId]    Script Date: 10/5/2024 10:18:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_DrugTest_CandidateId] ON [dbo].[DrugTest]
(
	[CandidateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Interview_ApplicationId]    Script Date: 10/5/2024 10:18:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Interview_ApplicationId] ON [dbo].[Interview]
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_JobOpenings_JobId]    Script Date: 10/5/2024 10:18:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_JobOpenings_JobId] ON [dbo].[JobOpenings]
(
	[JobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Onboarding_CandidateId]    Script Date: 10/5/2024 10:18:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Onboarding_CandidateId] ON [dbo].[Onboarding]
(
	[CandidateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Reimbursement_ApplicationId]    Script Date: 10/5/2024 10:18:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Reimbursement_ApplicationId] ON [dbo].[Reimbursement]
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Test_ApplicationId]    Script Date: 10/5/2024 10:18:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Test_ApplicationId] ON [dbo].[Test]
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Application] ADD  CONSTRAINT [DF_Application_Status]  DEFAULT ('Pending') FOR [Status]
GO
ALTER TABLE [dbo].[Interview] ADD  CONSTRAINT [DF_Interview_InterviewMedium]  DEFAULT ('Online') FOR [InterviewMedium]
GO
ALTER TABLE [dbo].[JobOpenings] ADD  CONSTRAINT [DF_JobOpenings_AvailablePositions]  DEFAULT ((0)) FOR [AvailablePositions]
GO
ALTER TABLE [dbo].[Onboarding] ADD  CONSTRAINT [DF_Onboarding_Status]  DEFAULT ('Pending') FOR [Status]
GO
ALTER TABLE [dbo].[Reimbursement] ADD  CONSTRAINT [DF_Reimbursement_Status]  DEFAULT ('Pending') FOR [Status]
GO
ALTER TABLE [dbo].[Test] ADD  CONSTRAINT [DF_Test_Result]  DEFAULT ('Failed') FOR [Result]
GO
ALTER TABLE [dbo].[Test] ADD  DEFAULT ('None') FOR [ComplaintStatus]
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD FOREIGN KEY([CandidateId])
REFERENCES [dbo].[Candidate] ([CandidateId])
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD FOREIGN KEY([JobOpeningId])
REFERENCES [dbo].[JobOpenings] ([JobOpeningId])
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD  CONSTRAINT [FK_Application_Candidate] FOREIGN KEY([CandidateId])
REFERENCES [dbo].[Candidate] ([CandidateId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Application] CHECK CONSTRAINT [FK_Application_Candidate]
GO
ALTER TABLE [dbo].[BackgroundCheck]  WITH CHECK ADD FOREIGN KEY([CandidateId])
REFERENCES [dbo].[Candidate] ([CandidateId])
GO
ALTER TABLE [dbo].[BackgroundCheck]  WITH CHECK ADD  CONSTRAINT [FK_BackgroundCheck_Candidate] FOREIGN KEY([CandidateId])
REFERENCES [dbo].[Candidate] ([CandidateId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BackgroundCheck] CHECK CONSTRAINT [FK_BackgroundCheck_Candidate]
GO
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD FOREIGN KEY([CandidateId])
REFERENCES [dbo].[Candidate] ([CandidateId])
GO
ALTER TABLE [dbo].[DrugTest]  WITH CHECK ADD FOREIGN KEY([CandidateId])
REFERENCES [dbo].[Candidate] ([CandidateId])
GO
ALTER TABLE [dbo].[DrugTest]  WITH CHECK ADD  CONSTRAINT [FK_DrugTest_Candidate] FOREIGN KEY([CandidateId])
REFERENCES [dbo].[Candidate] ([CandidateId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DrugTest] CHECK CONSTRAINT [FK_DrugTest_Candidate]
GO
ALTER TABLE [dbo].[Evaluation]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Application] ([ApplicationId])
GO
ALTER TABLE [dbo].[Interview]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Application] ([ApplicationId])
GO
ALTER TABLE [dbo].[Interview]  WITH CHECK ADD FOREIGN KEY([InterviewerId])
REFERENCES [dbo].[Interviewers] ([InterviewerId])
GO
ALTER TABLE [dbo].[Interview]  WITH CHECK ADD  CONSTRAINT [FK_Interview_Application] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Application] ([ApplicationId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Interview] CHECK CONSTRAINT [FK_Interview_Application]
GO
ALTER TABLE [dbo].[JobOpenings]  WITH CHECK ADD FOREIGN KEY([JobId])
REFERENCES [dbo].[Job] ([JobId])
GO
ALTER TABLE [dbo].[Onboarding]  WITH CHECK ADD FOREIGN KEY([CandidateId])
REFERENCES [dbo].[Candidate] ([CandidateId])
GO
ALTER TABLE [dbo].[Onboarding]  WITH CHECK ADD FOREIGN KEY([JobOpeningId])
REFERENCES [dbo].[JobOpenings] ([JobOpeningId])
GO
ALTER TABLE [dbo].[Onboarding]  WITH CHECK ADD  CONSTRAINT [FK_Onboarding_Candidate] FOREIGN KEY([CandidateId])
REFERENCES [dbo].[Candidate] ([CandidateId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Onboarding] CHECK CONSTRAINT [FK_Onboarding_Candidate]
GO
ALTER TABLE [dbo].[Onboarding]  WITH CHECK ADD  CONSTRAINT [FK_Onboarding_JobOpening] FOREIGN KEY([JobOpeningId])
REFERENCES [dbo].[JobOpenings] ([JobOpeningId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Onboarding] CHECK CONSTRAINT [FK_Onboarding_JobOpening]
GO
ALTER TABLE [dbo].[Reimbursement]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Application] ([ApplicationId])
GO
ALTER TABLE [dbo].[Reimbursement]  WITH CHECK ADD  CONSTRAINT [FK_Reimbursement_Application] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Application] ([ApplicationId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reimbursement] CHECK CONSTRAINT [FK_Reimbursement_Application]
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Application] ([ApplicationId])
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD  CONSTRAINT [FK_Test_Application] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Application] ([ApplicationId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Test] CHECK CONSTRAINT [FK_Test_Application]
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD CHECK  (([Status]='Blacklisted' OR [Status]='On-Call' OR [Status]='Waiting' OR [Status]='Rejected' OR [Status]='Accepted' OR [Status]='Pending'))
GO
ALTER TABLE [dbo].[Evaluation]  WITH CHECK ADD CHECK  (([Result]='Negative' OR [Result]='Positive'))
GO
ALTER TABLE [dbo].[Interview]  WITH CHECK ADD CHECK  (([InterviewType]='Onsite' OR [InterviewType]='Online'))
GO
ALTER TABLE [dbo].[Job]  WITH CHECK ADD CHECK  (([JobCategory]='IT' OR [JobCategory]='Finance and Billing' OR [JobCategory]='Clinical Support' OR [JobCategory]='Healthcare'))
GO
ALTER TABLE [dbo].[Job]  WITH CHECK ADD CHECK  (([JobType]='Contract-based' OR [JobType]='Part-time' OR [JobType]='Full-time' OR [JobType]='Summer Internship'))
GO
ALTER TABLE [dbo].[Onboarding]  WITH CHECK ADD CHECK  (([Status]='Pending' OR [Status]='Failed' OR [Status]='Completed'))
GO
ALTER TABLE [dbo].[Reimbursement]  WITH CHECK ADD CHECK  (([Status]='Pending' OR [Status]='Denied' OR [Status]='Processed'))
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD CHECK  (([ComplaintStatus]='Invalid' OR [ComplaintStatus]='Valid' OR [ComplaintStatus]='Pending' OR [ComplaintStatus]='None'))
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD CHECK  (([Result]='Pending Re-test' OR [Result]='Failed' OR [Result]='Passed'))
GO
USE [master]
GO
ALTER DATABASE [UniversityMedicalCenterHR] SET  READ_WRITE 
GO

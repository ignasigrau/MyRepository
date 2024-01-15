/****** Object:  Table [dbo].[DIM_AGE] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_AGE](
	[pk_age] [int] NOT NULL,
	[code] [nvarchar](15) NULL,
	[age] [nvarchar](60) NULL,
 CONSTRAINT [PK_DIM_AGE] PRIMARY KEY CLUSTERED 
(
	[pk_age] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_COUNTRY] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_COUNTRY](
	[pk_country] [int] NOT NULL,
	[code] [nvarchar](8) NULL,
	[country] [nvarchar](50) NULL,
	[region] [nvarchar](75) NULL,
 CONSTRAINT [PK_DIM_COUNTRY] PRIMARY KEY CLUSTERED 
(
	[pk_country] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_N_CHILD] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_N_CHILD](
	[pk_n_child] [int] NOT NULL,
	[code] [nvarchar](25) NULL,
	[n_child] [nvarchar](50) NULL,
 CONSTRAINT [PK_DIM_N_CHILD] PRIMARY KEY CLUSTERED 
(
	[pk_n_child] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_SECTOR] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_SECTOR](
	[pk_sector] [int] NOT NULL,
	[code] [nvarchar](25) NULL,
	[sector] [nvarchar](550) NULL,
 CONSTRAINT [PK_DIM_SECTOR] PRIMARY KEY CLUSTERED 
(
	[pk_sector] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_SEX] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_SEX](
	[pk_sex] [int] NOT NULL,
	[code] [nvarchar](10) NULL,
	[sex] [nvarchar](60) NULL,
 CONSTRAINT [PK_DIM_SEX] PRIMARY KEY CLUSTERED 
(
	[pk_sex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_WORKSTATUS] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_WORKSTATUS](
	[pk_workstatus] [int] NOT NULL,
	[code] [nvarchar](25) NULL,
	[workstatus] [nvarchar](250) NULL,
 CONSTRAINT [PK_DIM_WORKSTATUS] PRIMARY KEY CLUSTERED 
(
	[pk_workstatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_WORKTIME] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_WORKTIME](
	[pk_worktime] [int] NOT NULL,
	[code] [nvarchar](25) NULL,
	[worktime] [nvarchar](250) NULL,
 CONSTRAINT [PK_DIM_WORKTIME] PRIMARY KEY CLUSTERED 
(
	[pk_worktime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACT_HOURS_WORKED] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACT_HOURS_WORKED](
	[pk_id] [int] NOT NULL,
	[year] [int] NULL,
	[unit] [nvarchar](25) NULL,
	[fk_country] [int] NULL,
	[fk_age] [int] NULL,
	[fk_sex] [int] NULL,
	[fk_sector] [int] NULL,
	[fk_worktime] [int] NULL,
	[fk_workstatus] [int] NULL,
	[OBS_VALUE] [numeric](12, 2) NULL,
	[OBS_VALUE_USA] [numeric](12, 2) NULL,
 CONSTRAINT [PK_FACT_HOURS_WORKED] PRIMARY KEY CLUSTERED 
(
	[pk_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACT_PCT_EMPLOYEES_HOME] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACT_PCT_EMPLOYEES_HOME](
	[pk_id] [int] NOT NULL,
	[year] [int] NULL,
	[unit] [nvarchar](25) NULL,
	[fk_country] [int] NULL,
	[fk_age] [int] NULL,
	[fk_sex] [int] NULL,
	[fk_n_child] [int] NULL,
	[fk_age_child] [int] NULL,
	[OBS_VALUE] [numeric](12, 2) NULL,
 CONSTRAINT [PK_FACT_PCT_EMPLOYEES_HOME] PRIMARY KEY CLUSTERED 
(
	[pk_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STG_COUNTRY] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STG_COUNTRY](
	[code] [nvarchar](8) NULL,
	[name] [nvarchar](50) NULL,
	[region] [nvarchar](75) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STG_ESTAT_AGE] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STG_ESTAT_AGE](
	[code] [nvarchar](15) NOT NULL,
	[description] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STG_ESTAT_N_CHILD] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STG_ESTAT_N_CHILD](
	[code] [nvarchar](4) NOT NULL,
	[description] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STG_ESTAT_NACE_R2] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STG_ESTAT_NACE_R2](
	[code] [nvarchar](25) NOT NULL,
	[description] [nvarchar](1000) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STG_ESTAT_SEX] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STG_ESTAT_SEX](
	[code] [nvarchar](4) NOT NULL,
	[description] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STG_ESTAT_WORKTIME] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STG_ESTAT_WORKTIME](
	[code] [nvarchar](8) NOT NULL,
	[description] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STG_ESTAT_WSTATUS] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STG_ESTAT_WSTATUS](
	[code] [nvarchar](16) NOT NULL,
	[description] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STG_HOURS_WORKED] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STG_HOURS_WORKED](
	[dataflow] [nvarchar](25) NOT NULL,
	[last_update] [nvarchar](25) NOT NULL,
	[freq] [char](1) NOT NULL,
	[nace_r2] [char](1) NOT NULL,
	[wstatus] [nvarchar](8) NOT NULL,
	[worktime] [nvarchar](2) NOT NULL,
	[age] [nvarchar](8) NOT NULL,
	[sex] [char](1) NOT NULL,
	[unit] [nvarchar](2) NOT NULL,
	[geo] [nvarchar](9) NOT NULL,
	[TIME_PERIOD] [int] NOT NULL,
	[OBS_VALUE] [numeric](12, 2) NULL,
	[OBS_FLAG] [nvarchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STG_HOURS_WORKED_USA] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STG_HOURS_WORKED_USA](
	[year] [int] NOT NULL,
	[period] [nvarchar](3) NOT NULL,
	[label] [nvarchar](8) NOT NULL,
	[observation_value] [numeric](12, 2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STG_PCT_EMPLOYEES_HOME] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STG_PCT_EMPLOYEES_HOME](
	[dataflow] [nvarchar](25) NOT NULL,
	[last_update] [datetime] NOT NULL,
	[freq] [char](1) NOT NULL,
	[sex] [char](1) NOT NULL,
	[age] [nvarchar](8) NOT NULL,
	[n_child] [nvarchar](3) NOT NULL,
	[age_child] [nvarchar](8) NOT NULL,
	[unit] [nvarchar](2) NOT NULL,
	[geo] [nvarchar](9) NOT NULL,
	[TIME_PERIOD] [int] NOT NULL,
	[OBS_VALUE] [numeric](12, 2) NULL,
	[OBS_FLAG] [nvarchar](4) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FACT_HOURS_WORKED]  WITH CHECK ADD FOREIGN KEY([fk_age])
REFERENCES [dbo].[DIM_AGE] ([pk_age])
GO
ALTER TABLE [dbo].[FACT_HOURS_WORKED]  WITH CHECK ADD FOREIGN KEY([fk_country])
REFERENCES [dbo].[DIM_COUNTRY] ([pk_country])
GO
ALTER TABLE [dbo].[FACT_HOURS_WORKED]  WITH CHECK ADD FOREIGN KEY([fk_sex])
REFERENCES [dbo].[DIM_SEX] ([pk_sex])
GO
ALTER TABLE [dbo].[FACT_HOURS_WORKED]  WITH CHECK ADD FOREIGN KEY([fk_sector])
REFERENCES [dbo].[DIM_SECTOR] ([pk_sector])
GO
ALTER TABLE [dbo].[FACT_HOURS_WORKED]  WITH CHECK ADD FOREIGN KEY([fk_worktime])
REFERENCES [dbo].[DIM_WORKTIME] ([pk_worktime])
GO
ALTER TABLE [dbo].[FACT_HOURS_WORKED]  WITH CHECK ADD FOREIGN KEY([fk_workstatus])
REFERENCES [dbo].[DIM_WORKSTATUS] ([pk_workstatus])
GO
ALTER TABLE [dbo].[FACT_PCT_EMPLOYEES_HOME]  WITH CHECK ADD FOREIGN KEY([fk_age])
REFERENCES [dbo].[DIM_AGE] ([pk_age])
GO
ALTER TABLE [dbo].[FACT_PCT_EMPLOYEES_HOME]  WITH CHECK ADD FOREIGN KEY([fk_age_child])
REFERENCES [dbo].[DIM_AGE] ([pk_age])
GO
ALTER TABLE [dbo].[FACT_PCT_EMPLOYEES_HOME]  WITH CHECK ADD FOREIGN KEY([fk_country])
REFERENCES [dbo].[DIM_COUNTRY] ([pk_country])
GO
ALTER TABLE [dbo].[FACT_PCT_EMPLOYEES_HOME]  WITH CHECK ADD FOREIGN KEY([fk_n_child])
REFERENCES [dbo].[DIM_N_CHILD] ([pk_n_child])
GO
ALTER TABLE [dbo].[FACT_PCT_EMPLOYEES_HOME]  WITH CHECK ADD FOREIGN KEY([fk_sex])
REFERENCES [dbo].[DIM_SEX] ([pk_sex])
GO

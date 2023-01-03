USE [xyz_dwh]
GO

/****** Object:  Table [departments]    Script Date: 1/12/2022 1:06:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [departments](
	[department_id] [int] NOT NULL,
	[department_name] [nvarchar](45) NOT NULL,
 CONSTRAINT [PK_departments_department_id] PRIMARY KEY CLUSTERED 
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

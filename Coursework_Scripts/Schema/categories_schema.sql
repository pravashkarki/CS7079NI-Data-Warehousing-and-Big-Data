USE [xyz_dwh]
GO

/****** Object:  Table [categories]    ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [categories](
	[category_id] [int] NOT NULL,
	[category_department_id] [int] NOT NULL,
	[category_name] [nvarchar](45) NOT NULL,
 CONSTRAINT [PK_categories_category_id] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


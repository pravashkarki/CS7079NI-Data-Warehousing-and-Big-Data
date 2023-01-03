USE [xyz_dwh]
GO

/****** Object:  Table [customers]    Script Date: 1/12/2022 1:05:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [customers](
	[customer_id] [int] NOT NULL,
	[customer_fname] [nvarchar](45) NOT NULL,
	[customer_lname] [nvarchar](45) NOT NULL,
	[customer_email] [nvarchar](45) NOT NULL,
	[customer_password] [nvarchar](45) NOT NULL,
	[customer_street] [nvarchar](255) NOT NULL,
	[customer_city] [nvarchar](45) NOT NULL,
	[customer_state] [nvarchar](45) NOT NULL,
	[customer_zipcode] [nvarchar](45) NOT NULL,
 CONSTRAINT [PK_customers_customer_id] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


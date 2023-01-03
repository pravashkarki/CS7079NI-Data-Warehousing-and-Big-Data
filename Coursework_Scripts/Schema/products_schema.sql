USE [xyz_dwh]
GO

/****** Object:  Table [roducts]    Script Date: 1/22/2022 1:10:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [products](
	[product_id] [int] NOT NULL,
	[product_category_id] [int] NOT NULL,
	[product_name] [nvarchar](45) NOT NULL,
	[product_description] [nvarchar](255) NOT NULL,
	[product_price] [real] NOT NULL,
	[product_image] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_products_product_id] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

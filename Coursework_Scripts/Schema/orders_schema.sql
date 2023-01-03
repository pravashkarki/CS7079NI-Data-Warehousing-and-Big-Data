USE [xyz_dwh]
GO

/****** Object:  Table [orders]    Script Date: 1/12/2022 1:08:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [orders](
	[order_id] [int] NOT NULL,
	[order_date] [datetime2](0) NOT NULL,
	[order_customer_id] [int] NOT NULL,
	[order_status] [nvarchar](45) NOT NULL,
 CONSTRAINT [PK_orders_order_id] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE xyz_dwh
GO

/****** Object:  Table [order_items]    Script Date: 1/12/2022 1:07:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [order_items](
	[order_item_id] [int] NOT NULL,
	[order_item_order_id] [int] NOT NULL,
	[order_item_product_id] [int] NOT NULL,
	[order_item_quantity] [smallint] NOT NULL,
	[order_item_subtotal] [real] NOT NULL,
	[order_item_product_price] [real] NOT NULL,
 CONSTRAINT [PK_order_items_order_item_id] PRIMARY KEY CLUSTERED 
(
	[order_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

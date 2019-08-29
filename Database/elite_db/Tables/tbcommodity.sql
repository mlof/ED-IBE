CREATE TABLE [elite_db].[tbcommodity] (
    [id]                   INT           NOT NULL,
    [commodity]            NVARCHAR (80) NOT NULL,
    [loccommodity]         NVARCHAR (80) DEFAULT (NULL) NULL,
    [category_id]          INT           DEFAULT (NULL) NULL,
    [average_price]        INT           DEFAULT ((-1)) NULL,
    [pwl_demand_buy_low]   INT           DEFAULT ((-1)) NULL,
    [pwl_demand_buy_high]  INT           DEFAULT ((-1)) NULL,
    [pwl_supply_buy_low]   INT           DEFAULT ((-1)) NULL,
    [pwl_supply_buy_high]  INT           DEFAULT ((-1)) NULL,
    [pwl_demand_sell_low]  INT           DEFAULT ((-1)) NULL,
    [pwl_demand_sell_high] INT           DEFAULT ((-1)) NULL,
    [pwl_supply_sell_low]  INT           DEFAULT ((-1)) NULL,
    [pwl_supply_sell_high] INT           DEFAULT ((-1)) NULL,
    [is_rare]              SMALLINT      DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_tbcommodity_id] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [tbcommodity$fk_tbCommodities_tbCategoriy1] FOREIGN KEY ([category_id]) REFERENCES [elite_db].[tbcategory] ([id])
);


GO
CREATE NONCLUSTERED INDEX [fk_tbCommodities_tbCategoriy1_idx]
    ON [elite_db].[tbcommodity]([category_id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'elite_db.tbcommodity', @level0type = N'SCHEMA', @level0name = N'elite_db', @level1type = N'TABLE', @level1name = N'tbcommodity';


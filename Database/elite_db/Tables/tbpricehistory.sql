CREATE TABLE [elite_db].[tbpricehistory] (
    [id]           BIGINT        IDENTITY (1, 1) NOT NULL,
    [station_id]   INT           NOT NULL,
    [commodity_id] INT           NOT NULL,
    [Sell]         INT           DEFAULT (NULL) NULL,
    [Buy]          INT           DEFAULT (NULL) NULL,
    [Demand]       INT           DEFAULT (NULL) NULL,
    [DemandLevel]  INT           DEFAULT (NULL) NULL,
    [Supply]       INT           DEFAULT (NULL) NULL,
    [SupplyLevel]  INT           DEFAULT (NULL) NULL,
    [Sources_id]   INT           NOT NULL,
    [timestamp]    DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_tbpricehistory_id] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [tbpricehistory$fk_tbPriceHistory_tbEconomyLevel1] FOREIGN KEY ([DemandLevel]) REFERENCES [elite_db].[tbeconomylevel] ([id]),
    CONSTRAINT [tbpricehistory$fk_tbPriceHistory_tbEconomyLevel2] FOREIGN KEY ([SupplyLevel]) REFERENCES [elite_db].[tbeconomylevel] ([id]),
    CONSTRAINT [tbpricehistory$fk_tbPriceHistory_tbSources1] FOREIGN KEY ([Sources_id]) REFERENCES [elite_db].[tbsource] ([id]),
    CONSTRAINT [tbpricehistory$fk_tbStations_has_tbCommodities1_tbCommodities1] FOREIGN KEY ([commodity_id]) REFERENCES [elite_db].[tbcommodity] ([id]),
    CONSTRAINT [tbpricehistory$fk_tbStations_has_tbCommodities1_tbStations1] FOREIGN KEY ([station_id]) REFERENCES [elite_db].[tbstations] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [fk_tbPriceHistory_tbEconomyLevel1_idx]
    ON [elite_db].[tbpricehistory]([DemandLevel] ASC);


GO
CREATE NONCLUSTERED INDEX [fk_tbPriceHistory_tbEconomyLevel2_idx]
    ON [elite_db].[tbpricehistory]([SupplyLevel] ASC);


GO
CREATE NONCLUSTERED INDEX [fk_tbPriceHistory_tbSources1_idx]
    ON [elite_db].[tbpricehistory]([Sources_id] ASC);


GO
CREATE NONCLUSTERED INDEX [fk_tbStations_has_tbCommodities1_tbCommodities1_idx]
    ON [elite_db].[tbpricehistory]([commodity_id] ASC);


GO
CREATE NONCLUSTERED INDEX [fk_tbStations_has_tbCommodities1_tbStations1_idx]
    ON [elite_db].[tbpricehistory]([station_id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'elite_db.tbpricehistory', @level0type = N'SCHEMA', @level0name = N'elite_db', @level1type = N'TABLE', @level1name = N'tbpricehistory';


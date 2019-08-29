CREATE TABLE [elite_db].[tbcommodityclassification] (
    [id]           BIGINT NOT NULL,
    [station_id]   INT    NOT NULL,
    [commodity_id] INT    NOT NULL,
    CONSTRAINT [PK_tbcommodityclassification_id] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [tbcommodityclassification$fk_tbCommodityClassification_tbCommodity1] FOREIGN KEY ([commodity_id]) REFERENCES [elite_db].[tbcommodity] ([id]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [tbcommodityclassification$fk_tbCommodityClassification_tbStations1] FOREIGN KEY ([station_id]) REFERENCES [elite_db].[tbstations] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [fk_tbCommodityClassification_tbCommodity1_idx]
    ON [elite_db].[tbcommodityclassification]([commodity_id] ASC);


GO
CREATE NONCLUSTERED INDEX [fk_tbCommodityClassification_tbStations1_idx]
    ON [elite_db].[tbcommodityclassification]([station_id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'elite_db.tbcommodityclassification', @level0type = N'SCHEMA', @level0name = N'elite_db', @level1type = N'TABLE', @level1name = N'tbcommodityclassification';


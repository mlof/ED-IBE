CREATE TABLE [elite_db].[tbcommoditylocalization] (
    [commodity_id] INT           NOT NULL,
    [language_id]  INT           NOT NULL,
    [locname]      NVARCHAR (80) NOT NULL,
    CONSTRAINT [PK_tbcommoditylocalization_commodity_id] PRIMARY KEY CLUSTERED ([commodity_id] ASC, [language_id] ASC),
    CONSTRAINT [tbcommoditylocalization$fk_tbLocalization_tbCommodities1] FOREIGN KEY ([commodity_id]) REFERENCES [elite_db].[tbcommodity] ([id]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [tbcommoditylocalization$fk_tbLocalization_tbLanguage1] FOREIGN KEY ([language_id]) REFERENCES [elite_db].[tblanguage] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [fk_tbLocalization_tbLanguage1_idx]
    ON [elite_db].[tbcommoditylocalization]([language_id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'elite_db.tbcommoditylocalization', @level0type = N'SCHEMA', @level0name = N'elite_db', @level1type = N'TABLE', @level1name = N'tbcommoditylocalization';


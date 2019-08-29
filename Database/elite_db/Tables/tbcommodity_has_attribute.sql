CREATE TABLE [elite_db].[tbcommodity_has_attribute] (
    [tbAttribute_id]               INT    NOT NULL,
    [tbCommodityClassification_id] BIGINT NOT NULL,
    CONSTRAINT [PK_tbcommodity_has_attribute_tbAttribute_id] PRIMARY KEY CLUSTERED ([tbAttribute_id] ASC, [tbCommodityClassification_id] ASC),
    CONSTRAINT [tbcommodity_has_attribute$fk_tbCommodity_has_Attribute_tbCommodityClassification1] FOREIGN KEY ([tbCommodityClassification_id]) REFERENCES [elite_db].[tbcommodityclassification] ([id]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [tbcommodity_has_attribute$fk_tbCommodityAttribute_has_tbStationCommodity_tbCommodityAtt1] FOREIGN KEY ([tbAttribute_id]) REFERENCES [elite_db].[tbattribute] ([id])
);


GO
CREATE NONCLUSTERED INDEX [fk_tbCommodity_has_Attribute_tbCommodityClassification1_idx]
    ON [elite_db].[tbcommodity_has_attribute]([tbCommodityClassification_id] ASC);


GO
CREATE NONCLUSTERED INDEX [fk_tbCommodityAttribute_has_tbStationCommodity_tbCommodityA_idx]
    ON [elite_db].[tbcommodity_has_attribute]([tbAttribute_id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'elite_db.tbcommodity_has_attribute', @level0type = N'SCHEMA', @level0name = N'elite_db', @level1type = N'TABLE', @level1name = N'tbcommodity_has_attribute';


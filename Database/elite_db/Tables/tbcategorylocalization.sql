CREATE TABLE [elite_db].[tbcategorylocalization] (
    [category_id] INT           NOT NULL,
    [language_id] INT           NOT NULL,
    [locname]     NVARCHAR (80) NOT NULL,
    CONSTRAINT [PK_tbcategorylocalization_category_id] PRIMARY KEY CLUSTERED ([category_id] ASC, [language_id] ASC),
    CONSTRAINT [tbcategorylocalization$fk_tbCategoryLocalization_tbCategory1] FOREIGN KEY ([category_id]) REFERENCES [elite_db].[tbcategory] ([id]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [tbcategorylocalization$fk_tbLocalization_tbLanguage10] FOREIGN KEY ([language_id]) REFERENCES [elite_db].[tblanguage] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [fk_tbLocalization_tbLanguage1_idx]
    ON [elite_db].[tbcategorylocalization]([language_id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'elite_db.tbcategorylocalization', @level0type = N'SCHEMA', @level0name = N'elite_db', @level1type = N'TABLE', @level1name = N'tbcategorylocalization';


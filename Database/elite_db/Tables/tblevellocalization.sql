CREATE TABLE [elite_db].[tblevellocalization] (
    [economylevel_id] INT           NOT NULL,
    [language_id]     INT           NOT NULL,
    [locname]         NVARCHAR (80) NOT NULL,
    CONSTRAINT [PK_tblevellocalization_economylevel_id] PRIMARY KEY CLUSTERED ([economylevel_id] ASC, [language_id] ASC),
    CONSTRAINT [tblevellocalization$fk_tbEconomyLevel_has_tbLanguage_tbEconomyLevel1] FOREIGN KEY ([economylevel_id]) REFERENCES [elite_db].[tbeconomylevel] ([id]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [tblevellocalization$fk_tbEconomyLevel_has_tbLanguage_tbLanguage1] FOREIGN KEY ([language_id]) REFERENCES [elite_db].[tblanguage] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [fk_tbEconomyLevel_has_tbLanguage_tbEconomyLevel1_idx]
    ON [elite_db].[tblevellocalization]([economylevel_id] ASC);


GO
CREATE NONCLUSTERED INDEX [fk_tbEconomyLevel_has_tbLanguage_tbLanguage1_idx]
    ON [elite_db].[tblevellocalization]([language_id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'elite_db.tblevellocalization', @level0type = N'SCHEMA', @level0name = N'elite_db', @level1type = N'TABLE', @level1name = N'tblevellocalization';


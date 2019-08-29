CREATE TABLE [elite_db].[tbinitvalue] (
    [InitGroup] NVARCHAR (80)  NOT NULL,
    [InitKey]   NVARCHAR (80)  NOT NULL,
    [InitValue] NVARCHAR (MAX) DEFAULT (NULL) NULL,
    CONSTRAINT [PK_tbinitvalue_InitGroup] PRIMARY KEY CLUSTERED ([InitGroup] ASC, [InitKey] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'elite_db.tbinitvalue', @level0type = N'SCHEMA', @level0name = N'elite_db', @level1type = N'TABLE', @level1name = N'tbinitvalue';


CREATE TABLE [elite_db].[tbcommoditybase] (
    [id]       INT           NOT NULL,
    [symbol]   NVARCHAR (80) DEFAULT (NULL) NULL,
    [category] NVARCHAR (80) DEFAULT (NULL) NULL,
    [name]     NVARCHAR (80) DEFAULT (NULL) NULL,
    CONSTRAINT [PK_tbcommoditybase_id] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'elite_db.tbcommoditybase', @level0type = N'SCHEMA', @level0name = N'elite_db', @level1type = N'TABLE', @level1name = N'tbcommoditybase';


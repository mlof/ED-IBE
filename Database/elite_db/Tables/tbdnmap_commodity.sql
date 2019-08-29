CREATE TABLE [elite_db].[tbdnmap_commodity] (
    [CompanionName]     NVARCHAR (255) NOT NULL,
    [CompanionAddition] NVARCHAR (255) NOT NULL,
    [GameName]          NVARCHAR (255) NOT NULL,
    [GameAddition]      NVARCHAR (255) NOT NULL,
    [ts]                DATETIME       DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_tbdnmap_commodity_CompanionName] PRIMARY KEY CLUSTERED ([CompanionName] ASC, [CompanionAddition] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'elite_db.tbdnmap_commodity', @level0type = N'SCHEMA', @level0name = N'elite_db', @level1type = N'TABLE', @level1name = N'tbdnmap_commodity';


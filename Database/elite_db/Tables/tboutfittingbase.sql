CREATE TABLE [elite_db].[tboutfittingbase] (
    [id]          INT           NOT NULL,
    [symbol]      NVARCHAR (80) NOT NULL,
    [category]    NVARCHAR (80) NOT NULL,
    [name]        NVARCHAR (80) NOT NULL,
    [mount]       NVARCHAR (80) DEFAULT (NULL) NULL,
    [guidance]    NVARCHAR (80) DEFAULT (NULL) NULL,
    [ship]        NVARCHAR (80) DEFAULT (NULL) NULL,
    [class]       NCHAR (1)     NOT NULL,
    [rating]      NCHAR (1)     NOT NULL,
    [entitlement] NVARCHAR (80) DEFAULT (NULL) NULL,
    CONSTRAINT [PK_tboutfittingbase_id] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'elite_db.tboutfittingbase', @level0type = N'SCHEMA', @level0name = N'elite_db', @level1type = N'TABLE', @level1name = N'tboutfittingbase';


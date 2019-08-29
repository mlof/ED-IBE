CREATE TABLE [elite_db].[tbattribute] (
    [id]        INT           NOT NULL,
    [Attribute] NVARCHAR (80) DEFAULT (NULL) NULL,
    CONSTRAINT [PK_tbattribute_id] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'elite_db.tbattribute', @level0type = N'SCHEMA', @level0name = N'elite_db', @level1type = N'TABLE', @level1name = N'tbattribute';


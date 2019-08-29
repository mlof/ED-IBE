CREATE TABLE [elite_db].[tbeconomylevel] (
    [id]       INT           NOT NULL,
    [level]    NVARCHAR (80) NOT NULL,
    [loclevel] NVARCHAR (80) DEFAULT (NULL) NULL,
    CONSTRAINT [PK_tbeconomylevel_id] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'elite_db.tbeconomylevel', @level0type = N'SCHEMA', @level0name = N'elite_db', @level1type = N'TABLE', @level1name = N'tbeconomylevel';


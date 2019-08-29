CREATE TABLE [elite_db].[tbsecurity] (
    [id]       INT           NOT NULL,
    [security] NVARCHAR (80) NOT NULL,
    CONSTRAINT [PK_tbsecurity_id] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'elite_db.tbsecurity', @level0type = N'SCHEMA', @level0name = N'elite_db', @level1type = N'TABLE', @level1name = N'tbsecurity';


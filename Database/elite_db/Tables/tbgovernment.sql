CREATE TABLE [elite_db].[tbgovernment] (
    [id]         INT           NOT NULL,
    [government] NVARCHAR (80) NOT NULL,
    CONSTRAINT [PK_tbgovernment_id] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'elite_db.tbgovernment', @level0type = N'SCHEMA', @level0name = N'elite_db', @level1type = N'TABLE', @level1name = N'tbgovernment';


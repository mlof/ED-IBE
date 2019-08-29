CREATE TABLE [elite_db].[tbeddnrelays] (
    [Address] NVARCHAR (255) NOT NULL,
    CONSTRAINT [PK_tbeddnrelays_Address] PRIMARY KEY CLUSTERED ([Address] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'elite_db.tbeddnrelays', @level0type = N'SCHEMA', @level0name = N'elite_db', @level1type = N'TABLE', @level1name = N'tbeddnrelays';


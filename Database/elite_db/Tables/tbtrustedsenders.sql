CREATE TABLE [elite_db].[tbtrustedsenders] (
    [Name] NVARCHAR (255) NOT NULL,
    CONSTRAINT [PK_tbtrustedsenders_Name] PRIMARY KEY CLUSTERED ([Name] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'elite_db.tbtrustedsenders', @level0type = N'SCHEMA', @level0name = N'elite_db', @level1type = N'TABLE', @level1name = N'tbtrustedsenders';


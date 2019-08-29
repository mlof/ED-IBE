CREATE TABLE [elite_db].[tbcategory] (
    [id]          INT           NOT NULL,
    [category]    NVARCHAR (80) NOT NULL,
    [loccategory] NVARCHAR (80) NOT NULL,
    CONSTRAINT [PK_tbcategory_id] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'elite_db.tbcategory', @level0type = N'SCHEMA', @level0name = N'elite_db', @level1type = N'TABLE', @level1name = N'tbcategory';


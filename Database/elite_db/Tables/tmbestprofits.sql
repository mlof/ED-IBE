CREATE TABLE [elite_db].[tmbestprofits] (
    [Station_Id_From] INT NOT NULL,
    [Station_Id_To]   INT NOT NULL,
    [Max_Profit]      INT DEFAULT (NULL) NULL,
    CONSTRAINT [PK_tmbestprofits_Station_Id_From] PRIMARY KEY CLUSTERED ([Station_Id_From] ASC, [Station_Id_To] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'elite_db.tmbestprofits', @level0type = N'SCHEMA', @level0name = N'elite_db', @level1type = N'TABLE', @level1name = N'tmbestprofits';


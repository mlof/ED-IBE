CREATE TABLE [elite_db].[tmneighbourstations] (
    [System_ID_From]   INT        DEFAULT (NULL) NULL,
    [Station_ID_From]  INT        NOT NULL,
    [Distance_From]    FLOAT (53) DEFAULT (NULL) NULL,
    [System_ID_To]     INT        DEFAULT (NULL) NULL,
    [Station_ID_To]    INT        NOT NULL,
    [Distance_To]      FLOAT (53) DEFAULT (NULL) NULL,
    [Distance_Between] FLOAT (53) DEFAULT (NULL) NULL,
    CONSTRAINT [PK_tmneighbourstations_Station_ID_From] PRIMARY KEY CLUSTERED ([Station_ID_From] ASC, [Station_ID_To] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'elite_db.tmneighbourstations', @level0type = N'SCHEMA', @level0name = N'elite_db', @level1type = N'TABLE', @level1name = N'tmneighbourstations';


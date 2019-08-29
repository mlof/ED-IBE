CREATE TABLE [elite_db].[tmfilteredstations] (
    [System_id]  INT        NOT NULL,
    [Station_id] INT        NOT NULL,
    [Distance]   FLOAT (53) DEFAULT (NULL) NULL,
    [x]          FLOAT (53) DEFAULT (NULL) NULL,
    [y]          FLOAT (53) DEFAULT (NULL) NULL,
    [z]          FLOAT (53) DEFAULT (NULL) NULL,
    CONSTRAINT [PK_tmfilteredstations_System_id] PRIMARY KEY CLUSTERED ([System_id] ASC, [Station_id] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'elite_db.tmfilteredstations', @level0type = N'SCHEMA', @level0name = N'elite_db', @level1type = N'TABLE', @level1name = N'tmfilteredstations';


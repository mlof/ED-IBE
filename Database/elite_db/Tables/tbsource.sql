﻿CREATE TABLE [elite_db].[tbsource] (
    [id]     INT           NOT NULL,
    [source] NVARCHAR (80) DEFAULT (NULL) NULL,
    CONSTRAINT [PK_tbsource_id] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'elite_db.tbsource', @level0type = N'SCHEMA', @level0name = N'elite_db', @level1type = N'TABLE', @level1name = N'tbsource';


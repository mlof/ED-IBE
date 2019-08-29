CREATE TABLE [elite_db].[tbvisitedsystems] (
    [system_id] INT           NOT NULL,
    [time]      DATETIME2 (0) NOT NULL,
    [visitType] SMALLINT      DEFAULT ((2)) NOT NULL,
    CONSTRAINT [PK_tbvisitedsystems_system_id] PRIMARY KEY CLUSTERED ([system_id] ASC),
    CONSTRAINT [tbvisitedsystems$fk_tbSystems_tbVisitedSystems] FOREIGN KEY ([system_id]) REFERENCES [elite_db].[tbsystems] ([id]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [tbvisitedsystems$fk_tbVisitedSystems_tbVisitType1] FOREIGN KEY ([visitType]) REFERENCES [elite_db].[tbvisittype] ([id])
);


GO
CREATE NONCLUSTERED INDEX [fk_tbVisitedSystems_tbVisitType1_idx]
    ON [elite_db].[tbvisitedsystems]([visitType] ASC);


GO
CREATE NONCLUSTERED INDEX [Idx_tbVisitedSystems_time]
    ON [elite_db].[tbvisitedsystems]([time] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'elite_db.tbvisitedsystems', @level0type = N'SCHEMA', @level0name = N'elite_db', @level1type = N'TABLE', @level1name = N'tbvisitedsystems';


CREATE TABLE [elite_db].[tbvisitedstations] (
    [station_id] INT           NOT NULL,
    [time]       DATETIME2 (0) NOT NULL,
    [visitType]  SMALLINT      DEFAULT ((2)) NOT NULL,
    CONSTRAINT [PK_tbvisitedstations_station_id] PRIMARY KEY CLUSTERED ([station_id] ASC),
    CONSTRAINT [tbvisitedstations$fk_tbStations_tbVisitedStations] FOREIGN KEY ([station_id]) REFERENCES [elite_db].[tbstations] ([id]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [tbvisitedstations$fk_tbVisitedStations_tbVisitType1] FOREIGN KEY ([visitType]) REFERENCES [elite_db].[tbvisittype] ([id])
);


GO
CREATE NONCLUSTERED INDEX [fk_tbVisitedStations_tbVisitType1_idx]
    ON [elite_db].[tbvisitedstations]([visitType] ASC);


GO
CREATE NONCLUSTERED INDEX [Idx_tbVisitedStations_time]
    ON [elite_db].[tbvisitedstations]([time] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'elite_db.tbvisitedstations', @level0type = N'SCHEMA', @level0name = N'elite_db', @level1type = N'TABLE', @level1name = N'tbvisitedstations';


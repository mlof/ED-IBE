CREATE TABLE [elite_db].[tbstationeconomy] (
    [station_id] INT NOT NULL,
    [economy_id] INT NOT NULL,
    CONSTRAINT [PK_tbstationeconomy_station_id] PRIMARY KEY CLUSTERED ([station_id] ASC, [economy_id] ASC),
    CONSTRAINT [tbstationeconomy$fk_tbStations_has_tbEconomy_tbEconomy1] FOREIGN KEY ([economy_id]) REFERENCES [elite_db].[tbeconomy] ([id]),
    CONSTRAINT [tbstationeconomy$fk_tbStations_has_tbEconomy_tbStations1] FOREIGN KEY ([station_id]) REFERENCES [elite_db].[tbstations] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [fk_tbStations_has_tbEconomy_tbEconomy1_idx]
    ON [elite_db].[tbstationeconomy]([economy_id] ASC);


GO
CREATE NONCLUSTERED INDEX [fk_tbStations_has_tbEconomy_tbStations1_idx]
    ON [elite_db].[tbstationeconomy]([station_id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'elite_db.tbstationeconomy', @level0type = N'SCHEMA', @level0name = N'elite_db', @level1type = N'TABLE', @level1name = N'tbstationeconomy';


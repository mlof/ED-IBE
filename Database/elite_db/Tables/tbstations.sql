CREATE TABLE [elite_db].[tbstations] (
    [id]                    INT           NOT NULL,
    [stationname]           NVARCHAR (80) NOT NULL,
    [system_id]             INT           NOT NULL,
    [max_landing_pad_size]  NVARCHAR (80) DEFAULT (NULL) NULL,
    [distance_to_star]      INT           DEFAULT (NULL) NULL,
    [faction]               NVARCHAR (80) DEFAULT (NULL) NULL,
    [government_id]         INT           DEFAULT (NULL) NULL,
    [allegiance_id]         INT           DEFAULT (NULL) NULL,
    [state_id]              INT           DEFAULT (NULL) NULL,
    [stationtype_id]        INT           DEFAULT (NULL) NULL,
    [has_blackmarket]       SMALLINT      DEFAULT (NULL) NULL,
    [has_market]            SMALLINT      DEFAULT (NULL) NULL,
    [has_refuel]            SMALLINT      DEFAULT (NULL) NULL,
    [has_repair]            SMALLINT      DEFAULT (NULL) NULL,
    [has_rearm]             SMALLINT      DEFAULT (NULL) NULL,
    [has_outfitting]        SMALLINT      DEFAULT (NULL) NULL,
    [has_shipyard]          SMALLINT      DEFAULT (NULL) NULL,
    [has_commodities]       SMALLINT      DEFAULT (NULL) NULL,
    [is_planetary]          SMALLINT      DEFAULT (NULL) NULL,
    [updated_at]            DATETIME2 (0) NOT NULL,
    [shipyard_updated_at]   DATETIME2 (0) DEFAULT (NULL) NULL,
    [outfitting_updated_at] DATETIME2 (0) DEFAULT (NULL) NULL,
    [market_updated_at]     DATETIME2 (0) DEFAULT (NULL) NULL,
    [is_changed]            SMALLINT      DEFAULT ((0)) NULL,
    [visited]               SMALLINT      DEFAULT ((0)) NULL,
    [type_id]               INT           DEFAULT (NULL) NULL,
    CONSTRAINT [PK_tbstations_id] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [tbstations$fk_tbStations_tbAllegiance1] FOREIGN KEY ([allegiance_id]) REFERENCES [elite_db].[tballegiance] ([id]),
    CONSTRAINT [tbstations$fk_tbStations_tbGovernment1] FOREIGN KEY ([government_id]) REFERENCES [elite_db].[tbgovernment] ([id]),
    CONSTRAINT [tbstations$fk_tbStations_tbState1] FOREIGN KEY ([state_id]) REFERENCES [elite_db].[tbstate] ([id]),
    CONSTRAINT [tbstations$fk_tbStations_tbStationType1] FOREIGN KEY ([stationtype_id]) REFERENCES [elite_db].[tbstationtype] ([id]),
    CONSTRAINT [tbstations$fk_tbStations_tbSystems] FOREIGN KEY ([system_id]) REFERENCES [elite_db].[tbsystems] ([id]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [tbstations$fk_tbStations_tbVisitType1] FOREIGN KEY ([visited]) REFERENCES [elite_db].[tbvisittype] ([id])
);


GO
CREATE NONCLUSTERED INDEX [fk_tbStations_tbAllegiance1_idx]
    ON [elite_db].[tbstations]([allegiance_id] ASC);


GO
CREATE NONCLUSTERED INDEX [fk_tbStations_tbGovernment1_idx]
    ON [elite_db].[tbstations]([government_id] ASC);


GO
CREATE NONCLUSTERED INDEX [fk_tbStations_tbState1_idx]
    ON [elite_db].[tbstations]([state_id] ASC);


GO
CREATE NONCLUSTERED INDEX [fk_tbStations_tbStationType1_idx]
    ON [elite_db].[tbstations]([stationtype_id] ASC);


GO
CREATE NONCLUSTERED INDEX [fk_tbStations_tbSystems_idx]
    ON [elite_db].[tbstations]([system_id] ASC);


GO
CREATE NONCLUSTERED INDEX [fk_tbStations_tbVisitType1_idx]
    ON [elite_db].[tbstations]([visited] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_tbStations_Stationname]
    ON [elite_db].[tbstations]([stationname] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'elite_db.tbstations', @level0type = N'SCHEMA', @level0name = N'elite_db', @level1type = N'TABLE', @level1name = N'tbstations';


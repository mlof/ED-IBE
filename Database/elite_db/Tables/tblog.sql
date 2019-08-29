CREATE TABLE [elite_db].[tblog] (
    [time]                DATETIME2 (0)   NOT NULL,
    [system_id]           INT             DEFAULT (NULL) NULL,
    [station_id]          INT             DEFAULT (NULL) NULL,
    [event_id]            INT             NOT NULL,
    [commodity_id]        INT             DEFAULT (NULL) NULL,
    [cargoaction_id]      INT             DEFAULT (NULL) NULL,
    [cargovolume]         INT             DEFAULT (NULL) NULL,
    [credits_transaction] BIGINT          DEFAULT (NULL) NULL,
    [credits_total]       BIGINT          DEFAULT (NULL) NULL,
    [notes]               NVARCHAR (1024) DEFAULT (NULL) NULL,
    [distance]            FLOAT (53)      DEFAULT (NULL) NULL,
    CONSTRAINT [PK_tblog_time] PRIMARY KEY CLUSTERED ([time] ASC),
    CONSTRAINT [tblog$fk_tbLog_tbCargoAction1] FOREIGN KEY ([cargoaction_id]) REFERENCES [elite_db].[tbcargoaction] ([id]),
    CONSTRAINT [tblog$fk_tbLog_tbCommodities1] FOREIGN KEY ([commodity_id]) REFERENCES [elite_db].[tbcommodity] ([id]) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT [tblog$fk_tbLog_tbEventType1] FOREIGN KEY ([event_id]) REFERENCES [elite_db].[tbeventtype] ([id]),
    CONSTRAINT [tblog$fk_tbLog_tbStations1] FOREIGN KEY ([station_id]) REFERENCES [elite_db].[tbstations] ([id]),
    CONSTRAINT [tblog$fk_tbLog_tbSystems1] FOREIGN KEY ([system_id]) REFERENCES [elite_db].[tbsystems] ([id]) ON DELETE SET NULL ON UPDATE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [fk_tbLog_tbCargoAction1_idx]
    ON [elite_db].[tblog]([cargoaction_id] ASC);


GO
CREATE NONCLUSTERED INDEX [fk_tbLog_tbCommodities1_idx]
    ON [elite_db].[tblog]([commodity_id] ASC);


GO
CREATE NONCLUSTERED INDEX [fk_tbLog_tbEventType1_idx]
    ON [elite_db].[tblog]([event_id] ASC);


GO
CREATE NONCLUSTERED INDEX [fk_tbLog_tbStations1_idx]
    ON [elite_db].[tblog]([station_id] ASC);


GO
CREATE NONCLUSTERED INDEX [fk_tbLog_tbSystems1_idx]
    ON [elite_db].[tblog]([system_id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'elite_db.tblog', @level0type = N'SCHEMA', @level0name = N'elite_db', @level1type = N'TABLE', @level1name = N'tblog';


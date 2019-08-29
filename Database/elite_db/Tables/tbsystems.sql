CREATE TABLE [elite_db].[tbsystems] (
    [id]                 INT            NOT NULL,
    [systemname]         NVARCHAR (80)  NOT NULL,
    [x]                  FLOAT (53)     DEFAULT (NULL) NULL,
    [y]                  FLOAT (53)     DEFAULT (NULL) NULL,
    [z]                  FLOAT (53)     DEFAULT (NULL) NULL,
    [faction]            NVARCHAR (80)  DEFAULT (NULL) NULL,
    [population]         NVARCHAR (MAX) NULL,
    [government_id]      INT            DEFAULT (NULL) NULL,
    [allegiance_id]      INT            DEFAULT (NULL) NULL,
    [state_id]           INT            DEFAULT (NULL) NULL,
    [security_id]        INT            DEFAULT (NULL) NULL,
    [primary_economy_id] INT            DEFAULT (NULL) NULL,
    [needs_permit]       SMALLINT       DEFAULT (NULL) NULL,
    [updated_at]         DATETIME2 (0)  NOT NULL,
    [is_changed]         SMALLINT       DEFAULT ((0)) NULL,
    [visited]            SMALLINT       DEFAULT ((0)) NOT NULL,
    [Power_id]           INT            DEFAULT (NULL) NULL,
    [PowerState_id]      INT            DEFAULT (NULL) NULL,
    CONSTRAINT [PK_tbsystems_id] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [tbsystems$fk_tbSystems_tbAllegiance1] FOREIGN KEY ([allegiance_id]) REFERENCES [elite_db].[tballegiance] ([id]),
    CONSTRAINT [tbsystems$fk_tbSystems_tbEconomy1] FOREIGN KEY ([primary_economy_id]) REFERENCES [elite_db].[tbeconomy] ([id]),
    CONSTRAINT [tbsystems$fk_tbSystems_tbGovernment1] FOREIGN KEY ([government_id]) REFERENCES [elite_db].[tbgovernment] ([id]),
    CONSTRAINT [tbsystems$fk_tbSystems_tbPower1] FOREIGN KEY ([Power_id]) REFERENCES [elite_db].[tbpower] ([id]),
    CONSTRAINT [tbsystems$fk_tbSystems_tbPowerState1] FOREIGN KEY ([PowerState_id]) REFERENCES [elite_db].[tbpowerstate] ([id]),
    CONSTRAINT [tbsystems$fk_tbSystems_tbSecurity1] FOREIGN KEY ([security_id]) REFERENCES [elite_db].[tbsecurity] ([id]),
    CONSTRAINT [tbsystems$fk_tbSystems_tbState1] FOREIGN KEY ([state_id]) REFERENCES [elite_db].[tbstate] ([id]),
    CONSTRAINT [tbsystems$fk_tbSystems_tbVisitType1] FOREIGN KEY ([visited]) REFERENCES [elite_db].[tbvisittype] ([id])
);


GO
CREATE NONCLUSTERED INDEX [fk_tbSystems_tbAllegiance1_idx]
    ON [elite_db].[tbsystems]([allegiance_id] ASC);


GO
CREATE NONCLUSTERED INDEX [fk_tbSystems_tbEconomy1_idx]
    ON [elite_db].[tbsystems]([primary_economy_id] ASC);


GO
CREATE NONCLUSTERED INDEX [fk_tbSystems_tbGovernment1_idx]
    ON [elite_db].[tbsystems]([government_id] ASC);


GO
CREATE NONCLUSTERED INDEX [fk_tbSystems_tbPower1_idx]
    ON [elite_db].[tbsystems]([Power_id] ASC);


GO
CREATE NONCLUSTERED INDEX [fk_tbSystems_tbPowerState1_idx]
    ON [elite_db].[tbsystems]([PowerState_id] ASC);


GO
CREATE NONCLUSTERED INDEX [fk_tbSystems_tbSecurity1_idx]
    ON [elite_db].[tbsystems]([security_id] ASC);


GO
CREATE NONCLUSTERED INDEX [fk_tbSystems_tbState1_idx]
    ON [elite_db].[tbsystems]([state_id] ASC);


GO
CREATE NONCLUSTERED INDEX [fk_tbSystems_tbVisitType1_idx]
    ON [elite_db].[tbsystems]([visited] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_tbSystems_Systemname]
    ON [elite_db].[tbsystems]([systemname] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_x]
    ON [elite_db].[tbsystems]([x] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_y]
    ON [elite_db].[tbsystems]([y] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_z]
    ON [elite_db].[tbsystems]([z] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'elite_db.tbsystems', @level0type = N'SCHEMA', @level0name = N'elite_db', @level1type = N'TABLE', @level1name = N'tbsystems';


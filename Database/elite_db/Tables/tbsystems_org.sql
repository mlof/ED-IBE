CREATE TABLE [elite_db].[tbsystems_org] (
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
    CONSTRAINT [PK_tbsystems_org_id] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [tbsystems_org$fk_tbSystems_tbAllegiance10] FOREIGN KEY ([allegiance_id]) REFERENCES [elite_db].[tballegiance] ([id]),
    CONSTRAINT [tbsystems_org$fk_tbSystems_tbEconomy10] FOREIGN KEY ([primary_economy_id]) REFERENCES [elite_db].[tbeconomy] ([id]),
    CONSTRAINT [tbsystems_org$fk_tbSystems_tbGovernment10] FOREIGN KEY ([government_id]) REFERENCES [elite_db].[tbgovernment] ([id]),
    CONSTRAINT [tbsystems_org$fk_tbSystems_tbPower10] FOREIGN KEY ([Power_id]) REFERENCES [elite_db].[tbpower] ([id]),
    CONSTRAINT [tbsystems_org$fk_tbSystems_tbPowerState10] FOREIGN KEY ([PowerState_id]) REFERENCES [elite_db].[tbpowerstate] ([id]),
    CONSTRAINT [tbsystems_org$fk_tbSystems_tbSecurity10] FOREIGN KEY ([security_id]) REFERENCES [elite_db].[tbsecurity] ([id]),
    CONSTRAINT [tbsystems_org$fk_tbSystems_tbState10] FOREIGN KEY ([state_id]) REFERENCES [elite_db].[tbstate] ([id])
);


GO
CREATE NONCLUSTERED INDEX [fk_tbSystems_tbAllegiance1_idx]
    ON [elite_db].[tbsystems_org]([allegiance_id] ASC);


GO
CREATE NONCLUSTERED INDEX [fk_tbSystems_tbEconomy1_idx]
    ON [elite_db].[tbsystems_org]([primary_economy_id] ASC);


GO
CREATE NONCLUSTERED INDEX [fk_tbSystems_tbGovernment1_idx]
    ON [elite_db].[tbsystems_org]([government_id] ASC);


GO
CREATE NONCLUSTERED INDEX [fk_tbSystems_tbPower1_idx]
    ON [elite_db].[tbsystems_org]([Power_id] ASC);


GO
CREATE NONCLUSTERED INDEX [fk_tbSystems_tbPowerState1_idx]
    ON [elite_db].[tbsystems_org]([PowerState_id] ASC);


GO
CREATE NONCLUSTERED INDEX [fk_tbSystems_tbSecurity1_idx]
    ON [elite_db].[tbsystems_org]([security_id] ASC);


GO
CREATE NONCLUSTERED INDEX [fk_tbSystems_tbState1_idx]
    ON [elite_db].[tbsystems_org]([state_id] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_tbSystems_Systemname]
    ON [elite_db].[tbsystems_org]([systemname] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_x]
    ON [elite_db].[tbsystems_org]([x] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_y]
    ON [elite_db].[tbsystems_org]([y] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_z]
    ON [elite_db].[tbsystems_org]([z] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'elite_db.tbsystems_org', @level0type = N'SCHEMA', @level0name = N'elite_db', @level1type = N'TABLE', @level1name = N'tbsystems_org';


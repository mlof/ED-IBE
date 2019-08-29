CREATE TABLE [elite_db].[tmpa_bycommodity] (
    [System_ID]   INT           DEFAULT (NULL) NULL,
    [System]      NVARCHAR (80) DEFAULT (NULL) NULL,
    [Station_ID]  INT           NOT NULL,
    [Station]     NVARCHAR (80) DEFAULT (NULL) NULL,
    [Distance]    FLOAT (53)    DEFAULT (NULL) NULL,
    [Buy]         INT           DEFAULT (NULL) NULL,
    [Supply]      INT           DEFAULT (NULL) NULL,
    [SupplyLevel] NVARCHAR (80) DEFAULT (NULL) NULL,
    [Sell]        INT           DEFAULT (NULL) NULL,
    [Demand]      INT           DEFAULT (NULL) NULL,
    [DemandLevel] NVARCHAR (80) DEFAULT (NULL) NULL,
    [Timestamp]   DATETIME2 (0) DEFAULT (NULL) NULL,
    [Sources_id]  INT           DEFAULT (NULL) NULL,
    CONSTRAINT [PK_tmpa_bycommodity_Station_ID] PRIMARY KEY CLUSTERED ([Station_ID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'elite_db.tmpa_bycommodity', @level0type = N'SCHEMA', @level0name = N'elite_db', @level1type = N'TABLE', @level1name = N'tmpa_bycommodity';


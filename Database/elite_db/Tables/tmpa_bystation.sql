CREATE TABLE [elite_db].[tmpa_bystation] (
    [Station_ID]   INT           DEFAULT (NULL) NULL,
    [Commodity_ID] INT           NOT NULL,
    [Commodity]    NVARCHAR (80) DEFAULT (NULL) NULL,
    [Buy]          INT           DEFAULT (NULL) NULL,
    [Supply]       INT           DEFAULT (NULL) NULL,
    [SupplyLevel]  NVARCHAR (80) DEFAULT (NULL) NULL,
    [Sell]         INT           DEFAULT (NULL) NULL,
    [Demand]       INT           DEFAULT (NULL) NULL,
    [DemandLevel]  NVARCHAR (80) DEFAULT (NULL) NULL,
    [Timestamp]    DATETIME2 (0) DEFAULT (NULL) NULL,
    [Best_Buy]     INT           DEFAULT (NULL) NULL,
    [Best_Sell]    INT           DEFAULT (NULL) NULL,
    [MaxProfit]    INT           DEFAULT (NULL) NULL,
    [Sources_id]   INT           DEFAULT (NULL) NULL,
    CONSTRAINT [PK_tmpa_bystation_Commodity_ID] PRIMARY KEY CLUSTERED ([Commodity_ID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'elite_db.tmpa_bystation', @level0type = N'SCHEMA', @level0name = N'elite_db', @level1type = N'TABLE', @level1name = N'tmpa_bystation';


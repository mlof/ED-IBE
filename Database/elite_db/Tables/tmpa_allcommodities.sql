CREATE TABLE [elite_db].[tmpa_allcommodities] (
    [CommodityID]     INT           NOT NULL,
    [Commodity]       NVARCHAR (80) DEFAULT (NULL) NULL,
    [Buy_SystemID]    INT           DEFAULT (NULL) NULL,
    [Buy_System]      NVARCHAR (80) DEFAULT (NULL) NULL,
    [Buy_StationID]   INT           DEFAULT (NULL) NULL,
    [Buy_Station]     NVARCHAR (80) DEFAULT (NULL) NULL,
    [Buy_Min]         INT           DEFAULT (NULL) NULL,
    [Buy_Distance]    FLOAT (53)    DEFAULT (NULL) NULL,
    [Buy_Timestamp]   DATETIME2 (0) DEFAULT (NULL) NULL,
    [Buy_Sources_id]  INT           DEFAULT (NULL) NULL,
    [Sell_SystemID]   INT           DEFAULT (NULL) NULL,
    [Sell_System]     NVARCHAR (80) DEFAULT (NULL) NULL,
    [Sell_StationID]  INT           DEFAULT (NULL) NULL,
    [Sell_Station]    NVARCHAR (80) DEFAULT (NULL) NULL,
    [Sell_Max]        INT           DEFAULT (NULL) NULL,
    [Sell_Distance]   FLOAT (53)    DEFAULT (NULL) NULL,
    [Sell_Timestamp]  DATETIME2 (0) DEFAULT (NULL) NULL,
    [Sell_Sources_id] INT           DEFAULT (NULL) NULL,
    [Max_Profit]      INT           DEFAULT (NULL) NULL,
    CONSTRAINT [PK_tmpa_allcommodities_CommodityID] PRIMARY KEY CLUSTERED ([CommodityID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'elite_db.tmpa_allcommodities', @level0type = N'SCHEMA', @level0name = N'elite_db', @level1type = N'TABLE', @level1name = N'tmpa_allcommodities';


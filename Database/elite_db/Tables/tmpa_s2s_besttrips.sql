CREATE TABLE [elite_db].[tmpa_s2s_besttrips] (
    [System_ID_1]        INT           DEFAULT (NULL) NULL,
    [SystemName_1]       NVARCHAR (80) DEFAULT (NULL) NULL,
    [Station_ID_1]       INT           NOT NULL,
    [StationName_1]      NVARCHAR (80) DEFAULT (NULL) NULL,
    [TimeStamp_1]        DATETIME2 (0) DEFAULT (NULL) NULL,
    [Station_Location_1] NVARCHAR (80) DEFAULT (NULL) NULL,
    [System_ID_2]        INT           DEFAULT (NULL) NULL,
    [SystemName_2]       NVARCHAR (80) DEFAULT (NULL) NULL,
    [Station_ID_2]       INT           NOT NULL,
    [StationName_2]      NVARCHAR (80) DEFAULT (NULL) NULL,
    [TimeStamp_2]        DATETIME2 (0) DEFAULT (NULL) NULL,
    [Station_Location_2] NVARCHAR (80) DEFAULT (NULL) NULL,
    [Profit]             INT           DEFAULT (NULL) NULL,
    [Distance]           FLOAT (53)    DEFAULT (NULL) NULL,
    [DistanceToStar_1]   FLOAT (53)    DEFAULT (NULL) NULL,
    [DistanceToStar_2]   FLOAT (53)    DEFAULT (NULL) NULL,
    [DistanceToRoute]    FLOAT (53)    DEFAULT (NULL) NULL,
    CONSTRAINT [PK_tmpa_s2s_besttrips_Station_ID_1] PRIMARY KEY CLUSTERED ([Station_ID_1] ASC, [Station_ID_2] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'elite_db.tmpa_s2s_besttrips', @level0type = N'SCHEMA', @level0name = N'elite_db', @level1type = N'TABLE', @level1name = N'tmpa_s2s_besttrips';


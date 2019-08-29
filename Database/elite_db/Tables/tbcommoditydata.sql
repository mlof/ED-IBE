CREATE TABLE [elite_db].[tbcommoditydata] (
    [id]           BIGINT           IDENTITY (1, 1) NOT NULL,
    [station_id]   INT              NOT NULL,
    [commodity_id] INT              NOT NULL,
    [Sell]         INT              DEFAULT (NULL) NULL,
    [Buy]          INT              DEFAULT (NULL) NULL,
    [Demand]       INT              DEFAULT (NULL) NULL,
    [DemandLevel]  INT              DEFAULT (NULL) NULL,
    [Supply]       INT              DEFAULT (NULL) NULL,
    [SupplyLevel]  INT              DEFAULT (NULL) NULL,
    [Sources_id]   INT              NOT NULL,
    [timestamp]    DATETIME2 (0)    NOT NULL,
    [ssma$rowid]   UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    CONSTRAINT [PK_tbcommoditydata_id] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [tbcommoditydata$fk_tbStationCommodity_tbEconomyLevel1] FOREIGN KEY ([DemandLevel]) REFERENCES [elite_db].[tbeconomylevel] ([id]),
    CONSTRAINT [tbcommoditydata$fk_tbStationCommodity_tbEconomyLevel2] FOREIGN KEY ([SupplyLevel]) REFERENCES [elite_db].[tbeconomylevel] ([id]),
    CONSTRAINT [tbcommoditydata$fk_tbStationCommodity_tbSources1] FOREIGN KEY ([Sources_id]) REFERENCES [elite_db].[tbsource] ([id]),
    CONSTRAINT [tbcommoditydata$fk_tbStations_has_tbCommodities_tbCommodities1] FOREIGN KEY ([commodity_id]) REFERENCES [elite_db].[tbcommodity] ([id]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [tbcommoditydata$fk_tbStations_has_tbCommodities_tbStations1] FOREIGN KEY ([station_id]) REFERENCES [elite_db].[tbstations] ([id]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [UK_tbcommoditydata_ssma$rowid] UNIQUE NONCLUSTERED ([ssma$rowid] ASC)
);


GO
CREATE NONCLUSTERED INDEX [fk_tbStationCommodity_tbEconomyLevel1_idx]
    ON [elite_db].[tbcommoditydata]([DemandLevel] ASC);


GO
CREATE NONCLUSTERED INDEX [fk_tbStationCommodity_tbEconomyLevel2_idx]
    ON [elite_db].[tbcommoditydata]([SupplyLevel] ASC);


GO
CREATE NONCLUSTERED INDEX [fk_tbStationCommodity_tbSources1_idx]
    ON [elite_db].[tbcommoditydata]([Sources_id] ASC);


GO
CREATE NONCLUSTERED INDEX [fk_tbStations_has_tbCommodities_tbCommodities1_idx]
    ON [elite_db].[tbcommoditydata]([commodity_id] ASC);


GO
CREATE NONCLUSTERED INDEX [fk_tbStations_has_tbCommodities_tbStations1_idx]
    ON [elite_db].[tbcommoditydata]([station_id] ASC);


GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `RN_User`@`::1`.
*/

CREATE TRIGGER elite_db.tbCommodityData_AFTER_INSERT_AfterInsert
   ON elite_db.tbcommoditydata
    AFTER INSERT
      AS 
         BEGIN

            SET  NOCOUNT  ON

            SET  XACT_ABORT  ON

            /* column variables declaration*/
            DECLARE
               @new$station_id int, 
               @new$commodity_id int, 
               @new$Sell int, 
               @new$Buy int, 
               @new$Demand int, 
               @new$DemandLevel int, 
               @new$Supply int, 
               @new$SupplyLevel int, 
               @new$Sources_id int, 
               @new$timestamp datetime2(0)

            DECLARE
                ForEachInsertedRowTriggerCursor CURSOR LOCAL FORWARD_ONLY READ_ONLY FOR 
                  SELECT 
                     station_id, 
                     commodity_id, 
                     Sell, 
                     Buy, 
                     Demand, 
                     DemandLevel, 
                     Supply, 
                     SupplyLevel, 
                     Sources_id, 
                     timestamp
                  FROM inserted

            OPEN ForEachInsertedRowTriggerCursor

            FETCH ForEachInsertedRowTriggerCursor
                INTO 
                  @new$station_id, 
                  @new$commodity_id, 
                  @new$Sell, 
                  @new$Buy, 
                  @new$Demand, 
                  @new$DemandLevel, 
                  @new$Supply, 
                  @new$SupplyLevel, 
                  @new$Sources_id, 
                  @new$timestamp

            WHILE @@fetch_status = 0
            
               BEGIN

                  /* trigger implementation: begin*/
                  BEGIN

                     DECLARE
                        @isActive bit

                     SELECT @isActive = 
                        CASE 
                           WHEN ((tbinitvalue.InitValue <> '0') AND (tbinitvalue.InitValue <> 'False')) THEN 1
                           WHEN NOT ((tbinitvalue.InitValue <> '0') AND (tbinitvalue.InitValue <> 'False')) THEN 0
                           ELSE NULL
                        END
                     FROM elite_db.tbinitvalue
                     WHERE tbinitvalue.InitGroup = 'Database' AND tbinitvalue.InitKey = 'CollectPriceHistory'

                     IF @isActive <> 0
                        /*
                        *   SSMA informational messages:
                        *   M2SS0231: Zero-date, zero-in-date and invalid dates to not null columns has been replaced with GetDate()/Constant date
                        */

                        INSERT elite_db.tbpricehistory(
                           elite_db.tbpricehistory.station_id, 
                           elite_db.tbpricehistory.commodity_id, 
                           elite_db.tbpricehistory.Sell, 
                           elite_db.tbpricehistory.Buy, 
                           elite_db.tbpricehistory.Demand, 
                           elite_db.tbpricehistory.DemandLevel, 
                           elite_db.tbpricehistory.Supply, 
                           elite_db.tbpricehistory.SupplyLevel, 
                           elite_db.tbpricehistory.Sources_id, 
                           elite_db.tbpricehistory.timestamp)
                           VALUES (
                              @new$station_id, 
                              @new$commodity_id, 
                              @new$Sell, 
                              @new$Buy, 
                              @new$Demand, 
                              @new$DemandLevel, 
                              @new$Supply, 
                              @new$SupplyLevel, 
                              @new$Sources_id, 
                              isnull(@new$timestamp, getdate()))

                  END
                  /* trigger implementation: end*/

                  FETCH ForEachInsertedRowTriggerCursor
                      INTO 
                        @new$station_id, 
                        @new$commodity_id, 
                        @new$Sell, 
                        @new$Buy, 
                        @new$Demand, 
                        @new$DemandLevel, 
                        @new$Supply, 
                        @new$SupplyLevel, 
                        @new$Sources_id, 
                        @new$timestamp

               END

            CLOSE ForEachInsertedRowTriggerCursor

            DEALLOCATE ForEachInsertedRowTriggerCursor

         END
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `RN_User`@`::1`.
*/

CREATE TRIGGER elite_db.tbCommodityData_AFTER_UPDATE_AfterUpdate
   ON elite_db.tbcommoditydata
    AFTER UPDATE
      AS 
         BEGIN

            SET  NOCOUNT  ON

            SET  XACT_ABORT  ON

            /* column variables declaration*/
            DECLARE
               @new$station_id int, 
               @new$commodity_id int, 
               @new$Sell int, 
               @old$Sell int, 
               @new$Buy int, 
               @old$Buy int, 
               @new$Demand int, 
               @new$DemandLevel int, 
               @new$Supply int, 
               @new$SupplyLevel int, 
               @new$Sources_id int, 
               @old$Sources_id int, 
               @new$timestamp datetime2(0), 
               @old$timestamp datetime2(0)

            DECLARE
                ForEachInsertedRowTriggerCursor CURSOR LOCAL FORWARD_ONLY READ_ONLY FOR 
                  SELECT 
                     i.station_id, 
                     i.commodity_id, 
                     i.Sell, 
                     i.Buy, 
                     i.Demand, 
                     i.DemandLevel, 
                     i.Supply, 
                     i.SupplyLevel, 
                     i.Sources_id, 
                     i.timestamp, 
                     d.Sell, 
                     d.Buy, 
                     d.Sources_id, 
                     d.timestamp
                  FROM 
                     deleted  AS d 
                        INNER JOIN inserted  AS i 
                        ON i.ssma$rowid = d.ssma$rowid

            OPEN ForEachInsertedRowTriggerCursor

            FETCH ForEachInsertedRowTriggerCursor
                INTO 
                  @new$station_id, 
                  @new$commodity_id, 
                  @new$Sell, 
                  @new$Buy, 
                  @new$Demand, 
                  @new$DemandLevel, 
                  @new$Supply, 
                  @new$SupplyLevel, 
                  @new$Sources_id, 
                  @new$timestamp, 
                  @old$Sell, 
                  @old$Buy, 
                  @old$Sources_id, 
                  @old$timestamp

            WHILE @@fetch_status = 0
            
               BEGIN

                  /* trigger implementation: begin*/
                  BEGIN

                     DECLARE
                        @isActive bit

                     SELECT @isActive = 
                        CASE 
                           WHEN ((tbinitvalue.InitValue <> '0') AND (tbinitvalue.InitValue <> 'False')) THEN 1
                           WHEN NOT ((tbinitvalue.InitValue <> '0') AND (tbinitvalue.InitValue <> 'False')) THEN 0
                           ELSE NULL
                        END
                     FROM elite_db.tbinitvalue
                     WHERE tbinitvalue.InitGroup = 'Database' AND tbinitvalue.InitKey = 'CollectPriceHistory'

                     IF @isActive <> 0
                        BEGIN
                           IF 
                              (@new$Sell <> @old$Sell) OR 
                              (@new$Buy <> @old$Buy) OR 
                              (@new$Sources_id <> @old$Sources_id) OR 
                              (datediff(hour, @old$timestamp, @new$timestamp) > 24)
                              /*
                              *   SSMA informational messages:
                              *   M2SS0231: Zero-date, zero-in-date and invalid dates to not null columns has been replaced with GetDate()/Constant date
                              */

                              INSERT elite_db.tbpricehistory(
                                 elite_db.tbpricehistory.station_id, 
                                 elite_db.tbpricehistory.commodity_id, 
                                 elite_db.tbpricehistory.Sell, 
                                 elite_db.tbpricehistory.Buy, 
                                 elite_db.tbpricehistory.Demand, 
                                 elite_db.tbpricehistory.DemandLevel, 
                                 elite_db.tbpricehistory.Supply, 
                                 elite_db.tbpricehistory.SupplyLevel, 
                                 elite_db.tbpricehistory.Sources_id, 
                                 elite_db.tbpricehistory.timestamp)
                                 VALUES (
                                    @new$station_id, 
                                    @new$commodity_id, 
                                    @new$Sell, 
                                    @new$Buy, 
                                    @new$Demand, 
                                    @new$DemandLevel, 
                                    @new$Supply, 
                                    @new$SupplyLevel, 
                                    @new$Sources_id, 
                                    isnull(@new$timestamp, getdate()))
                        END

                  END
                  /* trigger implementation: end*/

                  FETCH ForEachInsertedRowTriggerCursor
                      INTO 
                        @new$station_id, 
                        @new$commodity_id, 
                        @new$Sell, 
                        @new$Buy, 
                        @new$Demand, 
                        @new$DemandLevel, 
                        @new$Supply, 
                        @new$SupplyLevel, 
                        @new$Sources_id, 
                        @new$timestamp, 
                        @old$Sell, 
                        @old$Buy, 
                        @old$Sources_id, 
                        @old$timestamp

               END

            CLOSE ForEachInsertedRowTriggerCursor

            DEALLOCATE ForEachInsertedRowTriggerCursor

         END
GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'elite_db.tbcommoditydata', @level0type = N'SCHEMA', @level0name = N'elite_db', @level1type = N'TABLE', @level1name = N'tbcommoditydata';


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'elite_db.tbcommoditydata.tbCommodityData_AFTER_INSERT', @level0type = N'SCHEMA', @level0name = N'elite_db', @level1type = N'TABLE', @level1name = N'tbcommoditydata', @level2type = N'TRIGGER', @level2name = N'tbCommodityData_AFTER_INSERT_AfterInsert';


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'elite_db.tbcommoditydata.tbCommodityData_AFTER_UPDATE', @level0type = N'SCHEMA', @level0name = N'elite_db', @level1type = N'TABLE', @level1name = N'tbcommoditydata', @level2type = N'TRIGGER', @level2name = N'tbCommodityData_AFTER_UPDATE_AfterUpdate';


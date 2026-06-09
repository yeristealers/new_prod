[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Query_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "countryOrRegion", DestinationColumnName = "countryOrRegion"], [SourceColumnName = "holidayName", DestinationColumnName = "holidayName"], [SourceColumnName = "normalizeHolidayName", DestinationColumnName = "normalizeHolidayName"], [SourceColumnName = "isPaidTimeOff", DestinationColumnName = "isPaidTimeOff"], [SourceColumnName = "countryRegionCode", DestinationColumnName = "countryRegionCode"], [SourceColumnName = "date", DestinationColumnName = "date"], [SourceColumnName = "BATCH_IDENTIFIER", DestinationColumnName = "BATCH_IDENTIFIER"], [SourceColumnName = "Account Level 3 + Name", DestinationColumnName = "Account Level 3 + Name"]}], DynamicSchema = false, UpdateMethod = [Kind = "Append"], TypeSettings = [Kind = "Table"]]]}]
shared Query = let
  Source = Excel.Workbook(Web.Contents("https://mngenvmcap945981.sharepoint.com/sites/SharePoint1/Shared%20Documents/gen2_source.xlsx"), null, true),
  #"Navigation 1" = Source{[Item = "Sheet1", Kind = "Sheet"]}[Data],
  #"Promoted headers" = Table.PromoteHeaders(#"Navigation 1", [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"countryOrRegion", type text}, {"holidayName", type text}, {"normalizeHolidayName", type text}, {"isPaidTimeOff", Int64.Type}, {"countryRegionCode", type text}, {"date", type datetime}}),

  #"Added custom 1" = Table.TransformColumnTypes(Table.AddColumn(#"Changed column type", "BATCH_IDENTIFIER", each Text.NewGuid()), {{"BATCH_IDENTIFIER", type text}}),
  #"Added custom" = Table.TransformColumnTypes(Table.AddColumn(#"Added custom 1", "ETL_DATETIME", each DateTimeZone.SwitchZone(DateTimeZone.UtcNow(), 8)), {{"ETL_DATETIME", type datetime}}),
  #"Renamed columns" = Table.RenameColumns(#"Added custom", {{"ETL_DATETIME", "Account Level 3 + Name"}})
in
  #"Renamed columns";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Query (2)_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "countryOrRegion", DestinationColumnName = "countryOrRegion"], [SourceColumnName = "holidayName", DestinationColumnName = "holidayName"], [SourceColumnName = "normalizeHolidayName", DestinationColumnName = "normalizeHolidayName"], [SourceColumnName = "isPaidTimeOff", DestinationColumnName = "isPaidTimeOff"], [SourceColumnName = "countryRegionCode", DestinationColumnName = "countryRegionCode"], [SourceColumnName = "date", DestinationColumnName = "date"], [SourceColumnName = "BATCH_IDENTIFIER", DestinationColumnName = "BATCH_IDENTIFIER"], [SourceColumnName = "Account Level 3 + Name", DestinationColumnName = "Account Level 3 + Name"]}], DynamicSchema = false, UpdateMethod = [Kind = "Append"], TypeSettings = [Kind = "Table"]]]}]
shared #"Query (2)" = let
  Source = Excel.Workbook(Web.Contents("https://mngenvmcap945981.sharepoint.com/sites/SharePoint1/Shared%20Documents/gen2_source.xlsx"), null, true),
  #"Navigation 1" = Source{[Item = "Sheet2", Kind = "Sheet"]}[Data],
  #"Promoted headers" = Table.PromoteHeaders(#"Navigation 1", [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"countryOrRegion", type text}, {"holidayName", type text}, {"normalizeHolidayName", type text}, {"isPaidTimeOff", Int64.Type}, {"countryRegionCode", type text}, {"date", type datetime}}),

  #"Added custom 1" = Table.TransformColumnTypes(Table.AddColumn(#"Changed column type", "BATCH_IDENTIFIER", each Text.NewGuid()), {{"BATCH_IDENTIFIER", type text}}),
  #"Added custom" = Table.TransformColumnTypes(Table.AddColumn(#"Added custom 1", "ETL_DATETIME", each DateTimeZone.SwitchZone(DateTimeZone.UtcNow(), 8)), {{"ETL_DATETIME", type datetime}}),
  #"Renamed columns" = Table.RenameColumns(#"Added custom", {{"ETL_DATETIME", "Account Level 3 + Name"}})
in
  #"Renamed columns";
shared WorkspaceId = Variable.ValueOrDefault("$(/**/Variables_1/WorkspaceId)", "12345678-123456789-1234-123456789102");
shared WarehouseId = Variable.ValueOrDefault("$(/**/Variables_1/WarehouseId)", "12345678-123456789-1234-123456789102");
shared WarehouseTable = Variable.ValueOrDefault("$(/**/Variables_1/WarehouseTable)", "Table");
shared Query_DataDestination = let
  Pattern = Fabric.Warehouse([HierarchicalNavigation = null, CreateNavigationProperties = false]),
  Navigation_1 = Pattern{[workspaceId = WorkspaceId]}[Data],
  Navigation_2 = Navigation_1{[warehouseId = WarehouseId]}[Data],
  TableNavigation = Navigation_2{[Schema = "dbo", Item = WarehouseTable]}[Data]
in
  TableNavigation;
shared #"Query (2)_DataDestination" = let
  Pattern = Fabric.Warehouse([HierarchicalNavigation = null, CreateNavigationProperties = false]),
  Navigation_1 = Pattern{[workspaceId = WorkspaceId]}[Data],
  Navigation_2 = Navigation_1{[warehouseId = WarehouseId]}[Data],
  TableNavigation = Navigation_2{[Schema = "dbo", Item = WarehouseTable]}[Data]
in
  TableNavigation;

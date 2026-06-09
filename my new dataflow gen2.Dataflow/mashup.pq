section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Query1_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "countryOrRegion", DestinationColumnName = "countryOrRegion"], [SourceColumnName = "holidayName", DestinationColumnName = "holidayName"], [SourceColumnName = "normalizeHolidayName", DestinationColumnName = "normalizeHolidayName"], [SourceColumnName = "countryRegionCode", DestinationColumnName = "countryRegionCode"], [SourceColumnName = "date", DestinationColumnName = "date"]}], DynamicSchema = false, UpdateMethod = [Kind = "Append"], TypeSettings = [Kind = "Table"]]]}]
shared Query1 = let
  Source = SharePoint.Files("https://mngenvmcap945981.sharepoint.com/sites/SharePoint1/", [ApiVersion = 15]),
  Navigation = Source{[Name = "gen2_source.xlsx", #"Folder Path" = "https://mngenvmcap945981.sharepoint.com/sites/SharePoint1/Shared Documents/"]}[Content],
  #"Imported Excel workbook" = Excel.Workbook(Navigation, null, true),
  #"Navigation 1" = #"Imported Excel workbook"{[Item = "Sheet1", Kind = "Sheet"]}[Data],
  #"Promoted headers" = Table.PromoteHeaders(#"Navigation 1", [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"countryOrRegion", type text}, {"holidayName", type text}, {"normalizeHolidayName", type text}, {"isPaidTimeOff", Int64.Type}, {"countryRegionCode", type text}, {"date", type datetime}})
in
  #"Changed column type";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Query2_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "countryOrRegion", DestinationColumnName = "countryOrRegion"], [SourceColumnName = "holidayName", DestinationColumnName = "holidayName"], [SourceColumnName = "normalizeHolidayName", DestinationColumnName = "normalizeHolidayName"], [SourceColumnName = "countryRegionCode", DestinationColumnName = "countryRegionCode"], [SourceColumnName = "date", DestinationColumnName = "date"]}], DynamicSchema = false, UpdateMethod = [Kind = "Append"], TypeSettings = [Kind = "Table"]]]}]
shared Query2 = let
  Source = SharePoint.Files("https://mngenvmcap945981.sharepoint.com/sites/SharePoint1/", [ApiVersion = 15]),
  Navigation = Source{[Name = "gen2_source.xlsx", #"Folder Path" = "https://mngenvmcap945981.sharepoint.com/sites/SharePoint1/Shared Documents/"]}[Content],
  #"Imported Excel workbook" = Excel.Workbook(Navigation, null, true),
  #"Navigation 1" = #"Imported Excel workbook"{[Item = "Sheet2", Kind = "Sheet"]}[Data],
  #"Promoted headers" = Table.PromoteHeaders(#"Navigation 1", [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"countryOrRegion", type text}, {"holidayName", type text}, {"normalizeHolidayName", type text}, {"isPaidTimeOff", Int64.Type}, {"countryRegionCode", type text}, {"date", type datetime}})
in
  #"Changed column type";
shared WorkspaceId = Variable.ValueOrDefault("$(/**/myVariableLibrary/WorkspaceId)", "12345678-123456789-1234-123456789102");
shared WarehouseId = Variable.ValueOrDefault("$(/**/myVariableLibrary/WarehouseId)", "b1d8bb7d-65d3-43fb-b09e-5ce5b6df7fad");
shared WarehouseTable = Variable.ValueOrDefault("$(/**/myVariableLibrary/WarehouseTable)", "devTable");
shared Query1_DataDestination = let
  Pattern = Fabric.Warehouse([HierarchicalNavigation = null, CreateNavigationProperties = false]),
  Navigation_1 = Pattern{[workspaceId = WorkspaceId]}[Data],
  Navigation_2 = Navigation_1{[warehouseId = WarehouseId]}[Data],
  TableNavigation = Navigation_2{[Schema = "dbo", Item = WarehouseTable]}[Data]
in
  TableNavigation;
shared Query2_DataDestination = let
  Pattern = Fabric.Warehouse([HierarchicalNavigation = null, CreateNavigationProperties = false]),
  Navigation_1 = Pattern{[workspaceId = WorkspaceId]}[Data],
  Navigation_2 = Navigation_1{[warehouseId = WarehouseId]}[Data],
  TableNavigation = Navigation_2{[Schema = "dbo", Item = WarehouseTable]}[Data]
in
  TableNavigation;

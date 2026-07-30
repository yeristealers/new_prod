[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
shared TBLX = let
  Source = Sql.Database("W22SQL22-AG.contoso.net", "AGDB01", [CreateNavigationProperties = false, MultiSubnetFailover = true]),
  #"Navigation 1" = Source{[Schema = "dbo", Item = "TBLX"]}[Data]
in
  #"Navigation 1";
shared TBLX3 = let
  Source = Sql.Database("W22SQL22-AG.contoso.net", "AGDB01"),
  #"Navigation 1" = Source{[Schema = "dbo", Item = "TBLX3"]}[Data]
in
  #"Navigation 1";

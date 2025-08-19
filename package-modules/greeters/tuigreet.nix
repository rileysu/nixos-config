{
  system = [
    # Greeter
    {
      packageID = "greetd";
      systemModulePathSuffix = "/service/greetd.nix";
    }
    {
      packageID = "tuigreet";
      systemModulePathSuffix = null;
    }
  ];

  wrapped = [];

  font = [];

  flatpak = [];
}
{
  system = [
    # Greeter
    {
      packageID = "greetd";
      systemModulePathSuffix = null;
    }
    {
      packageID = "tuigreet";
      systemModulePathSuffix = "/greeters/tuigreet.nix";
    }
  ];

  wrapped = [];

  font = [];

  flatpak = [];
}
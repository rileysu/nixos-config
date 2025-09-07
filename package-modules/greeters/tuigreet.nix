{
  system = [
    # Greeter
    {
      packageID = "greetd";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
    }
    {
      packageID = "tuigreet";
      systemModulePathSuffix = "/greeters/tuigreet.nix";
      homeModulePathSuffix = null;
    }
  ];

  wrapped = [];

  font = [];

  flatpak = [];
}
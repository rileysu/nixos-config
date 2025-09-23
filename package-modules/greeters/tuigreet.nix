{
  system = [
    # Greeter
    {
      package = "greetd";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
    }
    {
      package = "tuigreet";
      systemModulePathSuffix = "/greeters/tuigreet.nix";
      homeModulePathSuffix = null;
    }
  ];

  wrapped = [];

  font = [];

  flatpak = [];
}
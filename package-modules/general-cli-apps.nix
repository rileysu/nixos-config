{
  system = [
    # Utilities
    {
      packageID = "openssh";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
    }
    {
      packageID = "git";
      systemModulePathSuffix = null;
      homeModulePathSuffix = "/git/default.nix";
    }
    {
      packageID = "curl";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
    }
    {
      packageID = "fastfetch";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
    }
    {
      packageID = "caligula";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
    }
  ];

  wrapped = [];

  font = [];

  flatpak = [];
}
{
  system = [
    # Utilities
    {
      package = "openssh";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
    }
    {
      package = "git";
      systemModulePathSuffix = null;
      homeModulePathSuffix = "/git/default.nix";
    }
    {
      package = "curl";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
    }
    {
      package = "fastfetch";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
    }
    {
      package = "caligula";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
    }
    {
      package = "btop";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
    }
  ];

  wrapped = [];

  font = [];

  flatpak = [];
}
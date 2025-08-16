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
      homeModulePathSuffix = null;
    }
    {
      packageID = "neovim";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
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

    # Shell
    {
      packageID = "starship";
      systemModulePathSuffix = null;
      homeModulePathSuffix = "/shell/starship.nix";
    }
  ];

  wrapped = [
    # Utilities
    {
      packageID = "nushell";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
    }
  ];

  font = [];
}
{
  system = [
    {
      packageID = "fish";
      systemModulePathSuffix = "/shell/fish.nix";
      homeModulePathSuffix = "/shell/fish.nix";
    }
  ];

  user = [
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

  font = [];
}
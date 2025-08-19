{
  system = [];

  wrapped = [];

  font = base.font ++ [
    {
      packageID = "nerd-fonts.monaspace";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
    }
    {
      packageID = "roboto-mono";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
    }
  ];

  # Generic OS base does not have flatpak definitions
  flatpak = [];
}
{
  system = base.system ++ [
    # WM + WM Apps
    {
      packageID = "slurp";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
    }
    {
      packageID = "grim";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
    }
    {
      packageID = "wl-clipboard";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
    }
  ];

  wrapped = base.wrapped ++ [
    # WM + WM Apps
    {
      packageID = "sway";
      systemModulePathSuffix = null;
      homeModulePathSuffix = "/app/sway.nix";
    }
    {
      packageID = "bemenu";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
    }
    {
      packageID = "i3status-rust";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
    }
    {
      packageID = "mako";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
    }
    {
      packageID = "swaylock";
      systemModulePathSuffix = "/swaylock.nix";
      homeModulePathSuffix = null;
    }
  ];

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
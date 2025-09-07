let
  base = import ./sway-base.nix;
in {
  system = base.system ++ [
    # WM + WM Apps
    {
      packageID = "brightnessctl";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
    }
  ];

  wrapped = base.wrapped ++ [

  ];

  font = base.font ++ [

  ];

  flatpak = base.flatpak ++ [

  ];
}
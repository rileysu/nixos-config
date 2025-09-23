let
  base = import ./bases/sway-base.nix;
in {
  system = base.system ++ [
    {
      package = "brightnessctl";
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
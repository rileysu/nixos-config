let
  base = (import ./base-linux.nix);
in
{
  system = base.system ++ [
    # WM + WM Apps
    {
      packageID = "brightnessctl";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
    }

    # Apps
    {
      packageID = "brave";
      systemModulePathSuffix = null;
      homeModulePathSuffix = "/app/brave.nix";
    }
  ];

  wrapped = base.wrapped ++ [];

  font = base.font ++ [];

  flatpak = base.flatpak ++ [];
}
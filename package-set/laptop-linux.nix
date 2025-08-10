let
  base = (import ./base-linux.nix);
in
{
  system = base.system ++ [];

  user = base.user ++ [
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

  font = base.font ++ [];

  flatpak = base.flatpak ++ [];
}
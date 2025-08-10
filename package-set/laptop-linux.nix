let
  base = (import ./base-linux.nix);
in
{
  system = base.system ++ [];

  user = base.user ++ [
    # WM + WM Apps
    {
      packageID = "sway";
      systemModulePathSuffix = null;
      homeModulePathSuffix = "/app/sway.nix";
    }
    {
      packageID = "wmenu";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
    }
    {
      packageID = "brightnessctl";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
    }

    # Apps
    {
      packageID = "firefox";
      systemModulePathSuffix = null;
      homeModulePathSuffix = "/app/firefox/base.nix";
    }
    {
      packageID = "librewolf";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
    }
  ];

  font = base.font ++ [];

  flatpak = base.flatpak ++ [];
}
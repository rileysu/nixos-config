let
  base = (import ./base-linux.nix);
in
{
  system = base.system ++ [
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
  ];

  font = base.font ++ [];

  flatpak = base.flatpak ++ [
    {
      packageID = "org.mozilla.firefox";
      systemModulePathSuffix = null;
      homeModulePathSuffix = "/app/firefox/flatpak.nix";
    }
  ];
}
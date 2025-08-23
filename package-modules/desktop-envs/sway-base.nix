let
  fontBase = import ../fonts.nix;
in
{
  system = [
    # WM + WM Apps
    {
      packageID = "slurp";
      systemModulePathSuffix = null;
    }
    {
      packageID = "grim";
      systemModulePathSuffix = null;
    }
    {
      packageID = "wl-clipboard";
      systemModulePathSuffix = null;
    }
    {
      packageID = "bibata-cursors";
      systemModulePathSuffix = null;
    }
  ];

  wrapped = [
    # WM + WM Apps
    {
      packageID = "sway";
      systemModulePathSuffix = null;
    }
    {
      packageID = "bemenu";
      systemModulePathSuffix = null;
    }
    {
      packageID = "i3status-rust";
      systemModulePathSuffix = null;
    }
    {
      packageID = "mako";
      systemModulePathSuffix = null;
    }
    {
      packageID = "swaylock";
      systemModulePathSuffix = "/swaylock.nix";
    }
  ];

  font = fontBase.font ++ [];

  flatpak = [];
}
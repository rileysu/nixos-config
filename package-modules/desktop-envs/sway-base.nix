let
  fontBase = import ../fonts.nix;
in
{
  system = [
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

  wrapped = [
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

  font = fontBase.font ++ [];

  flatpak = [];
}
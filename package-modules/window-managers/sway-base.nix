let
  fontBase = import ../fonts.nix;
in
{
  system = [
    # WM + WM Apps
    {
      packageID = "sway";
      systemModulePathSuffix = null;
      homeModulePathSuffix = "/sway/default.nix";
    }
    {
      packageID = "bemenu";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
    }
    {
      packageID = "i3status-rust";
      systemModulePathSuffix = null;
      homeModulePathSuffix = "/i3status-rust/default.nix";
    }
    {
      packageID = "mako";
      systemModulePathSuffix = null;
      homeModulePathSuffix = "/mako/default.nix";
    }
    {
      packageID = "swaylock";
      systemModulePathSuffix = "/swaylock.nix";
      homeModulePathSuffix = "/swaylock/default.nix";
    }
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
    {
      packageID = "bibata-cursors";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
    }
  ];

  wrapped = [];

  font = fontBase.font ++ [];

  flatpak = [];
}
let
  fontBase = import ../../fonts.nix;
in
{
  system = [
    {
      package = "sway";
      systemModulePathSuffix = "/window-managers/sway.nix";
      homeModulePathSuffix = "/sway/default.nix";
    }
    {
      package = "waybar";
      systemModulePathSuffix = null;
      homeModulePathSuffix = "/waybar/default.nix";
    }
    {
      package = "i3status-rust";
      systemModulePathSuffix = null;
      homeModulePathSuffix = "/i3status-rust/default.nix";
    }
    {
      package = "mako";
      systemModulePathSuffix = null;
      homeModulePathSuffix = "/mako/default.nix";
    }
    {
      package = "swaylock";
      systemModulePathSuffix = "/swaylock.nix";
      homeModulePathSuffix = "/swaylock/default.nix";
    }
    {
      package = "slurp";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
    }
    {
      package = "grim";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
    }
    {
      package = "wl-clipboard";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
    }
    {
      package = "bibata-cursors";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
    }
  ];

  wrapped = [
    {
      package = "bemenu";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
    }
  ];

  font = fontBase.font ++ [];

  flatpak = [];
}

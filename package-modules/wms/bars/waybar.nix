let
  fontBase = import ../../fonts.nix;
in
{
  system = [
    {
      package = "waybar";
      systemModulePathSuffix = null;
      homeModulePathSuffix = "/waybar/default.nix";
    }
  ];

  wrapped = [];

  font = [];

  flatpak = [];
}


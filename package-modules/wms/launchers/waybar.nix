let
  fontBase = import ../../fonts.nix;
in
{
  system = [];

  wrapped = [
    {
      package = "bemenu";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
    }
  ];

  font = [];

  flatpak = [];
}


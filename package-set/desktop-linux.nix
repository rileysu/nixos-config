let
  base = (import ./base-linux.nix);
in
{
  system = base.system ++ [
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
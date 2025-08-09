let
  base = (import ./base-linux.nix);
in
{
  system = base.system ++ [
    {
      packageID = "sway";
      modulePathSuffix = "/app/sway.nix";
    }
    {
      packageID = "wmenu";
      modulePathSuffix = null;
    }
  ];

  font = base.font ++ [];

  # Generic OS base does not have flatpak definitions
  flatpak = [
    {
      packageID = "org.mozilla.firefox";
      modulePathSuffix = "/app/firefox/flatpak.nix";
    }
  ];
}
let
    base = (import ./base.nix);
in
{
  system = base.system ++ [
    # Apps
    {
      packageID = "alacritty";
      modulePathSuffix = null;
    }
    
    # Utilities
    {
      packageID = "doas";
      modulePathSuffix = null;
    }
  ];

  font = base.font ++ [
    {
      packageID = "nerd-fonts.monaspace";
      modulePathSuffix = null;
    }
    {
      packageID = "roboto-mono";
      modulePathSuffix = null;
    }
  ];
}
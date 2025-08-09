let
    base = (import ./base.nix);
in
{
  system = base.system ++ [
    # Utilities
    {
      packageID = "doas";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
    }
    {
      packageID = "fastfetch";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
    }

    # Services
    {
      packageID = "pipewire";
      systemModulePathSuffix = "/service/pipewire.nix";
      homeModulePathSuffix = null;
    }
  ];

  user = base.user ++ [
    # Apps
    {
      packageID = "alacritty";
      systemModulePathSuffix = null;
      homeModulePathSuffix = "/app/alacritty.nix";
    }
  ];

  font = base.font ++ [
    {
      packageID = "nerd-fonts.monaspace";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
    }
    {
      packageID = "roboto-mono";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
    }
  ];

  # Generic OS base does not have flatpak definitions
  flatpak = [];
}
let
    base = (import ./base.nix);
in
{
  system = base.system ++ [
    # WM + WM Apps
    {
      packageID = "sway";
      systemModulePathSuffix = null;
      homeModulePathSuffix = "/app/sway.nix";
    }
    {
      packageID = "wmenu";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
    }
    {
      packageID = "mako";
      systemModulePathSuffix = null;
      homeModulePathSuffix = "/app/mako.nix";
    }

    # Greeter
    {
      packageID = "greetd";
      systemModulePathSuffix = "/service/greetd.nix";
      homeModulePathSuffix = null;
    }
    {
      packageID = "tuigreet";
      systemModulePathSuffix = null;
      homeModulePathSuffix = null;
    }
    

    # Utilities
    {
      packageID = "doas";
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
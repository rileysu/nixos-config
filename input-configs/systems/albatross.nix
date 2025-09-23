let
  utilities = import ./../utilities.nix;

  desktop = (import ./../desktops/sway-desktop.nix); 
in
builtins.foldl' utilities.deepMerge
  {}
  [
    desktop
    {
      system = {
        target = "x86_64-linux";
        hostname = "riley-laptop";
        hardware = "albatross";
      };

      time = {
        timezone = "Australia/Sydney";
      };

      locale = {
        default = "en_AU.UTF-8";
        extra = [ ];
      };

      theme = {
        name = "catppuccin_mocha";
        wallpaper = "storm.jpg";
      };

      user = {
        username = "riley";
        name = "Riley";
        email = "riley.d.sutton@gmail.com";
      };

      windowManager.displays = [
        {
          identifier = "AU Optronics 0x226D Unknown";
          mode = "1920x1080@60";
          allowTearing = true;
        }
      ];
    }
  ]

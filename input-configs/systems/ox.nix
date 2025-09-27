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
        hostname = "riley-desktop";
        hardware = "ox";
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
        wallpaper = "bars.jpg";
      };

      user = {
        username = "riley";
        name = "Riley";
        email = "riley.d.sutton@gmail.com";
      };

      windowManager.displays = [
        {
          identifier = "AOC 2460 Unknown";
          mode = "1920x1080@60";
          allowTearing = true;
        }
        {
          identifier = "ASUSTek COMPUTER INC VG27A R4LMQS078093";
          mode = "2560x1440@143.972";
          allowTearing = true;
        }
      ];
    }
  ]

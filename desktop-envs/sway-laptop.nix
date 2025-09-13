{
  name = "Sway Laptop";
  
  config = {
    packageModuleIDs = [
    "greeters/tuigreet"

    "window-managers/sway-laptop"
    "services/pipewire"
    "services/bluez"

    "shells/nushell"
    "editors/neovim"
    "terminals/alacritty"

    "general-cli-apps"

    "browsers/brave"
    "gaming/steam"
    "gaming/prismlauncher"
    ];

    greeter = {
      launchCommand = "sway";
    };

    shell = {
      defaultCommand = "nu";
    };

    editor = {
      defaultCommand = "nvim";
    };

    terminal = {
      defaultCommand = "alacritty";
    };
  
    windowManager = {
      volume.enabled = true;
      brightness.enabled = true;

      chooser = {
        defaultCommand = "bemenu";
        defaultRunCommand = "bemenu-run";
      };


      cursor = {
        enabled = true;
        
        themeName = "Bibata-Modern-Ice";
        size = 22;
      };
    };

    bar = {
      sound.enabled = true;
      brightness.enabled = true;
      battery.enabled = true;
    };
  };
}

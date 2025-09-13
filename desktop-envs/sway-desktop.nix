{
  name = "Sway Desktop";
  
  config = {
    packageModuleIDs = [
    "greeters/tuigreet"

    "window-managers/sway-desktop"
    "services/pipewire"
    
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
      brightness.enabled = false;

      chooser = {
        defaultCommand = "bemenu";
        defaultRunCommand = "bemenu-run";
      };

      cursor = {
        enabled = true;
        
        themeName = "Bibata-Modern-Ice";
        size = 22;
      };

      displays = [
        #{
        #  identifier = null;
        #  mode = null;
        #  allowTearing = false;
        #}
      ];
    };

    bar = {
      sound.enabled = true;
      brightness.enabled = false;
      battery.enabled = false;
    };
  };
}

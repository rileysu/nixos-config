{ lib, pkgs, userSettings, systemSettings }:
{
  name = "Sway Base";
  
  config = {
    packageModuleIDs = [
    "greeters/tuigreet"

    "window-managers/sway-desktop"
    
    "services/pipewire"
    "services/udisks"
    
    "shells/nushell"
    "editors/neovim"
    "terminals/alacritty"

    "editors/vscode"

    "general-cli-apps"

    "utilities/yazi"

    "development/gcc"
    "development/nix"
    "development/rust"

    "browsers/brave"

    "gaming/steam"
    "gaming/prismlauncher"
    "gaming/pcsx2"
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
      volume.enabled = false; 
      brightness.enabled = false;

      chooser = {
        defaultCommand = "bemenu";
        defaultRunCommand = "bemenu-run";
      };

      notificationDaemon = {
        enabled = true;        

        defaultCommand = "mako";
      };

      bar = {
        enabled = true;

        defaultCommand = "waybar";
        integrated = false;

        sound.enabled = false;
        brightness.enabled = false;
        battery.enabled = false;
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

  };
}    


{
  packageModuleIDs = [
    "greeters/tuigreet"

    "services/pipewire"
    "services/udisks"

    "shells/nushell"
    "editors/neovim"
    "terminals/alacritty"

    "editors/vscode"

    "general-cli-apps"

    "utilities/yazi"
    "utilities/pavucontrol"

    "development/gcc"
    "development/nix"
    "development/rust"

    "browsers/brave"

    "gaming/steam"
    "gaming/prismlauncher"
    "gaming/pcsx2"
  ];

  shell = {
    defaultCommand = "nu";
  };

  editor = {
    defaultCommand = "nvim";
  };

  terminal = {
    defaultCommand = "alacritty";
  };
}

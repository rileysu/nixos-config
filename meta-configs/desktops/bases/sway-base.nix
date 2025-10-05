let
  utilities = import ./../../utilities.nix;

  base = (import ./linux-graphical-base.nix);
in
utilities.deepMerge base {
  packageModuleIDs = [
    "window-managers/sway-desktop"
  ];

  greeter = {
    launchCommand = "sway";
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
}

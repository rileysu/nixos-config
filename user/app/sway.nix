{ config, lib, pkgs, userSettings, systemSettings, ... }:

{
  config = {
    wayland.windowManager.sway.enable = true;
    wayland.windowManager.sway.config = 
      let
        modifier = "Mod4";
        terminal = "alacritty";
      in {
        modifier = modifier;
        terminal = terminal;

        fonts = {
          names = [ "Roboto Mono" ];
          style = "Regular";
          size = 10.0;
        };

        keybindings = {
          # Launch
          "${modifier}+d" = "exec wmenu-run";
          "${modifier}+Return" = "exec ${terminal}";

          # Kill
          "${modifier}+Shift+q" = "kill";

          # Layout
          "${modifier}+r" = "mode resize";

          "${modifier}+s" = "split h";
          "${modifier}+v" = "split v";

          "${modifier}+q" = "layout stacking";
          "${modifier}+w" = "layout tabbed";
          "${modifier}+e" = "layout toggle split";

          "${modifier}+f" = "fullscreen toggle";

          "${modifier}+Shift+space" = "floating toggle";

          # Navigation
          "${modifier}+1" = "workspace 1";
          "${modifier}+2" = "workspace 2";
          "${modifier}+3" = "workspace 3";
          "${modifier}+4" = "workspace 4";
          "${modifier}+5" = "workspace 5";
          "${modifier}+6" = "workspace 6";
          "${modifier}+7" = "workspace 7";
          "${modifier}+8" = "workspace 8";
          "${modifier}+9" = "workspace 9";

          "${modifier}+period" = "workspace next";
          "${modifier}+comma" = "workspace prev";

          "${modifier}+Left" = "focus left";
          "${modifier}+Down" = "focus down";
          "${modifier}+Up" = "focus up";
          "${modifier}+Right" = "focus right";
          "${modifier}+h" = "focus left";
          "${modifier}+j" = "focus down";
          "${modifier}+k" = "focus up";
          "${modifier}+l" = "focus right";

          "${modifier}+space" = "focus mode_toggle";

          # Container Movement
          "${modifier}+Shift+1" = "move container to workspace 1";
          "${modifier}+Shift+2" = "move container to workspace 2";
          "${modifier}+Shift+3" = "move container to workspace 3";
          "${modifier}+Shift+4" = "move container to workspace 4";
          "${modifier}+Shift+5" = "move container to workspace 5";
          "${modifier}+Shift+6" = "move container to workspace 6";
          "${modifier}+Shift+7" = "move container to workspace 7";
          "${modifier}+Shift+8" = "move container to workspace 8";
          "${modifier}+Shift+9" = "move container to workspace 9";

          "${modifier}+Shift+period" = "move container to workspace next";
          "${modifier}+Shift+comma" = "move container to workspace prev";

          "${modifier}+Shift+Left" = "move left";
          "${modifier}+Shift+Down" = "move down";
          "${modifier}+Shift+Up" = "move up";
          "${modifier}+Shift+Right" = "move right";
          "${modifier}+Shift+h" = "move left";
          "${modifier}+Shift+j" = "move down";
          "${modifier}+Shift+k" = "move up";
          "${modifier}+Shift+l" = "move right";

          # Control
          "${modifier}+Shift+c" = "reload";
          "${modifier}+Shift+r" = "restart";
          "${modifier}+Shift+e" = "exit";

          # Special
          "XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"; #increase sound volume
          "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"; #decrease sound volume
          "XF86AudioMute" = "exec wpctl set-mut @DEFAULT_AUDIO_SINK@ toggle"; #mute speaker
          "XF86AudioMicMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"; #mute microphone
          "XF86MonBrightnessUp" = "exec brightnessctl set 5%+"; # increase screen brightness
          "XF86MonBrightnessDown" = "exec brightnessctl set 5%-"; # decrease screen brightness
        };
      };
  };
}
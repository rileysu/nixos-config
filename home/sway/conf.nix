{ themeNamed, inputConfig }:
let
    notificationDaemonModule = 
      if inputConfig.windowManager.notificationDaemon.enabled
      then "exec ${inputConfig.windowManager.notificationDaemon.defaultCommand}"
      else "";

    barModule =
      if inputConfig.windowManager.bar.enabled
      then 
        if !inputConfig.windowManager.bar.integrated
        then "exec ${inputConfig.windowManager.bar.defaultCommand}"
        else 
        ''
          bar {
              mode dock
              height 24
              position top
              font pango:Roboto Mono Regular 10

              status_command i3status-rs

              colors {
                  background #${themeNamed.background}
                  statusline #${themeNamed.foreground}
                  separator #${themeNamed.surface1}
                  
                  focused_workspace   #${themeNamed.foreground} #${themeNamed.foreground} #${themeNamed.background}
                  active_workspace    #${themeNamed.surface1} #${themeNamed.background} #${themeNamed.foreground}
                  inactive_workspace  #${themeNamed.surface1} #${themeNamed.background} #${themeNamed.foreground}
                  urgent_workspace    #${themeNamed.red} #${themeNamed.red} #${themeNamed.background}
                  binding_mode        #${themeNamed.green} #${themeNamed.green} #${themeNamed.background}
              }
          }
        ''
      else "";

    outputModule = builtins.concatStringsSep "\n" (builtins.map 
      (display: 
        ''
          output "${display.identifier}" mode ${display.mode}Hz allow_tearing ${if display.allowTearing then "yes" else "no"}
        '')
      inputConfig.windowManager.displays);

    wallpaperPath = ../../wallpapers/${inputConfig.theme.wallpaper};

    volumeModule =
        if inputConfig.windowManager.volume.enabled
        then
            ''
                # Special Volume
                bindsym XF86AudioRaiseVolume exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
                bindsym XF86AudioLowerVolume exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
                bindsym XF86AudioMute exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
                bindsym XF86AudioMicMute exec wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle 
            ''
        else "";

    brightnessModule =
        if inputConfig.windowManager.brightness.enabled
        then
            ''
                # Special Brightness
                bindsym XF86MonBrightnessUp exec brightnessctl set 5%+
                bindsym XF86MonBrightnessDown exec brightnessctl set 5%-
            ''
        else "";

    volumeAndBrightnessModeModule =
        if inputConfig.windowManager.volume.enabled || inputConfig.windowManager.brightness.enabled
        then
          let
            volumeSub = if inputConfig.windowManager.volume.enabled then
            ''
                bindsym h exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
                bindsym l exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
                bindsym m exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
                bindsym Shift+m exec wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle 
            '' else "";
            volumeDescSub = if inputConfig.windowManager.volume.enabled 
              then " (h) volume -, (l) volume +, (m) mute out, (Shift+m) mute in"
              else "";

            brightnessSub = if inputConfig.windowManager.brightness.enabled then
            ''
                bindsym j exec brightnessctl set 5%-
                bindsym k exec brightnessctl set 5%+
            '' else "";
            brightnessDescSub = if inputConfig.windowManager.brightness.enabled
              then " (j) birghtness -, (k) brightness +"
              else "";
          in
          ''
            # Volume and Brightness
            set $volume_and_brightness "Volume + Brightness${volumeDescSub}${brightnessDescSub}" 
            mode $volume_and_brightness {
                ${volumeSub}

                ${brightnessSub}

                bindsym Return mode "default"
                bindsym Escape mode "default"
            }
            bindsym $mod+Shift+v mode $volume_and_brightness
          '' else "";
    
    cursorModule = 
        if inputConfig.windowManager.cursor.enabled
        then
            ''
                #Set Cursor
                seat seat0 xcursor_theme ${inputConfig.windowManager.cursor.themeName} ${builtins.toString inputConfig.windowManager.cursor.size}
            ''
        else "";
in
''
include /etc/sway/config.d/*

## General ##

# Output
${outputModule}

# Set wallpaper
output * background ${wallpaperPath} fill

${cursorModule}

# Variables
set $mod Mod4
set $terminal alacritty

# Notification Daemon
${notificationDaemonModule}

# Bar
${barModule}

# Font configuration
font pango:Roboto Mono Regular 10

# Window settings
default_border pixel 1
default_floating_border pixel 1

# Gaps
smart_borders no_gaps
smart_gaps on
gaps inner 8

## Theme ##

# Colors
client.focused          #${themeNamed.yellow} #${themeNamed.background} #${themeNamed.foreground} #${themeNamed.yellow} #${themeNamed.yellow}
client.focused_inactive #${themeNamed.foreground} #${themeNamed.background} #${themeNamed.foreground} #${themeNamed.foreground} #${themeNamed.foreground}
client.unfocused        #${themeNamed.foreground} #${themeNamed.background} #${themeNamed.foreground} #${themeNamed.foreground} #${themeNamed.foreground}
client.urgent           #${themeNamed.red} #${themeNamed.background} #${themeNamed.foreground} #${themeNamed.red} #${themeNamed.red}
client.placeholder      #${themeNamed.blue} #${themeNamed.background} #${themeNamed.foreground} #${themeNamed.blue} #${themeNamed.blue}

## Control ##

# Movement
floating_modifier $mod normal
tiling_drag disable

## Key bindings ##

# Launch
bindsym $mod+d exec bemenu-run
bindsym $mod+Return exec $terminal

# Kill
bindsym $mod+Shift+q kill

# Layout
bindsym $mod+s splith
bindsym $mod+v splitv
bindsym $mod+q layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split
bindsym $mod+f fullscreen toggle
bindsym $mod+Shift+space floating toggle

# Navigation
bindsym $mod+1 workspace 1
bindsym $mod+2 workspace 2
bindsym $mod+3 workspace 3
bindsym $mod+4 workspace 4
bindsym $mod+5 workspace 5
bindsym $mod+6 workspace 6
bindsym $mod+7 workspace 7
bindsym $mod+8 workspace 8
bindsym $mod+9 workspace 9
bindsym $mod+period workspace next
bindsym $mod+comma workspace prev
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right
bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right
bindsym $mod+space focus mode_toggle

# Container Movement
bindsym $mod+Shift+1 move container to workspace 1
bindsym $mod+Shift+2 move container to workspace 2
bindsym $mod+Shift+3 move container to workspace 3
bindsym $mod+Shift+4 move container to workspace 4
bindsym $mod+Shift+5 move container to workspace 5
bindsym $mod+Shift+6 move container to workspace 6
bindsym $mod+Shift+7 move container to workspace 7
bindsym $mod+Shift+8 move container to workspace 8
bindsym $mod+Shift+9 move container to workspace 9
bindsym $mod+Shift+period move container to workspace next
bindsym $mod+Shift+comma move container to workspace prev
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right
bindsym $mod+Shift+h move left
bindsym $mod+Shift+j move down
bindsym $mod+Shift+k move up
bindsym $mod+Shift+l move right

# Control
bindsym $mod+Shift+c reload
bindsym $mod+Shift+r restart

${volumeModule}

${brightnessModule}

## Modes ##
# Resize
mode "resize" {
    bindsym h resize shrink width 10 px or 10 ppt
    bindsym j resize shrink height 10 px or 10 ppt
    bindsym k resize grow height 10 px or 10 ppt
    bindsym l resize grow width 10 px or 10 ppt
    bindsym semicolon resize grow width 10 px or 10 ppt

    bindsym Left resize shrink width 10 px or 10 ppt
    bindsym Down resize shrink height 10 px or 10 ppt
    bindsym Up resize grow height 10 px or 10 ppt
    bindsym Right resize grow width 10 px or 10 ppt

    bindsym Return mode "default"
    bindsym Escape mode "default"
}
bindsym $mod+r mode resize

${volumeAndBrightnessModeModule}

# Exit
set $lock_command swaylock -f -e
set $mode_exit System (l) lock, (e) exit, (s) suspend, (h) hibernate, (r) reboot, (Shift+s) shutdown
mode "$mode_exit" {
    bindsym l exec $lock_command, mode "default"
    bindsym e exec swaymsg exit, mode "default"
    bindsym s exec systemctl suspend && $lock_command, mode "default"
    bindsym h exec systemctl hibernate && $lock_command, mode "default"
    bindsym r exec systemctl reboot, mode "default"
    bindsym Shift+s exec systemctl poweroff, mode "default"

    # back to normal: Enter or Escape
    bindsym Return mode "default"
    bindsym Escape mode "default"
}
bindsym $mod+Shift+e mode "$mode_exit"

# Screenshot
set $mode_screenshot Screenshot (e) entire, (s) section, (Shift+e) entire save, (Shift+s) section save
mode "$mode_screenshot" {
    bindsym e exec grim - | wl-copy -t image/png, mode "default"
    bindsym s exec grim -g "$(slurp)" - | wl-copy -t image/png, mode "default"
    bindsym Shift+e exec grim "$HOME/Screenshots/$(date +'%Y-%m-%d-%H%M%S_capture.png')", mode "default"
    bindsym Shift+s exec grim -g "$(slurp)" "$HOME/Screenshots/$(date +'%Y-%m-%d-%H%M%S_capture.png')", mode "default"

    # back to normal: Enter or Escape
    bindsym Return mode "default"
    bindsym Escape mode "default"
}
bindsym Print mode "$mode_screenshot"
''

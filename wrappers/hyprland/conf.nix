{ theme, config }:
''
# Output
monitor = , preferred, auto, 1

# Launch Services
exec-once = hyprpaper
exec-once = hyprlock

# Basic settings
$mod = SUPER
$terminal = alacritty

# Startup commands
exec-once = mako

# Window settings
general {
    border_size = 1
    gaps_in = 5
    gaps_out = 10
    border_color = rgb(${theme.blue})
}

decoration {
    rounding = 0
    drop_shadow = false
}

# Colors
client {
    focused = rgb(${theme.brightYellow}), rgb(${theme.brightYellow}), rgb(${theme.foreground}), rgb(${theme.brightYellow}), rgb(${theme.brightYellow})
    focused_inactive = rgb(${theme.brightBlue}), rgb(${theme.brightBlue}), rgb(${theme.foreground}), rgb(${theme.brightBlue}), rgb(${theme.brightBlue})
    unfocused = rgb(${theme.blue}), rgb(${theme.blue}), rgb(${theme.foreground}), rgb(${theme.blue}), rgb(${theme.blue})
    urgent = rgb(${theme.brightRed}), rgb(${theme.brightRed}), rgb(${theme.foreground}), rgb(${theme.brightRed}), rgb(${theme.brightRed})
}

# Gestures
gestures {
    workspace_swipe = true
    workspace_swipe_fingers = 3
}

# Key bindings
# Launch
bind = $mod, d, exec, wmenu-run
bind = $mod, RETURN, exec, $terminal

# Kill
bind = $mod SHIFT, q, killactive

# Layout
bind = $mod, r, submap, resize
bind = $mod, s, splitratio, +0.1
bind = $mod, v, splitratio, -0.1
bind = $mod, q, layoutmsg, orientationtop
bind = $mod, w, layoutmsg, orientationleft
bind = $mod, e, togglesplit
bind = $mod, f, fullscreen
bind = $mod SHIFT, SPACE, togglefloating

# Navigation
bind = $mod, 1, workspace, 1
bind = $mod, 2, workspace, 2
bind = $mod, 3, workspace, 3
bind = $mod, 4, workspace, 4
bind = $mod, 5, workspace, 5
bind = $mod, 6, workspace, 6
bind = $mod, 7, workspace, 7
bind = $mod, 8, workspace, 8
bind = $mod, 9, workspace, 9
bind = $mod, period, workspace, e+1
bind = $mod, comma, workspace, e-1
bind = $mod, left, movefocus, l
bind = $mod, down, movefocus, d
bind = $mod, up, movefocus, u
bind = $mod, right, movefocus, r
bind = $mod, h, movefocus, l
bind = $mod, j, movefocus, d
bind = $mod, k, movefocus, u
bind = $mod, l, movefocus, r

# Container Movement
bind = $mod SHIFT, 1, movetoworkspace, 1
bind = $mod SHIFT, 2, movetoworkspace, 2
bind = $mod SHIFT, 3, movetoworkspace, 3
bind = $mod SHIFT, 4, movetoworkspace, 4
bind = $mod SHIFT, 5, movetoworkspace, 5
bind = $mod SHIFT, 6, movetoworkspace, 6
bind = $mod SHIFT, 7, movetoworkspace, 7
bind = $mod SHIFT, 8, movetoworkspace, 8
bind = $mod SHIFT, 9, movetoworkspace, 9
bind = $mod SHIFT, period, movetoworkspace, e+1
bind = $mod SHIFT, comma, movetoworkspace, e-1
bind = $mod SHIFT, left, movewindow, l
bind = $mod SHIFT, down, movewindow, d
bind = $mod SHIFT, up, movewindow, u
bind = $mod SHIFT, right, movewindow, r
bind = $mod SHIFT, h, movewindow, l
bind = $mod SHIFT, j, movewindow, d
bind = $mod SHIFT, k, movewindow, u
bind = $mod SHIFT, l, movewindow, r

# Control
bind = $mod SHIFT, c, exec, hyprctl reload
bind = $mod SHIFT, r, exec, hyprctl restart
bind = $mod SHIFT, e, exit

# Special
bind = , XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
bind = , XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
bind = , XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
bind = , XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
bind = , XF86MonBrightnessUp, exec, brightnessctl set 5%+
bind = , XF86MonBrightnessDown, exec, brightnessctl set 5%-
''

{ userSettings, systemSettings, theme }:
''
## General ##

# Set wallpaper
output * background ~/.wallpapers/${userSettings.wallpaper} fill

# Variables
set $mod Mod4
set $terminal alacritty

# Startup commands
exec mako

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
client.focused          #${theme.brightYellow} #${theme.background} #${theme.foreground} #${theme.brightYellow} #${theme.brightYellow}
client.focused_inactive #${theme.foreground} #${theme.background} #${theme.foreground} #${theme.foreground} #${theme.foreground}
client.unfocused        #${theme.foreground} #${theme.background} #${theme.foreground} #${theme.foreground} #${theme.foreground}
client.urgent           #${theme.brightRed} #${theme.background} #${theme.foreground} #${theme.brightRed} #${theme.brightRed}
client.placeholder      #${theme.blue} #${theme.background} #${theme.foreground} #${theme.blue} #${theme.blue}

# Bar
bar {
    mode dock
    height 24
    position top
    font pango:Roboto Mono Regular 10

    status_command i3status-rs

    colors {
        background #${theme.background}
        statusline #${theme.foreground}
        separator #${theme.black}
        
        focused_workspace   #${theme.foreground} #${theme.foreground} #${theme.background}
        active_workspace    #${theme.black} #${theme.background} #${theme.foreground}
        inactive_workspace  #${theme.black} #${theme.background} #${theme.foreground}
        urgent_workspace    #${theme.brightRed} #${theme.brightRed} #${theme.background}
        binding_mode        #${theme.brightRed} #${theme.brightRed} #${theme.background}
    }
}

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
bindsym $mod+r mode resize
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
bindsym $mod+Shift+e exit

# Special
bindsym XF86AudioRaiseVolume exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
bindsym XF86AudioLowerVolume exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
bindsym XF86AudioMute exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
bindsym XF86AudioMicMute exec wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
bindsym XF86MonBrightnessUp exec brightnessctl set 5%+
bindsym XF86MonBrightnessDown exec brightnessctl set 5%-
''
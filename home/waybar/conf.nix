{ userSettings, systemSettings, themeNamed, desktopEnvConfig }:
''
{
    "spacing": 0,

    "modules-left": [
        "sway/workspaces",
        "sway/mode"
    ],
    "modules-center": [
        "sway/window"
    ],
    "modules-right": [
        //"cpu",
        //"memory",
        "backlight",
        "wireplumber",
        "battery",
        //"network",
        "clock",
        //"custom/power",
        //"idle_inhibitor",
        "tray"
    ],

    "backlight": {
        "format": "{icon} {percent}%",
        "format-icons": ["🔅", "🔆"]
    },

    "pulseaudio": {
        "format": "{icon} {volume}%",
        "format-muted": " {format_source}",
        "format-source": " {volume}%",
        "format-source-muted": "",
        "format-icons": ["", "", ""],
        "on-click": "helvum"
    },

    "battery": {
        "states": {
            "warning": 30,
            "critical": 15
        },
        "interval": 1,
        "format": "{icon} {capacity}%",
        "format-charging": "⚡ {capacity}%",
        "format-icons": ["", "", "", "", ""]
    },

    "clock": {
        "interval": 30,
        "format": "{:%a, %d %b %Y | %H:%M %p}",
        "tooltip-format": "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>"
    },

    "tray": {
        "spacing": 10
    }
}
''

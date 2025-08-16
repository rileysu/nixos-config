{ userSettings, systemSettings, theme }:
''
[theme]
theme = "native"

[icons]
icons = "material-nf"

[[block]]
device = "BAT1"
block = "battery"
interval = 10

[[block]]
device = "BAT0"
block = "battery"
interval = 10

[[block]]
block = "backlight"
device = "intel_backlight"

[[block]]
block = "sound"
step_width = 0
driver = "pulseaudio"

[[block]]
block = "time"
interval = 5
''
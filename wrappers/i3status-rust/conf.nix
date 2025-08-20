{ userSettings, systemSettings, theme, desktopEnvConfig }:
let
  batteryModule =
    if desktopEnvConfig.bar.battery.enabled
    then
      ''
        [[block]]
        device = "BAT1"
        block = "battery"
        interval = 10

        [[block]]
        device = "BAT0"
        block = "battery"
        interval = 10
      ''
    else "";

  brightnessModule =
    if desktopEnvConfig.bar.brightness.enabled
    then
      ''
        [[block]]
        block = "backlight"
        device = "intel_backlight"
      ''
    else "";

  volumeModule = 
    if desktopEnvConfig.bar.sound.enabled
    then
      ''
        [[block]]
        block = "sound"
        step_width = 0
        driver = "pulseaudio"
      ''
    else "";
in
''
[theme]
theme = "native"

[icons]
icons = "material-nf"

${batteryModule}

${brightnessModule}

${volumeModule}

[[block]]
block = "time"
interval = 5
''
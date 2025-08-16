{ userSettings, systemSettings, theme }:
''
[font]
normal.family = "MonaspiceNe Nerd Font"
normal.style = "Medium"
bold.family = "MonaspiceNe Nerd Font"
bold.style = "Bold"
italic.family = "MonaspiceNe Nerd Font"
italic.style = "Italic"
bold_italic.family = "MonaspiceNe Nerd Font"
bold_italic.style = "Bold Italic"
size = 10.0

[colors.primary]
background = "#${theme.background}"
foreground = "#${theme.foreground}"

[colors.normal]
black = "#${theme.black}"
red = "#${theme.red}"
green = "#${theme.green}"
yellow = "#${theme.yellow}"
blue = "#${theme.blue}"
magenta = "#${theme.magenta}"
cyan = "#${theme.cyan}"
white = "#${theme.white}"

[colors.bright]
black = "#${theme.brightBlack}"
red = "#${theme.brightRed}"
green = "#${theme.brightGreen}"
yellow = "#${theme.brightYellow}"
blue = "#${theme.brightBlue}"
magenta = "#${theme.brightMagenta}"
cyan = "#${theme.brightCyan}"
white = "#${theme.brightWhite}"

[window]
opacity = 0.9
''
{ userSettings, systemSettings, themeNamed }:
''
max-visible=8
sort=-time
layer=top
anchor=top-right
font=Roboto Mono Regular 10
background-color=#${themeNamed.background}
text-color=#${themeNamed.foreground}
width=256
height=128
margin=16
padding=8
border-size=1
border-radius=0
progress-color=over #${themeNamed.surface1}


[urgency=low]
border-color=#${themeNamed.green}

[urgency=normal]
border-color=#${themeNamed.yellow}

[urgency=critical]
border-color=#${themeNamed.red}
''
{ userSettings, systemSettings, theme }:
''
max-visible=8
sort=-time
layer=top
anchor=top-right
font=Roboto Mono Regular 10
background-color=#${theme.background}
text-color=#${theme.foreground}
width=256
height=128
margin=16
padding=8
border-size=1
border-radius=0
progress-color=over #${theme.black}


[urgency=low]
border-color=#${theme.brightGreen}

[urgency=normal]
border-color=#${theme.brightYellow}

[urgency=critical]
border-color=#${theme.brightRed}
''
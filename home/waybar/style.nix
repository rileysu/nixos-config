{ themeNamed, config }:
''
* {
    font-family: "Roboto Mono", monospace;
    font-size: 12px;
    margin: 0;
    padding: 0;
    border: none;
    border-radius: 0;
    box-shadow: none;
    text-shadow: none;
}

window#waybar {
    background-color: #${themeNamed.background};
    color: #${themeNamed.foreground};
    transition: background-color 0.5s;
    padding: 0 8px; 
}

window#waybar.hidden {
    opacity: 0.2;
}

#clock,
#battery,
#cpu,
#memory,
#backlight,
#network,
#wireplumber,
#tray,
#mode,
#idle_inhibitor,
#keyboard-state,
#scratchpad {
    background-color: #${themeNamed.surface0};
    color: #${themeNamed.foreground};
    border: 1px solid #${themeNamed.surface2};
    padding: 4px 8px;
}

#battery.charging {
    background-color: #${themeNamed.green};
    color: #${themeNamed.background};
    border-color: #${themeNamed.green};
}

#battery.critical:not(.charging) {
    background-color: #${themeNamed.red};
    color: #${themeNamed.background};
    border-color: #${themeNamed.red};
}

#mode {
    background-color: #${themeNamed.green};
    color: #${themeNamed.background};
    border-color: #${themeNamed.green};
}

#workspaces button { 
    min-width: 0;
    min-height: 0;
    margin: 0;
    background-color: #${themeNamed.surface0};
    color: #${themeNamed.foreground};
    border: 1px solid #${themeNamed.surface2};
    padding: 4px 8px;
}

#workspaces button:hover {
    background: none;
    background-color: #${themeNamed.surface2}; 
    color: #${themeNamed.foreground};
    border: 1px solid #${themeNamed.surface2};
}

#workspaces button.focused {
    background-color: #${themeNamed.foreground}; 
    color: #${themeNamed.background};
    border: 1px solid #${themeNamed.foreground};
}

#workspaces button.urgent {
    background-color: #${themeNamed.red};
    color: #${themeNamed.background};
    border: 1px solid #${themeNamed.red};
}

label:focus {
    background-color: #${themeNamed.background};
}
''

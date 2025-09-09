{ userSettings, systemSettings, themeNamed, desktopEnvConfig }:
''
mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu
source ~/.cache/carapace/init.nu
''
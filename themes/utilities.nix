{
  getTheme = { userSettings }: (import ./${userSettings.theme}.nix);
  
  # https://github.com/chriskempson/base16/blob/main/styling.md
  toNamed = { theme }:
    {
      background = theme.base00;
      lightBackground = theme.base01;
      surface0 = theme.base02;
      surface1 = theme.base03;
      surface2 = theme.base04;
      foreground = theme.base05;
      altForeground = theme.base06;
      altBackground = theme.base07;
      red = theme.base08;
      orange = theme.base09;
      yellow = theme.base0A;
      green = theme.base0B;
      aqua = theme.base0C;
      blue = theme.base0D;
      purple = theme.base0E;
      brown = theme.base0F;
    };

  toANSI = { theme }:
    {
      black = theme.base00;
      red = theme.base08;
      green = theme.base0B;
      yellow = theme.base0A;
      blue = theme.base0D;
      magenta = theme.base0F;
      cyan = theme.base0C;
      white = theme.base04;
      brightBlack = theme.base01;
      brightRed = theme.base08;
      brightGreen = theme.base0B;
      brightYellow = theme.base0A;
      brightBlue = theme.base0D;
      brightMagenta = theme.base0F;
      brightCyan = theme.base0C;
      brightWhite = theme.base05;
    };
}
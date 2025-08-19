{
  getDesktopEnvName = { profile }:
    (import ./${profile}.nix).name;

  getDesktopEnvConfig = { profile }:
    (import ./${profile}.nix).config;
}
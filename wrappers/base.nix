{ config, lib, pkgs, metaConfigProfile, ... }: 
let
  metaConfigUtilities = (import ../meta-configs/utilities.nix);
  metaConfigOptions = metaConfigUtilities.getOptions { inherit lib; };
  metaConfig = metaConfigUtilities.importProfile { profile = metaConfigProfile; };
in
{
  imports = [
    ./alacritty/default.nix
    ./bemenu/default.nix
    ./fish/default.nix
    ./hyprland/default.nix
    ./hyprlock/default.nix
    ./hyprpaper/default.nix
    ./i3status-rust/default.nix
    ./mako/default.nix
    ./neovim/default.nix
    ./nushell/default.nix
    ./sway/default.nix
    ./swaylock/default.nix
  ];

  options = {
    metaConfig = metaConfigOptions;
  };

  config = {
    inherit metaConfig;
  };
}
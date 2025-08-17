{ config, lib, pkgs, userSettings, systemSettings, ... }: {
  imports = [
    ./alacritty/default.nix
    ./bemenu/default.nix
    ./fish/default.nix
    ./hyprland/default.nix
    ./hyprlock/default.nix
    ./hyprpaper/default.nix
    ./i3status-rust/default.nix
    ./mako/default.nix
    ./nushell/default.nix
    ./sway/default.nix
    ./swaylock/default.nix
  ];
}
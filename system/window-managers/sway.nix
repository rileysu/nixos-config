{ config, lib, pkgs, themeNamed, ... }:
let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { theme = config.metaConfig.theme.name; };
    themeNamed = themeUtilities.toNamed { inherit theme; };
in
{
  config = {
    programs.sway = {
      enable = true;
      package = null;
    };

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
      ];
      config.common.default = [ "wlr" ];

      wlr.enable = true;
      wlr.settings.screencast = {
        max_fps = 60;
        chooser_type = "dmenu";
        chooser_cmd = "/run/current-system/sw/bin/bemenu";
      };
    };
  };
}

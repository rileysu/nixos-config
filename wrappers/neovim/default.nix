{ config, lib, pkgs, ... }: 
  let
    themeUtilities = (import ../../themes/utilities.nix);
    theme = themeUtilities.getTheme { theme = config.metaConfig.theme.name; };
    themeNamed = themeUtilities.toNamed { inherit theme; };

    conf = pkgs.writeText "init.lua" ((import ./conf.nix) { inherit pkgs themeNamed config; });
  in {
    config = {
      wrappers.neovim = {
        basePackage = pkgs.neovim;

        programs.nvim = {
          prependFlags = [
            "-u"
            "${conf}"
          ];
        };
      };
    };
  }
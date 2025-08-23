# https://breuer.dev/blog/nix-lazy-neovim
{ config, lib, pkgs, userSettings, systemSettings, ... }:
let
  modules = [

  ];
in
{
  config = {
    programs.neovim = {
      enable = true;

      configure = {
        packages.myVimPackage = with pkgs.vimPlugins; {
          start = [
            lazy-nvim
          ];

          opt = [ ];
        };

        # https://github.com/breuerfelix/feovim/blob/main/flake.nix
        customLuaRC =
          ''
            require("lazy").setup({
              rocks = { enabled = False },
              pkg = { enable = False },
              install = { missing = False },
              change_detection = { enabled = false },
              spec = {
                -- TODO  
              },
            })
          '';
      };
    };
  };
}
# https://breuer.dev/blog/nix-lazy-neovim
{ config, lib, pkgs, userSettings, systemSettings, ... }:
let
  modules = [
    
  ]
in
{
  config = {
    programs.neovim = {
      plugins = with pkgs.vimPlugins [
        lazy-nvim
      ];


      # https://github.com/breuerfelix/feovim/blob/main/flake.nix
      extraLuaConfig =
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
        ''
    };
  };
}
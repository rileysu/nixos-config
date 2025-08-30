# Ref
# https://github.com/breuerfelix/feovim/blob/main/flake.nix
# https://breuer.dev/blog/nix-lazy-neovim
{ pkgs, userSettings, systemSettings, themeNamed }:
let
  lazyPlugins = [
    ./colorscheme.nix
    ./ui.nix
  ];
  lazySpec = builtins.concatStringsSep "\n" (builtins.map (x: ((import x) { inherit pkgs; })) lazyPlugins);
in
''
vim.opt.runtimepath:append("${pkgs.vimPlugins.lazy-nvim}")
require("lazy").setup({
  -- disable all update / install features
  -- this is handled by nix
  rocks = { enabled = false },
  pkg = { enabled = false },
  install = { missing = false },
  change_detection = { enabled = false },
  spec = {
    ${lazySpec}
  },
})

vim.cmd.colorscheme("catppuccin-mocha")
''
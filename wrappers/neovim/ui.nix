{ pkgs }:
''
-- BUFFERLINE
{
  dir = "${pkgs.vimPlugins.bufferline-nvim}",
  name = "akinsho/bufferline.nvim",
},

-- LUALINE
{
  dir = "${pkgs.vimPlugins.lualine-nvim}",
  name = "nvim-lualine/lualine.nvim",
},
''
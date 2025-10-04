{ themeNamed, config }:
''
return {
  {
    -- TREESITTER
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = {}
    end,
  },
}
''

#https://github.com/yazi-rs/flavors/blob/main/catppuccin-mocha.yazi/flavor.toml
{ themeNamed, config }:
''
  [mgr]
  cwd = { fg = "#${themeNamed.aqua}" }

  # Hovered
  hovered         = { reversed = true }
  preview_hovered = { underline = true }
  
  # Find
  find_keyword = { fg = "#${themeNamed.yellow}", bold = true, italic = true, underline = true }
  find_position = { fg = "#${themeNamed.altForeground}", bh = "reset", bold = true, italic = true }

  # Marker
  marker_copied   = { fg = "#${themeNamed.green}", bg = "#${themeNamed.green}" }
  marker_cut      = { fg = "#${themeNamed.red}", bg = "#${themeNamed.red}" }
  marker_marked   = { fg = "#${themeNamed.aqua}", bg = "#${themeNamed.aqua}" }
  marker_selected = { fg = "#${themeNamed.yellow}", bg = "#${themeNamed.yellow}" }

# Count
  count_copied   = { fg = "#${themeNamed.background}", bg = "#${themeNamed.green}" }
  count_cut      = { fg = "#${themeNamed.background}", bg = "#${themeNamed.red}" }
  count_selected = { fg = "#${themeNamed.background}", bg = "#${themeNamed.yellow}" }

# Border
  border_symbol = "│"
  border_style  = { fg = "#${themeNamed.surface2}" }

# : }}}


# : Tabs {{{

  [tabs]
  active   = { fg = "#${themeNamed.background}", bg = "#${themeNamed.blue}", bold = true }
  inactive = { fg = "#${themeNamed.blue}", bg = "#${themeNamed.surface0}" }

# : }}}


# : Mode {{{

  [mode]

  normal_main = { fg = "#${themeNamed.background}", bg = "#${themeNamed.blue}", bold = true }
  normal_alt  = { fg = "#${themeNamed.blue}", bg = "#${themeNamed.surface0}" }

# Select mode
  select_main = { fg = "#${themeNamed.background}", bg = "#${themeNamed.aqua}", bold = true }
  select_alt  = { fg = "#${themeNamed.aqua}", bg = "#${themeNamed.surface0}" }

# Unset mode
  unset_main = { fg = "#${themeNamed.background}", bg = "#${themeNamed.brown}", bold = true }
  unset_alt  = { fg = "#${themeNamed.brown}", bg = "#${themeNamed.surface0}" }

# : }}}


# : Status bar {{{

  [status]
# Permissions
  perm_sep   = { fg = "#${themeNamed.surface2}" }
  perm_type  = { fg = "#${themeNamed.blue}" }
  perm_read  = { fg = "#${themeNamed.yellow}" }
  perm_write = { fg = "#${themeNamed.red}" }
  perm_exec  = { fg = "#${themeNamed.green}" }

# Progress
  progress_label  = { fg = "#ffffff", bold = true }
  progress_normal = { fg = "#${themeNamed.blue}", bg = "#${themeNamed.surface1}" }
  progress_error  = { fg = "#${themeNamed.blue}", bg = "#${themeNamed.red}" }

# : }}}


# : Pick {{{

  [pick]
  border   = { fg = "#${themeNamed.blue}" }
  active   = { fg = "#${themeNamed.orange}", bold = true }
  inactive = {}

# : }}}


# : Input {{{

  [input]
  border   = { fg = "#${themeNamed.blue}" }
  title    = {}
  value    = {}
  selected = { reversed = true }

# : }}}


# : Completion {{{

  [cmp]
  border = { fg = "#${themeNamed.blue}" }

# : }}}


# : Tasks {{{

  [tasks]
  border  = { fg = "#${themeNamed.blue}" }
  title   = {}
  hovered = { fg = "#${themeNamed.orange}", bold = true }

# : }}}


# : Which {{{

  [which]
  mask            = { bg = "#${themeNamed.surface0}" }
  cand            = { fg = "#${themeNamed.aqua}" }
  rest            = { fg = "#9399b2" }
  desc            = { fg = "#${themeNamed.orange}" }
  separator       = "  "
  separator_style = { fg = "#585b70" }

# : }}}


# : Help {{{

  [help]
  on      = { fg = "#${themeNamed.aqua}" }
  run     = { fg = "#${themeNamed.orange}" }
  hovered = { reversed = true, bold = true }
  footer  = { fg = "#${themeNamed.surface0}", bg = "#${themeNamed.foreground}" }

# : }}}


# : Spotter {{{

  [spot]
  border   = { fg = "#${themeNamed.blue}" }
  title    = { fg = "#${themeNamed.blue}" }
  tbl_col  = { fg = "#${themeNamed.aqua}" }
  tbl_cell = { fg = "#${themeNamed.orange}", bg = "#${themeNamed.surface1}" }

# : }}}


# : Notification {{{

  [notify]
  title_info  = { fg = "#${themeNamed.green}" }
  title_warn  = { fg = "#${themeNamed.yellow}" }
  title_error = { fg = "#${themeNamed.red}" }

# : }}}


# : File-specific styles {{{

  [filetype]

  rules = [
    # Images
    { mime = "image/*", fg = "#${themeNamed.aqua}" },

    # Media
    { mime = "{audio,video}/*", fg = "#${themeNamed.yellow}" },

    # Archives
    { mime = "application/{zip,rar,7z*,tar,gzip,xz,zstd,bzip*,lzma,compress,archive,cpio,arj,xar,ms-cab*}", fg = "#${themeNamed.orange}" },

    # Documents
    { mime = "application/{pdf,doc,rtf}", fg = "#${themeNamed.green}" },

    # Fallback
    { url = "*", fg = "#${themeNamed.foreground}" },
    { url = "*/", fg = "#${themeNamed.blue}" },

    # TODO: remove
    { name = "*", fg = "#${themeNamed.foreground}" },
    { name = "*/", fg = "#${themeNamed.blue}" }
  ]

# : }}}
''

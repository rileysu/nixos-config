let
  base = import ./bases/sway-base.nix;
in {
  system = base.system ++ [

  ];

  wrapped = base.wrapped ++ [

  ];

  font = base.font ++ [

  ];

  flatpak = base.flatpak ++ [

  ];
}
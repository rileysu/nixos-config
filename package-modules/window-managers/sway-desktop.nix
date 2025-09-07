let
  base = import ./sway-base.nix;
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
rec {
  # The package module id is just the relative path from the package-modules dir
  getPackageModules = { packageModuleIDs }:
    builtins.map (x: (import ./${x}.nix)) packageModuleIDs;

  # TODO
  # Need to remove duplicate package defs
  # Need to remove duplicates between wrapped and system (maybe wrapped can have higher priority than system)
  # Need to remove duplicate module imports
  combinePackageModules = { packageModules }:
    builtins.foldl' (xs: x: { system = xs.system ++ x.system; wrapped = xs.wrapped ++ x.wrapped; font = xs.font ++ x.font; flatpak = xs.flatpak ++ x.flatpak; }) { system = []; wrapped = []; font = []; flatpak = []; } packageModules;

  genPackage = { pkgs, path }:
    let
      parts = builtins.filter (x: builtins.isString x) (builtins.split "\\." path);
    in
    builtins.foldl' (set: key: builtins.getAttr key set) pkgs parts;

  genSystemPackages = { pkgs, packageModule }: 
    builtins.map (x: genPackage { inherit pkgs; path = x.packageID; }) packageModule.system;

  genWrappedPackages = { pkgs, packageModule }: 
    builtins.map (x: genPackage { inherit pkgs; path = x.packageID; }) packageModule.wrapped;

  genFontPackages = { pkgs, packageModule }: 
    builtins.map (x: genPackage { inherit pkgs; path = x.packageID; }) packageModule.font;

  genFlatpakPackages = { pkgs, packageModule }: 
    builtins.map (x: x.packageID) packageModule.flatpak;

  genModulePaths = { prefix, packageModule, attr }: 
    builtins.map 
      (x: prefix + x.${attr}) 
      (builtins.filter 
        (x: x.${attr} != null) 
        (builtins.concatLists (builtins.attrValues packageModule))
      );

  genSystemModulePaths = { prefix, packageModule }: 
    genModulePaths { inherit prefix; inherit packageModule; attr = "systemModulePathSuffix"; };

  genHomeModulePaths = { prefix, packageModule }: 
    genModulePaths { inherit prefix; inherit packageModule; attr = "homeModulePathSuffix"; };
}
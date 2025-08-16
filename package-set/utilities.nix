rec {
  genPackage = { pkgs, path }:
    let
      parts = builtins.filter (x: builtins.isString x) (builtins.split "\\." path);
    in
    builtins.foldl' (set: key: builtins.getAttr key set) pkgs parts;

  genSystemPackages = { pkgs, packageSet }: 
    builtins.map (x: genPackage { inherit pkgs; path = x.packageID; }) packageSet.system;

  genWrappedPackages = { pkgs, packageSet }: 
    builtins.map (x: genPackage { inherit pkgs; path = x.packageID; }) packageSet.wrapped;

  genFontPackages = { pkgs, packageSet }: 
    builtins.map (x: genPackage { inherit pkgs; path = x.packageID; }) packageSet.font;

  genFlatpakPackages = { pkgs, packageSet }: 
    builtins.map (x: x.packageID) packageSet.flatpak;

  genModulePaths = { prefix, packageSet, attr }: 
    builtins.map 
      (x: prefix + x.${attr}) 
      (builtins.filter 
        (x: x.${attr} != null) 
        (builtins.concatLists (builtins.attrValues packageSet))
      );

  genSystemModulePaths = { prefix, packageSet }: 
    genModulePaths { inherit prefix; inherit packageSet; attr = "systemModulePathSuffix"; };
}
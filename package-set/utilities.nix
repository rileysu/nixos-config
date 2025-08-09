rec {
  genPackage = { pkgs, path }:
    let
      parts = builtins.filter (x: builtins.isString x) (builtins.split "\\." path);
    in
    builtins.foldl' (set: key: builtins.getAttr key set) pkgs parts;

  genSystemPackages = { pkgs, packageSet }: 
    builtins.map (x: genPackage { inherit pkgs; path = x.packageID; }) packageSet.system;

  genFontPackages = { pkgs, packageSet }: 
    builtins.map (x: genPackage { inherit pkgs; path = x.packageID; }) packageSet.font;

  genFlatpakPackages = { pkgs, packageSet }: 
    builtins.map (x: x.packageID) packageSet.flatpak;

  genModulePaths = { prefix, packageSet }: 
    builtins.map 
      (x: prefix + x.modulePathSuffix) 
      (builtins.filter 
        (x: x.modulePathSuffix != null) 
        (builtins.concatLists (builtins.attrValues packageSet))
      );
}
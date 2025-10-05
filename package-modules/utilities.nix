rec {
  # The package module id is just the relative path from the package-modules dir
  getPackageModules = { packageModuleIDs }:
    builtins.map (x: (import ./${x}.nix)) packageModuleIDs;

  uniqueBy = list: keyFn:
    builtins.foldl'
      (acc: item:
        let key = keyFn item;
        in
        if builtins.any (x: keyFn x == key) acc then
          acc
        else
          acc ++ [ item ]
      )
      []
      list;

  combinePackageModules = { packageModules }:
    let
      combined = builtins.foldl'
        (xs: x: {
          system = xs.system ++ x.system;
          wrapped = xs.wrapped ++ x.wrapped;
          font = xs.font ++ x.font;
          flatpak = xs.flatpak ++ x.flatpak;
        })
        { system = []; wrapped = []; font = []; flatpak = []; }
        packageModules;
      
      dedupedSystem = uniqueBy combined.system (x: x.package);
      dedupedWrapped = uniqueBy combined.wrapped (x: x.package);
      dedupedFont = uniqueBy combined.font (x: x.package);
      dedupedFlatpak = uniqueBy combined.flatpak (x: x.package);
      
      # Remove system packages that are also in wrapped
      filteredSystem =  builtins.filter
        (sysPkg: !builtins.any (wrapPkg: wrapPkg.package == sysPkg.package) dedupedWrapped)
        dedupedSystem;
    in
      {
        system = filteredSystem;
        wrapped = dedupedWrapped;
        font = dedupedFont;
        flatpak = dedupedFlatpak;
      };

  genPackage = { pkgs, path }:
    let
      # Could replace with lib.splitString
      parts = builtins.filter (x: builtins.isString x) (builtins.split "\\." path);
    in
    builtins.foldl' (set: key: builtins.getAttr key set) pkgs parts;

  genSystemPackages = { pkgs, packageModule }: 
    builtins.map (x: genPackage { inherit pkgs; path = x.package; }) packageModule.system;

  genWrappedPackages = { pkgs, packageModule }: 
    builtins.map (x: genPackage { inherit pkgs; path = x.package; }) packageModule.wrapped;

  genFontPackages = { pkgs, packageModule }: 
    builtins.map (x: genPackage { inherit pkgs; path = x.package; }) packageModule.font;

  genFlatpakPackages = { pkgs, packageModule }: 
    builtins.map (x: x.package) packageModule.flatpak;

  genModulePaths = { prefix, packageModule, attr }:
    let
      allEntries = builtins.concatLists (builtins.attrValues packageModule);

      nullFilteredEntries = builtins.filter (x: x.${attr} != null) allEntries;

      uniqueEntries = uniqueBy nullFilteredEntries (item: item.${attr});
      
      uniquePaths = builtins.map (item: prefix + item.${attr}) uniqueEntries;
    in
      uniquePaths;

  genSystemModulePaths = { prefix, packageModule }: 
    genModulePaths { inherit prefix; inherit packageModule; attr = "systemModulePathSuffix"; };

  genHomeModulePaths = { prefix, packageModule }: 
    genModulePaths { inherit prefix; inherit packageModule; attr = "homeModulePathSuffix"; };
}
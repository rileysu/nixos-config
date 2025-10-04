{
  genWrapperPkgs = { wrapper-manager, pkgs, metaConfigProfile }:
    let
      wrapper-managerEval = wrapper-manager.lib {
          inherit pkgs;
          specialArgs = {
            inherit metaConfigProfile;
          };
          modules = [ ./base.nix ];
      };
    in
      wrapper-managerEval.config.build.packages;
}
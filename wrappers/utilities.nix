{
  genWrapperPkgs = { wrapper-manager, pkgs, inputConfig }:
    let
      wrapper-managerEval = wrapper-manager.lib {
          inherit pkgs;

          modules = [ ./base.nix ];
          specialArgs = {
            inherit inputConfig;
          };
      };
    in
      wrapper-managerEval.config.build.packages;
}
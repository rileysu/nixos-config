{
  genWrapperPkgs = { wrapper-manager, pkgs, userSettings, systemSettings }:
    let
      wrapper-managerEval = wrapper-manager.lib {
          inherit pkgs;

          modules = [ ./base.nix ];
          specialArgs = {
            inherit userSettings;
            inherit systemSettings;
          };
      };
    in
      wrapper-managerEval.config.build.packages;
}
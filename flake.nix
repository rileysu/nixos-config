{
    description = "Main Flake";

    outputs = inputs@{ self, ... }:
    let
        metaConfigProfile = "systems/ox";
        metaConfigUtilities = import ./meta-configs/utilities.nix;
        metaConfig = metaConfigUtilities.importProfile { profile = metaConfigProfile; };
 
        lib = inputs.nixpkgs.lib;

        home-manager = inputs.home-manager;

        nix-flatpak = inputs.nix-flatpak;

        wrapper-manager = inputs.wrapper-manager;

        #rust-overlay = inputs.rust-overlay;

    in {
        nixosConfigurations = {
            ${metaConfig.system.hostname} = lib.nixosSystem {
                system = metaConfig.system.target;
                specialArgs = {
                    inherit metaConfigProfile;
                    inherit inputs;
                    inherit wrapper-manager;
                };
                modules = [
                    nix-flatpak.nixosModules.nix-flatpak
                    ({ pkgs, ... }: {
                        #nixpkgs.overlays = [ rust-overlay.overlays.default ];
                    })
                    (./. + "/profiles/linux/configuration.nix")
                    (./. + "/hardware" + ("/" + metaConfig.system.hardware) + "/hardware-configuration.nix")
                    home-manager.nixosModules.home-manager {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.users.${metaConfig.user.username} = (./. + "/profiles/linux/home.nix");
                        home-manager.extraSpecialArgs = {
                            inherit metaConfigProfile;
                            inherit inputs;
                        };
                    }
                ];
            };
        };
    };

    inputs = {
        self.submodules = true;

        nixpkgs.url = "nixpkgs/nixos-unstable";

        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";

        nix-flatpak.url = "github:gmodena/nix-flatpak?ref=latest";

        wrapper-manager.url = "github:viperML/wrapper-manager";

        #rust-overlay = {
        #    url = "github:oxalica/rust-overlay";
        #    inputs.nixpkgs.follows = "nixpkgs";
        #};
    };
}

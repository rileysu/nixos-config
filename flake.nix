{
    description = "Main Flake";

    outputs = inputs@{ self, ... }:
    let
        systemSettings = {
            system = "x86_64-linux";
            hostname = "riley-nixos-vm";
            profile = "desktop";
            systemProfile = "vm";
            timezone = "Sydney/Australia";
            locale = "en_AU.UTF-8";
            bootMode = "uefi";
            bootMountPath = "/boot";
        };

        userSettings = {
            username = "riley";
            name = "Riley";
            email = "riley.d.sutton@gmail.com";
        };

        lib = inputs.nixpkgs.lib;

        home-manager = inputs.home-manager;

    in {
        nixosConfigurations = {
            ${systemSettings.hostname} = lib.nixosSystem {
                system = systemSettings.system;
                modules = [
                    (./. + "/profiles" + ("/" + systemSettings.profile) + "/configuration.nix")
                    (./. + "/systems" + ("/" + systemSettings.systemProfile) + "/hardware-configuration.nix")
                    home-manager.nixosModules.home-manager {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.users.${userSettings.username} = (./. + "/profiles" + ("/" + systemSettings.profile) + "/home.nix");
                    }
                ];
            };
        };
    };

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";

        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };
}
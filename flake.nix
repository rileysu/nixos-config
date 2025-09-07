{
    description = "Main Flake";

    outputs = inputs@{ self, ... }:
    let
        systemSettings = {
            system = "x86_64-linux";
            hostname = "riley-laptop";
            profile = "linux";
            systemProfile = "albatross";
            timezone = "Sydney/Australia";
            defaultLocale = "en_AU.UTF-8";

            desktopEnvProfile = "sway-laptop";
            desktopEnvOverwrites = {};
        };

        userSettings = {
            username = "riley";
            name = "Riley";
            email = "riley.d.sutton@gmail.com";
            theme = "catppuccin_mocha";
            wallpaper = "storm.jpg";
        };

        lib = inputs.nixpkgs.lib;

        home-manager = inputs.home-manager;

        nix-flatpak = inputs.nix-flatpak;

        wrapper-manager = inputs.wrapper-manager;

    in {
        nixosConfigurations = {
            ${systemSettings.hostname} = lib.nixosSystem {
                system = systemSettings.system;
                specialArgs = {
                    inherit systemSettings;
                    inherit userSettings;
                    inherit inputs;
                    inherit wrapper-manager;
                };
                modules = [
                    nix-flatpak.nixosModules.nix-flatpak
                    (./. + "/profiles" + ("/" + systemSettings.profile) + "/configuration.nix")
                    (./. + "/system-profiles" + ("/" + systemSettings.systemProfile) + "/hardware-configuration.nix")
                    home-manager.nixosModules.home-manager {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.users.${userSettings.username} = (./. + "/profiles" + ("/" + systemSettings.profile) + "/home.nix");
                        home-manager.extraSpecialArgs = {
                            inherit systemSettings;
                            inherit userSettings;
                            inherit inputs;
                        };
                    }
                ];
            };
        };
    };

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";

        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";

        nix-flatpak.url = "github:gmodena/nix-flatpak?ref=latest";

        wrapper-manager.url = "github:viperML/wrapper-manager";
    };
}
{
    description = "Main Flake";

    outputs = inputs@{ self, ... }:
    let
        systemSettings = {
            system = "x86_64-linux";
            hostname = "riley-desktop";
            systemProfile = "ox";
            timezone = "Sydney/Australia";
            defaultLocale = "en_AU.UTF-8";

            desktopEnvProfile = "sway-desktop";
            desktopEnvOverwrites = {
              config = {
                windowManager.displays = [
                  {
                    identifier = "AOC 2460 Unknown";
                    mode = "1920x1080@60Hz";
                    allowTearing = true;
                  }
                  {
                    identifier = "ASUSTek COMPUTER INC VG27A R4LMQS078093";
                    mode = "2560x1440@143.972Hz";
                    allowTearing = true;
                  }
                ];
              }; 
            };
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
                    (./. + "/profiles/linux/configuration.nix")
                    (./. + "/system-profiles" + ("/" + systemSettings.systemProfile) + "/hardware-configuration.nix")
                    home-manager.nixosModules.home-manager {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.users.${userSettings.username} = (./. + "/profiles/linux/home.nix");
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
        self.submodules = true;

        nixpkgs.url = "nixpkgs/nixos-unstable";

        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";

        nix-flatpak.url = "github:gmodena/nix-flatpak?ref=latest";

        wrapper-manager.url = "github:viperML/wrapper-manager";
    };
}

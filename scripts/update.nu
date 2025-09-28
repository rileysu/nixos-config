#!/usr/bin/env nu

def installed_run [command: string, exec: closure] {
    if (which $command | length) > 1 {
        do $exec
    } else {
        print $"($command) not installed!"
    }
}

sudo nixos-rebuild switch --flake .

installed_run rustup {|| rustup update}

sudo nix-collect-garbage -d
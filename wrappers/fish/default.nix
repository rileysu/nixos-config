
# Currently broken because fish hardcodes XDG_CONFIG_HOME as the config dir which
# must be writable since it drops fish_variables there.
#
# If you rely on just the store path it complains it isn't writable.
#
# This is the only working example I found with wrappers: https://github.com/viperML/dotfiles/blob/master/modules/wrapper-manager/fish/fish-on-tmpfs.patch
# They had to patch fish because of the same issue I ran into I assume.
{ config, lib, pkgs, ... }: 
  let
    conf = pkgs.writeText "config.fish" 
    ''
      if status is-interactive
        echo Worked
      end

      function fish_greeting
        echo Hello World!
        echo The config is working!
      end
    '';
  in {
    config = {
      wrappers.fish = {
        basePackage = pkgs.fish;

        programs.fish = {
          wrapFlags = [
            "--prefix"
            "XDG_DATA_DIRS"
            ":"
            "${conf}"
          ];
        };
      };
    };
  }
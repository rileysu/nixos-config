rec {  
  genMetaConfigOptions = { lib }: with lib; {
    packageModuleIDs = mkOption {
      type = types.listOf types.str;
      default = [ ];
    };

    system = {
      target = mkOption {
        type = types.nullOr types.str;
        default = null;
      };

      hardware = mkOption {
        type = types.nullOr types.str;
        default = null;
      };
      hostname = mkOption {
        type = types.nullOr types.str;
        default = null;
      };
      systemProfile = mkOption {
        type = types.nullOr types.str;
        default = null;
      };
    };

    time.timezone = mkOption {
      type = types.nullOr types.str;
      default = null;
    };

    locale = {
      default = mkOption {
        type = types.nullOr types.str;
        default = null;
      };
      extra = mkOption {
        type = types.listOf types.str;
        default = [ ];
      };
    };

    theme = {
      name = mkOption {
        type = types.nullOr types.str;
        default = null;
      };
      wallpaper = mkOption {
        type = types.nullOr types.str;
        default = null;
      };
    };

    user = {
      username = mkOption {
        type = types.nullOr types.str;
        default = null;
      };
      name = mkOption {
        type = types.nullOr types.str;
        default = null;
      };
      email = mkOption {
        type = types.nullOr types.str;
        default = null;
      };
    };

    greeter.launchCommand = mkOption {
      type = types.nullOr types.str;
      default = null;
    };

    shell.defaultCommand = mkOption {
      type = types.nullOr types.str;
      default = null;
    };

    editor.defaultCommand = mkOption {
      type = types.nullOr types.str;
      default = null;
    };

    terminal.defaultCommand = mkOption {
      type = types.nullOr types.str;
      default = null;
    };

    windowManager = {
      volume.enabled = mkOption {
        type = types.bool;
        default = false;
      };
      brightness.enabled = mkOption {
        type = types.bool;
        default = false;
      };

      chooser = {
        defaultCommand = mkOption {
          type = types.nullOr types.str;
          default = null;
        };
        defaultRunCommand = mkOption {
          type = types.nullOr types.str;
          default = null;
        };
      };

      cursor = {
        enabled = mkOption {
          type = types.bool;
          default = false;
        };
        themeName = mkOption {
          type = types.nullOr types.str;
          default = null;
        };
        size = mkOption {
          type = types.nullOr types.ints.positive;
          default = null;
        };
      };

      notificationDaemon = {
        enabled = mkOption {
          type = types.bool;
          default = false;
        };
        defaultCommand = mkOption {
          type = types.nullOr types.str;
          default = "mako";
        };
      };

      bar = {
        enabled = mkOption {
          type = types.bool;
          default = false;
        };
        defaultCommand = mkOption {
          type = types.nullOr types.str;
          default = null;
        };
        integrated = mkOption {
          type = types.bool;
          default = true;
        };
        sound.enabled = mkOption {
          type = types.bool;
          default = false;
        };
        brightness.enabled = mkOption {
          type = types.bool;
          default = false;
        };
        battery.enabled = mkOption {
          type = types.bool;
          default = false;
        };
      };

      displays = mkOption {
        type = types.listOf (types.submodule {
          options = {
            identifier = mkOption {
              type = types.nullOr types.str;
              default = null;
            };
            mode = mkOption {
              type = types.nullOr types.str;
              default = null;
            };
            allowTearing = mkOption {
              type = types.bool;
              default = false;
            };
          };
        });
        default = [ ];
      };
    };
  };

  deepMerge =
    lhs: rhs:
    lhs 
    // rhs
    // (builtins.mapAttrs (
      rName: rValue:
      let 
        lValue = lhs.${rName} or null;
      in
      if builtins.isAttrs lValue && builtins.isAttrs rValue then
        deepMerge lValue rValue
      else if builtins.isList lValue && builtins.isList rValue then
        lValue ++ rValue
      else
        rValue
    ) rhs);

  importProfile = { profile }:
    import ./${profile}.nix;
  
  getOptions = { lib }:
    genMetaConfigOptions { inherit lib; };
}

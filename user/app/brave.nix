{ config, lib, pkgs, userSettings, systemSettings, ... }:

{
  config = {
    programs.chromium = {
      enable = true;
      package = null;

      extensions = [
        # Bitwarden
        { id = "nngceckbapebfimnlniiiahkandclblb"; }
        # Dark Reader
        { id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; }
      ];

      # extraOpts = {
      #   BraveRewardsDisabled = true;
      #   BraveWalletDisabled = true;
      #   BraveVPNDisabled = true;
      #   BraveAIChatEnabled = false;

      #   PasswordManagerEnabled = false;
      #   PasswordSharingEnabled = false;
      #   PasswordLeakDetectionEnabled = false;

      #   MetricsReportingEnabled = false;
      # };
    };
  };
}
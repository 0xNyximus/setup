{ lib, config, pkgs, ... }: {
    options.local.nix = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = false;
            description = "Enable the Nix module.";
        };
    };

    config = let
        module = config.local.nix;
    in lib.mkIf module.enable {
        #### OPTIMISE STORE ####
        nix.settings.auto-optimise-store = true;

        #### GARBAGE COLLECTION ####
        nix.gc = {
            automatic = true;
            dates = "weekly";
            persistent = true;
            options = "--delete-older-than 31d"; # Delete old profiles after a month
        };

        #### EXPERIMENTAL FEATURES ####
        nix.settings.experimental-features = [ "nix-command" "flakes" ];
    };
}

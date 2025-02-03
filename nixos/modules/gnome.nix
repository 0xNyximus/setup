{ lib, config, ... }: {
    options.local.gnome = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = false;
            description = "Enable the GNOME module.";
        };
    };

    config = let
        module = config.local.gnome;
    in lib.mkIf module.enable {
        services.xserver = {
            enable = true;
            desktopManager.gnome.enable = true;
        };
        services.gnome.core-utilities.enable = false;
    };
}

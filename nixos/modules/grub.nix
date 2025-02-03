{ lib, config, ... }: {
    options.local.grub = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = false;
            description = "Enable the GRUB bootloader module.";
        };
    };

    config = let
        module = config.local.grub;
    in lib.mkIf module.enable {
        boot.loader = {
            timeout = 1;
            grub = {
                enable = true;
                device = "nodev";
                efiSupport = true;
                useOSProber = true;
                configurationLimit = 10;
            };
            efi = {
                canTouchEfiVariables = true;
                efiSysMountPoint = "/boot";
            };
        };
    };
}

{ lib, config, ... }: {
    options.local.touchpad = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = false;
            description = "Enable the touchpad module.";
        };
    };

    config = let
        module = config.local.touchpad;
    in lib.mkIf module.enable {
        services.libinput.enable = true;
        services.libinput.touchpad = {
            tapping = true;
            scrollMethod = "twofinger";
            naturalScrolling = true;
            disableWhileTyping = true;
        };
    };
}

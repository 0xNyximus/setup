{ lib, config, ... }: {
    options.local.pipewire = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = false;
            description = "Enable the PipeWire module.";
        };
    };

    config = let
        module = config.local.pipewire;
    in lib.mkIf module.enable {
        hardware.pulseaudio.enable = false;
        security.rtkit.enable = true;
        services.pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
            jack.enable = true;
        };
    };
}

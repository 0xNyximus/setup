{ lib, config, pkgs, ... }: {
    options.local.fonts = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = false;
            description = "Enable the fonts module.";
        };

        nerdfonts = lib.mkOption {
            type = lib.types.listOf lib.types.str;
            default = [ "FiraCode" ];
            description = "List of NerdFonts to be installed.";
        };
    };

    config = let
        module = config.local.fonts;
    in lib.mkIf module.enable {
        fonts.packages = with pkgs; [
            (nerdfonts.override { fonts = module.nerdfonts; })
        ];
    };
}

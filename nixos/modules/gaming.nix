{ lib, config, pkgs, ... }: {
    options.local.gaming = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = false;
            description = "Enable the gaming module.";
        };
    };

    config = let
        module = config.local.gaming;
    in lib.mkIf module.enable {
        #### PROTONDB ####
        # Check if a game is linux compatible (protondb.com)
        
        #### PACKAGES ####
        environment.systemPackages = with pkgs; [
            #### RUNNERS ####
            mgba
            desmume
            # steam (enabled through config)
            lutris
            bottles

            #### PERFORMANCE ####
            # Performance patches
            # 'protonup -d "~/.steam/root/compatibilitytools.d"' to update ProtonGE
            # Then select the latest ProtonGE in the compatibility menu
            protonup
            # Performance overlay, launch options -> 'mangohud %command%'
            mangohud

            #### OTHER ####
            ckan # KSP modding
        ];
        programs.steam.enable = true;

        #### PERFORMANCE SETTINGS ####
        # Fixes upscaling and resolution problems, launch options -> 'gamescope %command%'
        programs.steam.gamescopeSession.enable = true;

        # Temporary optimizations, launch options -> 'gamemoderun %command%'
        programs.gamemode.enable = true;
    };
}

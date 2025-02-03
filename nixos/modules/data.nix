{ lib, config, ... }: {
    options.local.data = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = false;
            description = "Enable the data module.";
        };

        path = lib.mkOption {
            type = lib.types.str;
            default = "/media/data/data";
            description = "Path to the data directory.";
        };

        users = lib.mkOption {
            type = lib.types.listOf lib.types.str;
            default = [];
            description = "Users that want a ~/data symlink to path.";
        };
    };

    config = let
        module = config.local.data;
        symlinkRule = (user: "L+ /home/${user}/data - - - - ${module.path}");
    in lib.mkIf module.enable {
        systemd.tmpfiles.rules = map symlinkRule module.users;
    };
}

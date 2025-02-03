{ lib, config, ... }: {
    options.local.network = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = false;
            description = "Enable the network module.";
        };

        name = lib.mkOption {
            type = lib.types.nullOr lib.types.str;
            default = null;
            description = "The network name of the device.";
        };

        users = lib.mkOption {
            type = lib.types.listOf lib.types.str;
            default = [];
            description = "Users that are allowed to change the network settings.";
        };
    };

    config = let
        module = config.local.network;
    in lib.mkIf (module.enable && module.name != null) {
        networking = {
            hostName = module.name;
            networkmanager.enable = true;
        };
        users.extraGroups.networkmanager.members = module.users;
    };
}

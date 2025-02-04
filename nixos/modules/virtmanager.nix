{ lib, config, pkgs, ... }: {
    options.local.virtmanager = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = false;
            description = "Enable the virt-manager module.";
        };

        users = lib.mkOption {
            type = lib.types.listOf lib.types.str;
            default = [];
            description = "Users that want to use virt-manager.";
        };
    };

    config = let
        module = config.local.virtmanager;
    in lib.mkIf module.enable {
        virtualisation.libvirtd = {
            enable = true;
            qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
        };
        programs.virt-manager.enable = true;
        users.extraGroups.libvirtd.members = module.users;
    };
}

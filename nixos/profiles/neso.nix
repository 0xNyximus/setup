{ pkgs, ... }: {
    #### DATA PARTITION ####
    local.data.enable = true;
    local.data.users = [ "nyximus" ];

    #### BOOTLOADER ####
    local.grub.enable = true;

    #### USERS ####
    users.users.nyximus = {
        isNormalUser = true;
        description = "nyximus";
        extraGroups = [ "wheel" ];
        packages = with pkgs; [
            nautilus
            file-roller
            obsidian
            pandoc
            xournalpp
            firefox
            discord
            libreoffice
        ];
    };

    #### ENVIRONMENT ####
    local.gnome.enable = true;
    services.xserver.displayManager.gdm.enable = true;

    #### GENERAL SETTINGS ####
    local.fonts.enable = true;
    local.network = {
        enable = true;
        name = "neso";
        users = [ "nyximus" ];
    };
    local.nix.enable = true;
    local.pipewire.enable = true;
    local.touchpad.enable = true;

    #### GENERAL APPLICATIONS ####
    local.terminal.enable = true;
}

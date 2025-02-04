inputs: {
    imports = [
        #### HARDWARE & BOOTLOADER ####
        ./grub.nix
        ./data.nix

        #### SETTINGS ####
        ./fonts.nix
        ./network.nix
        ./nix.nix
        ./pipewire.nix
        ./touchpad.nix

        #### ENVIRONMENT ####
        ./gnome.nix

        #### APPLICATIONS ####
        ./gaming.nix
        ./terminal.nix
        ./virtmanager.nix
    ];
}

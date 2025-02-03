{ lib, config, pkgs, ... }: {
    options.local.terminal = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = false;
            description = "Enable the terminal module.";
        };
    };

    config = let
        module = config.local.terminal;
    in lib.mkIf module.enable {
        #### PACKAGES ####
        environment.systemPackages = with pkgs; [
            #### TERMINAL ####
            alacritty
            zsh
            starship
            tmux
            #### CONFIGURATION ####
            sops
            age
            ssh-to-age
            #### DEVELOPMENT ####
            neovim
            vscode
            git
            #### TOOLS ####
            lsd
            tldr
            fzf
            hyperfine
            stow
            fd
            tokei
            btop
            duf
            ncdu
            procs
            gnumake
            zip
            unzip
            gcc
            ripgrep
            xclip
        ];

        #### DIRENV ####
        programs.direnv = {
            enable = true;
            silent = true;
            nix-direnv.enable = true;
        };
    };
}

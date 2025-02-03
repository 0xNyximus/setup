{
    description = "My 'I put way too much time in this' flake!";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    };

    outputs = inputs: {
        nixosConfigurations.neso = import ./lib/profile.nix {
            inputs = inputs;
            system = "x86_64-linux";
            device = "lenovo";
            profile = "neso";
        };

        templates = import ./templates/default.nix;
    };
}

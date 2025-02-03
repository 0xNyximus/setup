{ inputs, system, device, profile }: let
    config = { inherit system; config.allowUnfree = true; };
    overlay = _: _: {
        unstable = import inputs.nixpkgs-unstable config;
    };
    pkgs = import inputs.nixpkgs (config // { overlays = [ overlay ]; });
in inputs.nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = { inherit pkgs; };
    modules = [
        ../modules
        (./. + "/../devices/${device}.nix")
        (./. + "/../profiles/${profile}.nix")
    ];
}

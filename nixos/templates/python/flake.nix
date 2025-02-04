{
    description = "Python DevShell";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    };

    outputs = inputs: let
        systems = [ "x86_64-linux" ];
        forAllSystems = function: inputs.nixpkgs.lib.genAttrs systems (system: function {
            pkgs = import inputs.nixpkgs { inherit system; config.allowUnfree = true; };
        });
    in {
        devShells = forAllSystems ({ pkgs }: {
            default = pkgs.mkShell {
                packages = with pkgs; [
                    (python3.withPackages (pp: with pp; []))
                ];
            };
        });
    };
}

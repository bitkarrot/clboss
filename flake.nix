{
  description = "CLBOSS Automated Core Lightning Node Manager";
  nixConfig.bash-prompt = "\[nix-develop\]$ ";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages = {
          default = pkgs.neofetch;
        };

        formatter = pkgs.nixpkgs-fmt;
        devShell = pkgs.mkShell {
          buildInputs = [ pkgs.gcc pkgs.pkg-config pkgs.libev pkgs.libevdev pkgs.curl pkgs.sqlite pkgs.bind pkgs.autoconf-archive pkgs.libtool pkgs.automake pkgs.git ];
        };
      }
    );
}

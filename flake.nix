{
  description = "Nix configs for Sechmanns nodes";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
  inputs.treefmt-nix.url = "github:numtide/treefmt-nix";
  inputs.treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";
  inputs.hosts.url = "github:StevenBlack/hosts";

  outputs = {
    self,
    nixpkgs,
    treefmt-nix,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    treeFmtEval = treefmt-nix.lib.evalModule nixpkgs.legacyPackages.${system} ./treefmt.nix;
  in {
    nixosConfigurations = {
      lenovo-node = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./system/configuration.nix
          inputs.hosts.nixosModule
          {
            networking.stevenBlackHosts.enable = true;
          }
        ];
      };
    };
    formatter.x86_64-linux = treeFmtEval.config.build.wrapper;
    checks.x86_64-linux.formatting = treeFmtEval.config.build.check self;
  };
}

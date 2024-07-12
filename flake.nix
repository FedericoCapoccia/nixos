{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
  };

  outputs = { self, nixpkgs, ... }:
  let
    lib = nixpkgs.lib;
    systemConfig = {
      system = "x86_64-linux";
      hostname = "andromeda";
      timezone = "Europe/Rome";
      locale = "en_US.UTF-8";
      locale_extra = "it_IT.UTF-8";
    };
    hostPath = ./hosts/${systemConfig.hostname};
  in
  {
    nixosConfigurations.system = lib.nixosSystem {
      system = systemConfig.system;
      modules = [ (hostPath + "/configuration.nix") ];
      specialArgs = {
        inherit systemConfig;
      };
    };
  };
}

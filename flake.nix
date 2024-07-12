{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }:
  let
    systemConfig = {
      system = "x86_64-linux";
      hostname = "andromeda";
      timezone = "Europe/Rome";
      locale = "en_US.UTF-8";
      locale_extra = "it_IT.UTF-8";
    };

    userConfig = {
      username = "fede";
      terminal = "wezterm";
      browser = "firefox";
    };

    hostPath = ./hosts/${systemConfig.hostname};
    pkgs = import nixpkgs {
      system = systemConfig.system;
      config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
      };
    };
  in
  {
    nixosConfigurations.system = nixpkgs.lib.nixosSystem {
      system = systemConfig.system;
      modules = [ (hostPath + "/configuration.nix") ];
      specialArgs = { inherit systemConfig; inherit userConfig; };
    };
  };
}

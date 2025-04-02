{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nixos-wsl,
      ...
    }:
    let
      systemConfig = {
        username = "fede";
        system = "x86_64-linux";
        timezone = "Europe/Rome";
        locale = "en_US.UTF-8";
        locale_extra = "it_IT.UTF-8";
      };

      hostPath = name: ./hosts/${name};

      pkgs = import nixpkgs {
        system = systemConfig.system;
        config = {
          allowUnfree = true;
          allowUnfreePredicate = (_: true);
        };
      };
    in
    {
      nixosConfigurations = {

        andromeda = nixpkgs.lib.nixosSystem {
          system = systemConfig.system;
          modules = [
            (hostPath "andromeda" + "/configuration.nix")
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${systemConfig.username} = import ./hosts/home.nix;
              home-manager.extraSpecialArgs = { inherit systemConfig; };
            }
          ];
          specialArgs = {
            inherit systemConfig;
          };
        };

        zephyr = nixpkgs.lib.nixosSystem {
          system = systemConfig.system;
          modules = [
            nixos-wsl.nixosModules.default
            {
              system.stateVersion = "24.11";
              wsl.enable = true;
            }
            (hostPath "zephyr" + "/configuration.nix")
          ];
          specialArgs = {
            inherit systemConfig;
          };
        };

      };

      # homeConfigurations.user = home-manager.lib.homeManagerConfiguration {
      #   inherit pkgs;
      #   modules = [
      #     (hostPath "andromeda" + "/../home.nix")
      #   ]; # FIXME:
      #   extraSpecialArgs = { inherit systemConfig; };
      # };
    };
}

{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    # lanzaboote = {
    #   url = "github:nix-community/lanzaboote/v0.4.2";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nixos-wsl,
      # lanzaboote,
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

            # IF USING THIS I CANT BOOT WINDOWS :facepalm:
            # lanzaboote.nixosModules.lanzaboote
            #
            # (
            #   { pkgs, lib, ... }:
            #   {
            #
            #     environment.systemPackages = [
            #       # For debugging and troubleshooting Secure Boot.
            #       pkgs.sbctl
            #     ];
            #
            #     # Lanzaboote currently replaces the systemd-boot module.
            #     # This setting is usually set to true in configuration.nix
            #     # generated at installation time. So we force it to false
            #     # for now.
            #     boot.loader.systemd-boot.enable = lib.mkForce false;
            #
            #     boot.lanzaboote = {
            #       enable = true;
            #       pkiBundle = "/var/lib/sbctl";
            #     };
            #   }
            # )

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

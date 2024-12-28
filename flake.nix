{
  description = "NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix";
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote.url = "github:nix-community/lanzaboote/v0.4.1";
    fine-cmdline = {
      url = "github:VonHeikemen/fine-cmdline.nvim";
      flake = false;
    };
    flatpak.url = "github:GermanBread/declarative-flatpak/stable-v3"; 
  };

  outputs = { nixpkgs, home-manager, lanzaboote, flatpak, ... }@inputs: let
    system = "aarch64-linux";
    host = "my-computer";
    username = "yamil";
  in {
    nixosConfigurations = {
      "${host}" = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit system inputs username host;
        };
        modules = [
          ./hosts/${host}/config.nix
          inputs.lanzaboote.nixosModules.lanzaboote
          ({ pkgs, lib, ... }: {
            boot.loader.systemd-boot.enable = lib.mkForce false;

            boot.lanzaboote = {
              enable = true;
              pkiBundle = "/etc/secureboot";
            };
          })
          inputs.stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          {
            home-manager.extraSpecialArgs = {
              inherit username inputs host;
            };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.${username} = import ./hosts/${host}/home.nix;
          }
        ];
      };
    };

    homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
      modules = [
        flatpak.homeManagerModules.declarative-flatpak
        ./hosts/${host}/home.nix
      ];
    };
  };
}

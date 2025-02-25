{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable-small";
    nur.url = "github:nix-community/NUR";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    alejandra.url = "github:kamadorueda/alejandra/3.0.0";
    nix-gaming.url = "github:fufexan/nix-gaming";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:gerg-l/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    browser-previews = {
      url = "github:nix-community/browser-previews";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    yazi-plugins = {
      url = "github:yazi-rs/plugins";
      flake = false;
    };
    sum-astro-nvim = {
      url = "github:sum-rock/SumAstroNvim/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ghostty = {
      url = "github:ghostty-org/ghostty";
    };
    zig.url = "github:mitchellh/zig-overlay";
    nvf.url = "github:notashelf/nvf";
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = {
    nixpkgs,
    self,
    catppuccin,
    home-manager,
    chaotic,
    ...
  } @ inputs: let
    username = "yamil";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    lib = nixpkgs.lib;
  in {
    # NixOS configurations for different machines
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/desktop
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
          chaotic.nixosModules.default
          {
            home-manager.users.yamil = {
              imports = [catppuccin.homeManagerModules.catppuccin];
            };
          }
        ];
        specialArgs = {
          host = "desktop";
          inherit self inputs username;
        };
      };
      laptop = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [./hosts/laptop];
        specialArgs = {
          host = "laptop";
          inherit self inputs username;
        };
      };
      vm = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [./hosts/vm];
        specialArgs = {
          host = "vm";
          inherit self inputs username;
        };
      };
    };
  };
}

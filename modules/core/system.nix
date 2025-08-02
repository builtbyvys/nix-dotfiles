{
  pkgs,
  inputs,
  config,
  ...
}:
{
  imports = [
    # inputs.nix-gaming.nixosModules.default
    inputs.agenix.nixosModules.default
  ];
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [ "https://nix-gaming.cachix.org" ];
      trusted-public-keys = [
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      ];
    };

    extraOptions = ''
      !include ${config.age.secrets.github_pat.path}
    '';
  };
  nixpkgs = {
    overlays = [ inputs.nur.overlays.default ];
  };

  environment.systemPackages = with pkgs; [
    wget
    git
    nvidia-vaapi-driver
  ];

  age.secrets.github_pat.file = "${../../secrets/github_pat.age}";

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.05";
}

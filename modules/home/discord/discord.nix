{ pkgs, ... }:
{
  home.packages = with pkgs; [ vesktop ];
  xdg.configFile."vesktop/themes/gruvbox.theme.css".source = ./gruvbox.css;
}

{ inputs, pkgs, ... }:
{
  home.packages = (
    with pkgs; [ inputs.browser-previews.packages."${system}".google-chrome-dev ]
  );
}

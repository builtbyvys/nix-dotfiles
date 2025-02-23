{
  config,
  lib,
  inputs,
  pkgs,
  host,
  ...
}:
{
  home.packages = (
    with pkgs;
    [
      inputs.browser-previews.packages."${system}".google-chrome-dev
    ]
  );
}

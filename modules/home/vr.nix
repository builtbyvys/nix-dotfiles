{
  config,
  pkgs,
  inputs,
  ...
}:
let
  xrPackages = inputs.nixpkgs-xr.packages.${pkgs.system};
  xrizer = xrPackages.xrizer;
  wayvrDashboard = xrPackages.wayvr-dashboard;
  wlxOverlayS = xrPackages.wlx-overlay-s;
in
{
  home.packages = [
    xrizer
    wayvrDashboard
    wlxOverlayS
  ];

  xdg.configFile."openvr/openvrpaths.vrpath".text = ''
    {
      "config" :
      [
        "~/.local/share/Steam/config"
      ],
      "external_drivers" : null,
      "jsonid" : "vrpathreg",
      "log" :
      [
        "~/.local/share/Steam/logs"
      ],
      "runtime" :
      [
        "${xrizer}/lib/xrizer"
      ],
      "version" : 1
    }
  '';
}

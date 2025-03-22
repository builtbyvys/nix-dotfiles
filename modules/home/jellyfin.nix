{ pkgs, ... }:
{
  home.packages = [ pkgs.jellyfin-rpc ];

  home.file.".config/jellyfin-rpc/main.json" = {
    text = ''
      {
        "jellyfin": {
            "url": "https://jellyfin.piracy.business",
            "api_key_file": "",
            "username": ["vys"],
        },
        "discord": {
            "application_id": "1341518657519358043",
            "buttons": [
                {
                    "name": "dynamic",
                    "url": "dynamic"
                },
                {
                    "name": "dynamic",
                    "url": "dynamic"
                }
            ]
        },
        "imgur": {
            "client_id": "f6caa728d9a5c78"
        },
        "images": {
            "enable_images": true,
            "imgur_images": true
        }
      }
    '';
  };
}

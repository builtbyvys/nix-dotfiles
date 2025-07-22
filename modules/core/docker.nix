{ username, ... }:
{
  virtualisation.docker = {
    # Consider disabling the system wide Docker daemon
    enable = false;

    rootless = {
      enable = true;
      setSocketVariable = true;
      # Optionally customize rootless Docker daemon settings
      daemon.settings = {
        dns = [
          "9.9.9.11"
          "149.112.112.11"
        ];
        registry-mirrors = [ "https://mirror.gcr.io" ];
      };
    };
  };

  users.users.${username}.extraGroups = [ "docker" ];
}

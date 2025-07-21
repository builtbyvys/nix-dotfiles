let
  self = (import ../keys/desktop.nix).sshKeys;
  all = self;
in
{
  "jellyfin.age".publicKeys = all;
  "github_pat.age".publicKeys = all;
}

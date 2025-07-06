{ pkgs, ... }:
{
  programs.git = {
    enable = true;

    userName = "vys";
    userEmail = "hey@vyslix.dev";

    extraConfig = {
      init.defaultBranch = "main";
      credential.helper = "store";
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";

      commit.gpgSign = true;
      tag.gpgSign = true;
      user.signingKey = "39A4F0896DA2F2C0";

      pull.rebase = false;
      fetch.prune = true;
      rerere.enabled = true;

      diff.algorithm = "histogram";
      diff.compactionHeuristic = true;

      core.precomposeunicode = true;
      core.quotepath = false;

      blame.ignoreRevsFile = ".git-blame-ignore-revs";

      branch.autosetupmerge = "always";
      branch.autosetuprebase = "always";
    };

    delta = {
      enable = true;
      options = {
        line-numbers = true;
        side-by-side = true;
        diff-so-fancy = true;
        navigate = true;

        hunk-header-style = "file line-number syntax";
      };
    };

    aliases = {
      pr-diff = "diff HEAD~1";
      pr-log = "log --oneline --decorate --graph -10";
      pr-show = "show --stat --summary";

      st = "status -sb";
      br = "branch -v";

      lg = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";

      filelog = "log -u";

      find = "log --grep";

      changes = "diff-tree --no-commit-id --name-only -r";

      undo = "reset --soft HEAD~1";

      cleanup = "!git branch --merged | grep -v '\\*\\|main\\|master' | xargs -n 1 git branch -d";
    };
  };

  home.packages = with pkgs; [ gh ];

  programs.zsh.shellAliases = {
    g = "lazygit";
    gf = "onefetch --number-of-file-churns 0 --no-color-palette";
    ga = "git add";
    gaa = "git add --all";
    gs = "git status";
    gb = "git branch";
    gm = "git merge";
    gd = "git diff";
    gpl = "git pull";
    gplo = "git pull origin";
    gps = "git push";
    gpso = "git push origin";
    gpst = "git push --follow-tags";
    gcl = "git clone";
    gc = "git commit";
    gcm = "git commit -m";
    gcma = "git add --all && git commit -m";
    gtag = "git tag -ma";
    gch = "git checkout";
    gchb = "git checkout -b";
    glog = "git log --oneline --decorate --graph";
    glol = "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'";
    glola = "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all";
    glols = "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --stat";

    pr = "gh pr";
    prl = "gh pr list";
    prv = "gh pr view";
    prc = "gh pr checkout";
    prd = "gh pr diff";
    prr = "gh pr review";

    spellcheck = "aspell check";
  };
}

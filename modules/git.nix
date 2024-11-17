{ config, lib, pkgs, ... }: {
  programs.git = {
    enable = true;

    userName = "Nic Young";
    userEmail = "nic@nicyoung.io";

    aliases = {
      co = "checkout";
      ci = "commit";
      st = "status";
      br = "branch";
      hist = "log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short";
      type = "cat-file -t";
      dump = "cat-file -p";
    };

    extraConfig = {
      core = {
        editor = "hx";
      };
      credential.helper = "osxkeychain";
      diff.colorMoved = "default";
      init.defaultBranch = "main";
      merge.conflictStyle = "diff3";
      pull.ff = "only";
      push.default = "current";
      fetch.prune = true;
    };

    delta = {
      enable = true;
      options = {
        navigate = true;
        light = false;
        side-by-side = true;
      };
    };

    includes = [{
        condition = "gitdir:~/Workspace/";
        path = "~/.work_gitconfig";
      }];
  };
}

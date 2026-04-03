{ config, lib, pkgs, ... }: {
  programs.git = {
    enable = true;

    settings = {
      user.name = "Nic Young";
      user.email = "nic@nicyoung.dev";
      alias = {
        co = "checkout";
        ci = "commit";
        st = "status";
        br = "branch";
        hist = "log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short";
        type = "cat-file -t";
        dump = "cat-file -p";
      };
      core.editor = "hx";
      credential.helper = "osxkeychain";
      diff.colorMoved = "default";
      init.defaultBranch = "main";
      merge.conflictStyle = "diff3";
      pull.ff = "only";
      push.default = "current";
      fetch.prune = true;
    };

    includes = [{
      condition = "gitdir:~/Workspace/";
      path = "~/.work_gitconfig";
    }];
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      navigate = true;
      light = false;
      side-by-side = true;
    };
  };
}

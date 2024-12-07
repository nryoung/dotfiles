{ config, lib, pkgs, ... }: {
  programs.bash = {
    enable = true;
    # Based on https://wiki.archlinux.org/title/Fish#Setting_fish_as_interactive_shell_only
    # It is much safer to use Fish as an interactive shell instead of the default shell
    # This starts a bash shell and then execs into a Fish shell
    initExtra = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };
}

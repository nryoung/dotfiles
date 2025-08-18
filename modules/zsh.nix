{ config, lib, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    # Based on https://wiki.archlinux.org/title/Fish#Setting_fish_as_interactive_shell_only
    # It is much safer to use Fish as an interactive shell instead of the default shell
    # This starts a bash shell and then execs into a Fish shell
    initContent = ''
      if [[ $(${pkgs.procps}/bin/ps -o comm= -p $PPID) != "fish" && -z $BASH_EXECUTION_STRING ]]
      then
        [[ -o login ]] && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };
}

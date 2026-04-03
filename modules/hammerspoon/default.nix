{ ... }: {
  home.file.".hammerspoon/init.lua".source = ./init.lua;

  launchd.agents.hammerspoon = {
    enable = true;
    config = {
      ProgramArguments = [ "/usr/bin/open" "-a" "Hammerspoon" ];
      RunAtLoad = true;
      KeepAlive = false;
    };
  };
}

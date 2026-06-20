{ config, lib, pkgs, ... }: {
  services.ollama = {
    enable = true;
    package = pkgs.ollama-cuda;
    host = "0.0.0.0";
    port = 11434;
  };

  services.open-webui = {
    enable = true;
    host = "0.0.0.0";
    port = 8085;
    environment = {
      OLLAMA_API_BASE_URL = "http://localhost:11434";
    };
  };
}

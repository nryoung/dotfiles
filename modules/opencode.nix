{ config, lib, pkgs, ... }: {
  home.file.".config/opencode/tui.json".text = builtins.toJSON {
    "$schema" = "https://opencode.ai/tui.json";
    theme = "tokyonight";
  };

  home.file.".config/opencode/opencode.json".text = builtins.toJSON {
    "$schema" = "https://opencode.ai/config.json";
    instructions = [ "~/.claude/skills/dev-workflow/SKILL.md" ];
    model = "ollama/hf.co/unsloth/gemma-4-12B-it-qat-GGUF:UD-Q4_K_XL";
    small_model = "ollama/hf.co/unsloth/gemma-4-E4B-it-qat-GGUF:UD-Q4_K_XL";
    plugin = [ "context-mode" ];
    compaction = {
      auto = true;
      reserved = 8192;
    };
    tool_output = {
      max_lines = 500;
      max_bytes = 25600;
    };
    provider = {
      ollama = {
        npm = "@ai-sdk/openai-compatible";
        name = "Ollama (home server)";
        options = {
          baseURL = "http://10.0.0.99:11434/v1";
          timeout = false;
          chunkTimeout = 120000;
        };
        models = {
          "hf.co/unsloth/gemma-4-12B-it-qat-GGUF:UD-Q4_K_XL" = {
            name = "Gemma 4 12B QAT";
            tool_call = true;
            limit = { context = 65536; output = 8192; };
          };
          "hf.co/unsloth/gemma-4-E4B-it-qat-GGUF:UD-Q4_K_XL" = {
            name = "Gemma 4 E4B QAT";
            tool_call = true;
            limit = { context = 65536; output = 8192; };
          };
          "hf.co/unsloth/Qwen3.5-9B-MTP-GGUF:UD-Q4_K_XL" = {
            name = "Qwen3.5 9B MTP";
            tool_call = true;
            limit = { context = 65536; output = 8192; };
          };
          "hf.co/unsloth/GLM-4-9B-0414-GGUF:UD-Q4_K_XL" = {
            name = "GLM-4 9B";
            tool_call = true;
            limit = { context = 65536; output = 8192; };
          };
          "hf.co/bartowski/nvidia_OpenReasoning-Nemotron-7B-GGUF:Q4_K_M" = {
            name = "OpenReasoning Nemotron 7B";
            tool_call = true;
            limit = { context = 65536; output = 8192; };
          };
        };
      };
    };
  };
}

{ config, lib, pkgs, ... }: {
  home.file.".config/opencode/opencode.json".text = builtins.toJSON {
    "$schema" = "https://opencode.ai/config.json";
    instructions = [ "~/.claude/skills/dev-workflow/SKILL.md" ];
    model = "ollama/hf.co/unsloth/gemma-4-12B-it-qat-GGUF:UD-Q4_K_XL";
    plugin = [ "context-mode" ];
    compaction = {
      auto = true;
    };
    provider = {
      ollama = {
        npm = "@ai-sdk/openai-compatible";
        name = "Ollama (home server)";
        options = {
          baseURL = "http://10.0.0.99:11434/v1";
        };
        models = {
          "hf.co/unsloth/Qwen3.5-9B-MTP-GGUF:UD-Q4_K_XL" = {
            name = "Qwen3.5-9B-MTP-GGUF";
          };
          "hf.co/unsloth/gemma-4-12B-it-qat-GGUF:UD-Q4_K_XL" = { name = "Gemma 4 12B QAT"; };
        };
      };
    };
  };
}

{ config, lib, pkgs, ... }: {
  home.file.".config/opencode/opencode.json".text = builtins.toJSON {
    "$schema" = "https://opencode.ai/config.json";
    instructions = [ "~/.claude/skills/dev-workflow/SKILL.md" ];
    model = "ollama/hf.co/unsloth/gemma-4-12B-it-qat-GGUF:UD-Q4_K_XL";
    provider = {
      ollama = {
        npm = "@ai-sdk/openai-compatible";
        name = "Ollama (home server)";
        options = {
          baseURL = "http://10.0.0.99:11434/v1";
        };
        models = {
          "qwen2.5-coder:7b" = { name = "Qwen2.5 Coder 7B"; };
          "qwen2.5-coder:14b" = { name = "Qwen2.5 Coder 14B"; };
          "qwen3:8b" = { name = "Qwen3 8B"; };
          "gemma4:12b" = { name = "Gemma 4 12B"; };
          "hf.co/unsloth/gemma-4-12B-it-qat-GGUF:UD-Q4_K_XL" = { name = "Gemma 4 12B QAT"; };
        };
      };
    };
  };
}

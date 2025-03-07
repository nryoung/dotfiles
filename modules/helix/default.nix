{ config, lib, pkgs, ... }: {
  home.file.".config/helix/yazi-picker.sh" = {
    source = ./yazi-picker.sh;
  };
  programs.helix = with pkgs; {
    enable = true;
    defaultEditor = true;
    extraPackages = [
      marksman
      nil
      nixpkgs-fmt
      nodePackages.prettier
      nodePackages.typescript-language-server
      rust-analyzer
      typescript
    ];

    settings = {
      theme = "tokyonight";

      editor = {
        color-modes = true;
        cursorline = true;
        cursorcolumn = true;
        bufferline = "multiple";
        line-number = "relative";
        end-of-line-diagnostics = "hint";

        soft-wrap.enable = true;

        auto-save = {
          focus-lost = true;
          after-delay.enable = true;
        };

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };

        file-picker = {
          hidden = false;
          ignore = false;
        };

        indent-guides = {
          character = "┊";
          render = true;
          skip-levels = 1;
        };

        lsp = {
          display-inlay-hints = true;
          display-messages = true;
        };

        statusline = {
          left = [ "mode" "file-name" "spinner" "read-only-indicator" "file-modification-indicator" ];
          right = [ "diagnostics" "selections" "register" "file-type" "file-line-ending" "position" ];
          mode.normal = "🧬";
          mode.insert = "I";
          mode.select = "S";
        };
        inline-diagnostics = {
          cursor-line = "error";
        };
      };

      keys = {
        normal = {
          C-y = ":sh zellij run -f -x 10% -y 10% --width 80% --height 80% -- bash ~/.config/helix/yazi-picker.sh";
          space = {
            F = "file_picker_in_current_buffer_directory";
          };
        };
      };
    };



    languages = {
      language-server.rust-analyzer.config.check = {
        command = "clippy";
      };

      language-server.typescript-language-server.config.tsserver = {
        path = "${pkgs.typescript}/lib/node_modules/typescript/lib/tsserver.js";
      };

      language = [
        {
          name = "css";
          language-servers = [ "vscode-css-language-server" ];
          formatter = {
            command = "prettier";
            args = [ "--parser" "css" ];
          };
          auto-format = true;
        }
        {
          name = "html";
          language-servers = [ "vscode-html-language-server" ];
          formatter = {
            command = "prettier";
            args = [ "--parser" "html" ];
          };
          auto-format = true;
        }
        {
          name = "javascript";
          language-servers = [
            { name = "typescript-language-server"; except-features = [ "format" ]; }
          ];
          auto-format = true;
        }
        {
          name = "json";
          language-servers = [
            { name = "vscode-json-language-server"; except-features = [ "format" ]; }
          ];
          formatter = {
            command = "prettier";
            args = [ "--parser" "json" ];
          };
          auto-format = true;
        }
        {
          name = "markdown";
          language-servers = [ "marksman" ];
          formatter = {
            command = "prettier";
            args = [ "--parser" "markdown" ];
          };
          auto-format = true;
        }
        {
          name = "nix";
          formatter = {
            command = "nixpkgs-fmt";
          };
          auto-format = true;
        }
        {
          name = "rust";
          language-servers = [ "rust-analyzer" ];
          auto-format = true;
        }
        {
          name = "toml";
          language-servers = [ "taplo" ];
          formatter = {
            command = "taplo";
            args = [ "fmt" "-o" "column_width=120" "-" ];
          };
          auto-format = true;
        }
        {
          name = "tsx";
          language-servers = [
            { name = "typescript-language-server"; except-features = [ "format" ]; }
          ];
          formatter = {
            command = "biome";
            args = [ "format" "--indent-style" "space" "--stdin-file-path" "file.tsx" ];
          };
          auto-format = true;
        }
        {
          name = "typescript";
          language-servers = [
            { name = "typescript-language-server"; except-features = [ "format" ]; }
          ];
          formatter = {
            command = "biome";
            args = [ "format" "--indent-style" "space" "--stdin-file-path" "file.ts" ];
          };
          auto-format = true;
        }
      ];
    };
  };
}

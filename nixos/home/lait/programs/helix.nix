{ ... }: {
  programs.helix = {
    enable = true;

    settings = {
      theme = "flexoki_dark";

      editor = {
        auto-format = true;
        line-number = "relative";
        cursorline = true;
        insert-final-newline = false;
        gutters = [
          "line-numbers"
          "spacer"
          "diff"
        ];
        idle-timeout = 1;
        bufferline = "always";
        completion-timeout = 1;
        completion-trigger-len = 1;
        mouse = true;

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "block";
        };
      };

      keys.normal = {
        "C-u" = [
          "half_page_up"
          "align_view_center"
        ];
        "C-d" = [
          "half_page_down"
          "align_view_center"
        ];
        "C-b" = [
          "page_up"
          "align_view_center"
        ];
        "C-f" = [
          "page_down"
          "align_view_center"
        ];
        "A-j" = [
          "extend_to_line_bounds"
          "delete_selection"
          "paste_after"
        ];
        "A-k" = [
          "extend_to_line_bounds"
          "delete_selection"
          "move_line_up"
          "paste_before"
        ];
      };
    };

    languages = {
      language-server = {
        nil = {
          command = "nil";
        };
        rust-analyzer = {
          command = "rust-analyzer";
        };
        typescript-language-server = {
          command = "typescript-language-server";
          args = [ "--stdio" ];
        };
        vscode-html-language-server = {
          command = "vscode-html-language-server";
          args = [ "--stdio" ];
        };
        vscode-css-language-server = {
          command = "vscode-css-language-server";
          args = [ "--stdio" ];
        };
        vscode-json-language-server = {
          command = "vscode-json-language-server";
          args = [ "--stdio" ];
        };
        lua-language-server = {
          command = "lua-language-server";
        };
        pyright = {
          command = "pyright-langserver";
          args = [ "--stdio" ];
        };
        ruff = {
          command = "ruff";
          args = [ "server" ];
        };
        svelteserver = {
          command = "svelteserver";
          args = [ "--stdio" ];
        };
        clangd = {
          command = "clangd";
        };
        taplo = {
          command = "taplo";
          args = [
            "lsp"
            "stdio"
          ];
        };
        yaml-language-server = {
          command = "yaml-language-server";
          args = [ "--stdio" ];
        };
        gopls = {
          command = "gopls";
        };
        qmlls = {
          command = "qmlls";
        };
      };

      language = [
        {
          name = "nix";
          language-servers = [ "nil" ];
          auto-format = true;
        }
        {
          name = "rust";
          language-servers = [ "rust-analyzer" ];
          auto-format = true;
        }
        {
          name = "typescript";
          language-servers = [ "typescript-language-server" ];
          auto-format = true;
        }
        {
          name = "javascript";
          language-servers = [ "typescript-language-server" ];
          auto-format = true;
        }
        {
          name = "tsx";
          language-servers = [ "typescript-language-server" ];
          auto-format = true;
        }
        {
          name = "jsx";
          language-servers = [ "typescript-language-server" ];
          auto-format = true;
        }
        {
          name = "html";
          language-servers = [ "vscode-html-language-server" ];
          auto-format = true;
        }
        {
          name = "css";
          language-servers = [ "vscode-css-language-server" ];
          auto-format = true;
        }
        {
          name = "json";
          language-servers = [ "vscode-json-language-server" ];
          auto-format = true;
        }
        {
          name = "lua";
          language-servers = [ "lua-language-server" ];
          auto-format = true;
        }
        {
          name = "python";
          language-servers = [
            "pyright"
            "ruff"
          ];
          auto-format = true;
        }
        {
          name = "svelte";
          language-servers = [ "svelteserver" ];
          auto-format = true;
        }
        {
          name = "c";
          language-servers = [ "clangd" ];
          auto-format = true;
        }
        {
          name = "cpp";
          language-servers = [ "clangd" ];
          auto-format = true;
        }
        {
          name = "toml";
          language-servers = [ "taplo" ];
          auto-format = true;
        }
        {
          name = "yaml";
          language-servers = [ "yaml-language-server" ];
          auto-format = true;
        }
        {
          name = "go";
          language-servers = [ "gopls" ];
          auto-format = true;
        }
        {
          name = "qml";
          language-servers = [ "qmlls" ];
          auto-format = true;
        }
      ];
    };
  };
}

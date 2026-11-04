{ pkgs, ... }: {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      palette = "flexoki_dark";
      format = "$username$hostname$os$directory$git_branch$git_state$git_status$fill$cmd_duration$line_break$character";

      username = {
        format = "[$user]($style)";
        show_always = false;
        style_user = "bold teal";
      };

      hostname = {
        format = "@[$hostname]($style)";
        style = "bold green";
        ssh_only = true;
      };

      os = {
        format = "[$symbol]($style) ";
        disabled = false;
        style = "bold cyan";
        symbols = {
          Arch = "󰣇";
          Ubuntu = "";
          NixOS = "󱄅";
        };
      };

      directory = {
        format = "[$path]($style)[$read_only]($read_only_style) ";
        read_only = " ";
        read_only_style = "bold blue";
        style = "bold blue";
      };

      git_branch = {
        format = "[$symbol$branch(:$remote_branch)]($style) ";
        style = "bold green";
      };

      git_state = {
        format = ''\([$state( $progress_current/$progress_total)]($style)\) '';
        style = "bold green";
      };

      git_status = {
        style = "bold green";
      };

      fill = {
        symbol = " ";
      };

      cmd_duration = {
        min_time = 1000;
        format = " [ $duration]($style)";
        style = "bold text";
      };

      palettes = {
        flexoki_dark = {
          black = "#100F0F";
          white = "#CECDC3";
          red = "#AF3029";
          green = "#879A39";
          yellow = "#AD8301";
          blue = "#4385BE";
          purple = "#5E409D";
          cyan = "#24837B";
          magenta = "#A02F6F";
        };
      };
    };
  };

  home.sessionPath = [
    "$HOME/.cargo/bin"
    "$HOME/.local/bin"
  ];

  programs.fish = {
    enable = true;

    shellAbbrs = {
      c = "clear";
      cdp = "cd ..";
      cdd = "cd ../..";
      mkdir = "mkdir -p";
      ports = "ss -tulpn";
      grep = "rg";
      ga = "git add";
      gc = "git commit";
      gu = "git push";
      gd = "git pull";
      gs = "git status";
      gi = "git init";
      gcl = "git clone";
      gl = "git log";
      t = "tree";
    };

    functions = {
      tree = ''
        if type -q eza
            eza --tree --git-ignore
        else
            echo "eza not found"
        end
      '';

      ls = ''
        if type -q eza
            command eza $argv --git --icons
        else
            command ls $argv
        end
      '';

      cat = ''
        if type -q bat
            command bat $argv
        else
            command cat $argv
        end
      '';
      rebuild = ''
        sudo nixos-rebuild switch --flake /home/lait/dotfiles/nixos#monad-nix
      '';
    };
  };

}

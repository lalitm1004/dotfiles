{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # terminals
    alacritty
    wezterm

    # editors
    helix
    vim

    # other
    typst

    # development
    gnumake
    clang
    gcc
    cargo
    rustc
    python313
    uv
    nodejs_22
    go
    docker
    docker-compose
    supabase-cli
    tmux

    # lsp
    clang-tools
    rust-analyzer
    rustfmt
    typescript-language-server
    tinymist
    marksman
    (python3.withPackages (ps:
      with ps; [
        python-lsp-server
      ]))
    lua-language-server
    taplo
    bash-language-server
    nil
    nixpkgs-fmt

    # cli tools
    black
    bat
    neofetch
    git
    gh
    zoxide
    ripgrep
    htop
    fzf

    # dotfile manager
    stow

    # gaming
    protonup
  ];

  # granular allow unfree
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (pkgs.lib.getName pkg) [
      "steam"
      "steam-original"
      "steam-unwrapped"
      "steam-run"
    ];

  # enable docker on startup
  virtualisation.docker.enable = true;

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  programs.gamemode.enable = true;

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATH = "/home/lalit/.steam/root/compatibilitytools.d";
  };
}

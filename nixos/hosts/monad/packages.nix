{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # terminals
    alacritty

    # editors
    helix
    vim

    # desktop applications
    brave
    discord
    vlc

    # other
    typst

    # development
    gnumake
    clang
    gcc
    cargo
    rustc
    uv
    nodejs_22
    go
    docker
    docker-compose
    supabase-cli
    openssl_3
    prisma
    prisma-engines

    # lsp
    clang-tools
    rust-analyzer
    typescript-language-server
    tinymist
    marksman

    # cli tools
    alejandra
    black
    neofetch
    git
    gh
    zoxide
    ripgrep
    htop

    # dotfile manager
    stow
  ];

  # enable docker on startup
  virtualisation.docker.enable = true;

  # granular allow unfree
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (pkgs.lib.getName pkg) [
      "discord"
      "brave"
    ];
}

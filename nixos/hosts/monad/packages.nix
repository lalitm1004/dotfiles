{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # terminals
    alacritty

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
    (python3.withPackages (ps:
      with ps; [
        python-lsp-server
      ]))

    # cli tools
    alejandra
    black
    neofetch
    git
    gh
    zoxide
    ripgrep
    htop
    fzf

    # dotfile manager
    stow
  ];

  # enable docker on startup
  virtualisation.docker.enable = true;
}

{ inputs, pkgs, ... }: {

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    brave
    firefox
    discord

    stow

    ripgrep
    iproute2

    opencode

    fish

    gh

    quickshell

    vscode

    cloudflare-warp

    kitty
    fuzzel
    waybar
    mako
    hyprlock
    hypridle
    hyprcursor
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    grim
    slurp
    cliphist
    wl-clipboard
    hyprpolkitagent
    brightnessctl
    pamixer
    kdePackages.dolphin
    networkmanager_dmenu
    networkmanagerapplet
    inputs.awww.packages.${pkgs.system}.awww

    nerd-fonts.jetbrains-mono

    # Toolchains

    # C / C++
    gcc
    gdb
    clang-tools
    cmake
    gnumake
    pkg-config

    # Rust
    cargo
    rustc
    rustfmt
    clippy
    rust-analyzer

    # Go
    go
    gopls

    # Nix
    nixfmt

    # Language servers
    nil
    typescript-language-server
    vscode-langservers-extracted
    lua-language-server
    pyright
    ruff
    svelte-language-server
    taplo
    yaml-language-server
    yamlfmt
    qt6.qtdeclarative
  ];
}

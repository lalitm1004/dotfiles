{ inputs, pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Browsers
    brave
    firefox

    # Communication
    discord

    # Editors
    opencode
    vscode

    # Terminal
    fish
    kitty

    # Files
    kdePackages.dolphin

    # Fonts
    nerd-fonts.jetbrains-mono

    # Hyprland / Wayland
    awww
    brightnessctl
    cliphist
    fuzzel
    grim
    hyprcursor
    hypridle
    hyprlock
    hyprpolkitagent
    mako
    networkmanager_dmenu
    networkmanagerapplet
    pamixer
    quickshell
    slurp
    wl-clipboard

    # Hyprland extras (flake inputs)
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default

    # Utilities
    cloudflare-warp
    gh
    iproute2
    ripgrep
    stow

    # Toolchains

    # C / C++
    clang-tools
    cmake
    gcc
    gdb
    gnumake
    pkg-config

    # Rust
    cargo
    clippy
    rust-analyzer
    rustc
    rustfmt

    # Go
    go
    gopls

    # Nix
    nixfmt

    # Language servers
    lua-language-server
    nil
    pyright
    qt6.qtdeclarative
    ruff
    svelte-language-server
    taplo
    typescript-language-server
    vscode-langservers-extracted
    yaml-language-server
    yamlfmt
  ];
}

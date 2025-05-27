{pkgs, ...}: {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (pkgs.lib.getName pkg) [
      "discord"
      "brave"
    ];

  environment.systemPackages = with pkgs; [
    # terminals
    alacritty
    kitty

    # editors
    helix
    vim

    # applications
    brave
    discord
    vlc

    # dotfile manager
    stow

    # cli tools
    alejandra
    neofetch
    git
    gh
    zoxide
    cowsay
  ];
}

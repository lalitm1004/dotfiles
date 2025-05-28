{
  config,
  lib,
  pkgs,
  ...
}: {
  home.username = "lalit";
  home.homeDirectory = "/home/lalit";

  home.packages = with pkgs; [
    # desktop applications
    brave
    discord
    vlc
  ];

  # granular allow unfree
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (pkgs.lib.getName pkg) [
      "discord"
      "brave"
    ];

  home.sessionVariables = {
    EDITOR = "hx";
    ZDOTDIR = "/home/lalit/.config/zsh";
  };

  home.stateVersion = "25.05";
}

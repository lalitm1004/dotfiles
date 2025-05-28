{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # desktop applications
    brave
    discord
    vlc

    # games
    prismlauncher
  ];

  # granular allow unfree
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (pkgs.lib.getName pkg) [
      "discord"
      "brave"
    ];
}

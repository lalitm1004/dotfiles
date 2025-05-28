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

    lutris
  ];

  # granular allow unfree
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (pkgs.lib.getName pkg) [
      "discord"
      "brave"
      "steam"
      "steam-original"
      "steam-unwrapped"
      "steam-run"
    ];
}

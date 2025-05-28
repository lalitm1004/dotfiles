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

    protonplus
  ];

  # granular allow unfree
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (pkgs.lib.getName pkg) [
      "discord"
      "brave"
    ];
}

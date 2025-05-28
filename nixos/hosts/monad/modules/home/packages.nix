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
  ];

  # granular allow unfree
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (pkgs.lib.getName pkg) [
      "discord"
      "brave"
    ];
}

{
  config,
  lib,
  pkgs,
  ...
}: {
  home.username = "lalit";
  home.homeDirectory = "/home/lalit";

  imports = [
    ./env.nix
    ./packages.nix
  ];

  home.stateVersion = "25.05";
}

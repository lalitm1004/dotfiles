{ ... }: {
  home.username = "lait";
  home.homeDirectory = "/home/lait";

  imports = [
    ./env.nix
    ./programs/bat.nix
    ./programs/eza.nix
    ./programs/fish.nix
    ./programs/git.nix
    ./programs/helix.nix
    ./programs/hyprland.nix
    ./programs/hyprpaper.nix
    ./programs/kitty.nix
    ./programs/packages.nix
    ./programs/zoxide.nix
  ];

  home.stateVersion = "26.05";
}

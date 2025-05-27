{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./modules
    ./packages.nix
  ];

  networking.hostName = "monad";

  # enables flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  time.timeZone = "Asia/Kolkata";

  system.stateVersion = "25.05";
}

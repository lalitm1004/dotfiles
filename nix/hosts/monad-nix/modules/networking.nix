{ ... }: {
  networking.hostName = "monad-nix";

  networking.networkmanager.enable = true;
}

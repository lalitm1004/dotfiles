{ ... }: {
  networking.hostName = "monad-nix";

  networking.networkmanager.enable = true;

  services.cloudflare-warp.enable = true;
}

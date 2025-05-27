{
  imports = [
    ./xserver.nix
    ./sound.nix
  ];

  services.printing.enable = true;
}

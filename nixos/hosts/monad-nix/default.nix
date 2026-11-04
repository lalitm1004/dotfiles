{ inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
  ];

  nixpkgs.config.allowUnfree = true;

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users."lait" = import ../../home/lait;
    backupFileExtension = "backup";
  };

  system.stateVersion = "26.05";
}

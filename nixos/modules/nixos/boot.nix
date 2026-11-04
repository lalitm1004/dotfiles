{ pkgs, ... }: {
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    useOSProber = true;
  };

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = -1;

  boot.kernelPackages = pkgs.linuxPackages_latest;
}

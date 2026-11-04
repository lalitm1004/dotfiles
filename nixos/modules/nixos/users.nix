{ pkgs, ... }: {
  programs.fish = {
    enable = true;
  };

  users.users."lait" = {
    isNormalUser = true;
    description = "lait";
    extraGroups = [
      "networkmanager"
      "wheel"
      "dialout"
      "plugdev"
    ];
    packages = [ pkgs.fish ];
    shell = pkgs.fish;
  };

  users.groups = {
    plugdev = { };
  };

  services.udev = {
    packages = [ pkgs.probe-rs-tools ];
    extraRules = ''
      SUBSYSTEM=="tty", ATTRS{idVendor}=="303a", TAG+="uaccess", MODE="0660", GROUP="dialout"
      SUBSYSTEMS=="usb", ATTRS{idVendor}=="303a", MODE="0660", GROUP="plugdev"
    '';
  };
}

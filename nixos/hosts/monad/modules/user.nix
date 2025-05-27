{ pkgs, ...  }: {
  programs.zsh.enable = true;

  users= {
    defaultUserShell = pkgs.zsh;

    users.lalit = {
      isNormalUser = true;
      description = "lalitm1004";
      extraGroups = [
        "networkmanager"
        "wheel"
        "input"
      ];
      packages = with pkgs; [];
    };
  };
}

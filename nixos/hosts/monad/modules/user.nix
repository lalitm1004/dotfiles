{
  inputs,
  pkgs,
  ...
}: {
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;

    users.lalit = {
      isNormalUser = true;
      description = "lalit";
      extraGroups = [
        "networkmanager"
        "wheel"
        "input"
        "docker"
      ];
      packages = with pkgs; [];
    };
  };

  # home-manager
  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "lalit" = import ./home;
    };
    backupFileExtension = "backup";
  };
}

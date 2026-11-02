{ inputs, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vim
    curl
    wget
    git

  ];

	programs.hyprland = {
		enable = true;
		package = inputs.hyprland.packages.${pkgs.system}.hyprland;
	};
}

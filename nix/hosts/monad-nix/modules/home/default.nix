{ ... }: {
	home.username = "lait";
	home.homeDirectory = "/home/lait";

	imports = [
		./env.nix
		./packages.nix
		./hyprland.nix
		./waybar.nix
		./fish.nix
		./hyprpaper.nix
	];

	home.stateVersion = "26.05";

	programs.kitty = {
		enable = true;
		settings = {
			background_opacity = "0.4";
		};
	};
}

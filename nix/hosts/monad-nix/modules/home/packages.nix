{inputs,  pkgs, ... }: {

	nixpkgs.config.allowUnfree = true;

	home.packages = with pkgs; [
		brave
		firefox
		discord
		
		helix
		stow

		ripgrep
		iproute2

		inputs.opencode.packages.${pkgs.system}.opencode

		fish

		gh
	
		kitty
		fuzzel
		waybar
		mako
		hyprlock
	  hypridle
	  hyprcursor
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
		grim
		slurp
		cliphist
		wl-clipboard
		hyprpolkitagent
		brightnessctl
		pamixer
		kdePackages.dolphin
		networkmanager_dmenu
		networkmanagerapplet
		inputs.awww.packages.${pkgs.system}.awww
		
		nerd-fonts.jetbrains-mono
	];
}

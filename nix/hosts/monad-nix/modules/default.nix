{ ... }: {
	imports = [
		./nix.nix
		./boot.nix
		./networking.nix
		./locale.nix
		./desktop.nix
		./sound.nix
		./printing.nix
		./security.nix
		./users.nix
		./packages.nix
	];
}

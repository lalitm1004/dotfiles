{ inputs, pkgs, ... }: {
	programs.fish = {
		enable = true;
	};
	
  users.users."lait" = {
    isNormalUser = true;
    description = "lait";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = [  pkgs.fish ];
    shell = pkgs.fish;
  };
 
	home-manager = {
		extraSpecialArgs = { inherit inputs; };
		users = {
			"lait" = import ./home;
		};

		backupFileExtension = "backup";
	};
}

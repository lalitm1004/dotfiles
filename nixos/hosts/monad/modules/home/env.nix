{ config, ... }: {
  home.file = {
    ".zshenv".text = ''
      export ZDOTDIR="$HOME/.config/zsh"
    '';
  };

  xdg.userDirs = {
    enable = true;
    desktop = "${config.home.homeDirectory}/.home/Desktop";
    download = "${config.home.homeDirectory}/.home/Downloads";
    documents = "${config.home.homeDirectory}/.home/Documents";
    music = "${config.home.homeDirectory}/.home/Music";
    pictures = "${config.home.homeDirectory}/.home/Pictures";
    publicShare = "${config.home.homeDirectory}/.home/Public";
    templates = "${config.home.homeDirectory}/.home/Templates";
    videos = "${config.home.homeDirectory}/.home/Videos";
  };
}

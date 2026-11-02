{ config, ... }: {
  home.file = {
    ".config/user-dirs.dirs".text = ''
      XDG_DESKTOP_DIR="$HOME/.home/Desktop"
      XDG_DOWNLOAD_DIR="$HOME/.home/Downloads"
      XDG_TEMPLATES_DIR="$HOME/.home/Templates"
      XDG_PUBLICSHARE_DIR="$HOME/.home/Public"
      XDG_DOCUMENTS_DIR="$HOME/.home/Documents"
      XDG_MUSIC_DIR="$HOME/.home/Music"
      XDG_PICTURES_DIR="$HOME/.home/Pictures"
      XDG_VIDEOS_DIR="$HOME/.home/Videos"
      XDG_PROJECTS_DIR="$HOME/.home/Projects"
    '';
  };
}

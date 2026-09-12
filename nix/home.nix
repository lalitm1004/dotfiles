{
  pkgs,
  config,
  ...
}:

{
  home.username = "lait";
  home.homeDirectory = "/home/lait";

  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    git
    curl
    vim
    btop
    fish
    stow
    gh
    helix
    nil
    rustup
    keepassxc

    fish-lsp
    taplo
    clang-tools

    nerd-fonts.jetbrains-mono

    gnomeExtensions.just-perfection
  ];

  fonts.fontconfig.enable = true;

  xdg.userDirs = {
    enable = true;
    createDirectories = true; # Automatically creates the new target folders

    # Point all user directories inside the hidden .desktop folder
    desktop = "${config.home.homeDirectory}/.desktop/Desktop";
    documents = "${config.home.homeDirectory}/.desktop/Documents";
    download = "${config.home.homeDirectory}/.desktop/Downloads";
    music = "${config.home.homeDirectory}/.desktop/Music";
    pictures = "${config.home.homeDirectory}/.desktop/Pictures";
    publicShare = "${config.home.homeDirectory}/.desktop/Public";
    templates = "${config.home.homeDirectory}/.desktop/Templates";
    videos = "${config.home.homeDirectory}/.desktop/Videos";

    extraConfig = {
      XDG_PROJECTS_DIR = "${config.home.homeDirectory}/.desktop/Projects";
    };
  };

  dconf.settings = {
    "org/gnome/shell" = {
      disabled-extensions = [
        "ubuntu-dock@ubuntu.com"
      ];
      enabled-extensions = [
        "just-perfection-desktop@just-perfection"
      ];
    };

    "org/gnome/shell/extensions/just-perfection" = {
      dash = false; # this is the one that removes it from the Super/Activities overview too
    };

    "org/gnome/shell/keybindings" = {
      switch-to-application-1 = [ ];
      switch-to-application-2 = [ ];
      switch-to-application-3 = [ ];
      switch-to-application-4 = [ ];
    };

    # 2. Map Super + 1/2/3/4 to jump directly to that workspace
    "org/gnome/desktop/wm/keybindings" = {
      switch-to-workspace-1 = [ "<Super>1" ];
      switch-to-workspace-2 = [ "<Super>2" ];
      switch-to-workspace-3 = [ "<Super>3" ];
      switch-to-workspace-4 = [ "<Super>4" ];
    };

    # Global window manager behavior
    "org/gnome/desktop/wm/preferences" = {
      # Set to false so Alt+Tab searches all workspaces, not just the current one
      workspace-only-window-switching = false;
    };

    # Modern GNOME Shell switcher behavior (covers both popups)
    "org/gnome/shell/window-switcher" = {
      current-workspace-only = false;
    };

    "org/gnome/shell/app-switcher" = {
      current-workspace-only = false;
    };
  };

  programs.home-manager.enable = true;
}

{config, ...}: {
  home.file = {
    ".zshenv".text = ''
      export ZDOTDIR="$HOME/.config/zsh"
    '';
  };
}

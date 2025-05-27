# aliases
alias neko='echo miao'
alias nix-rebuild='sudo nixos-rebuild switch --flake ~/dotfiles/nixos'

alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias gu='git push'
alias gd='git pull'
alias gs='git status'
alias gi='git init'
alias gcl='git clone'

# path
export PATH="$PATH:$HOME/.cargo/bin:"

eval "$(zoxide init zsh)"

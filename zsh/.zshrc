# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# setup zinit home
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# p10k install
zinit ice depth=1; zinit light romkatv/powerlevel10k

# add zsh plugins
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#c0c0c0'
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

autoload -U compinit && compinit

# p10k source
[[ ! -f "$ZDOTDIR/.p10k.zsh" ]] || source "$ZDOTDIR/.p10k.zsh"

# keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# history
HISTSIZE=10000
HISTFILE="$ZDOTDIR/.zsh_history"
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups 
setopt hist_ignore_dups
setopt hist_find_no_dups

# completion sytling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath' 

# aliases
alias ls='ls --color'

alias neko='echo miao'
alias nix-rebuild='$HOME/dotfiles/rebuild.sh'

alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias gu='git push'
alias gd='git pull'
alias gs='git status'
alias gi='git init'
alias gcl='git clone'
alias gl='git log'

alias cat="bat"
alias fzf='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'

alias tmux='tmux -f ~/.config/tmux/.tmux.conf'
alias tn='tmux new-session -s'
alias tl='tmux list-sessions'
alias ta='tmux attach-session'
alias tk='tmux kill-session'

alias tree='tree --gitignore'
alias prism='~/.local/bin/PrismLauncher.AppImage'

# path
export PATH="$PATH:/opt/nvim-linux-x86_64/bin:"
export PATH="$PATH:$HOME/.cargo/bin:"
export PATH="$PATH:/usr/local/go/bin:"
export PATH="$PATH:$HOME/.local/bin:"
export PATH="$PATH:$(go env GOPATH)/bin"
. "$HOME/.cargo/env"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

eval "$(zoxide init zsh)"
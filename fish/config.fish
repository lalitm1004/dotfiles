if status is-interactive
    abbr --add c clear
    abbr --add cdp 'cd ..'
    abbr --add cdd 'cd ../..'
    abbr --add mkdir 'mkdir -p'
    abbr --add ports 'ss -tulpn'
    abbr --add grep rg
    abbr --add ga 'git add'
    abbr --add gc 'git commit'
    abbr --add gu 'git push'
    abbr --add gd 'git pull'
    abbr --add gs 'git status'
    abbr --add gi 'git init'
    abbr --add gcl 'git clone'
    abbr --add gl 'git log'
    abbr --add t tree

    # Nix Packages
    fish_add_path /nix/var/nix/profiles/default/bin
    fish_add_path ~/.nix-profile/bin

    # path
    fish_add_path ~/.cargo/bin
    fish_add_path ~/.local/bin

    # starship
    set -gx STARSHIP_CONFIG ~/.config/starship/starship.toml
    starship init fish | source

    # zoxide
    zoxide init fish | source
end

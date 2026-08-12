if status is-interactive
	abbr --add c clear
	abbr --add cd z
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

	function cat
        	if type -q bat
            		command bat $argv
		else
            		command cat $argv
      		end
    	end

    	function ls
        	if type -q eza
            		command eza $argv --git --icons
        	else
            		command ls $argv
        	end
	end

	# path
	fish_add_path ~/.cargo/bin
	fish_add_path ~/.local/bin

	# starship
	set -gx STARSHIP_CONFIG ~/.config/starship/starship.toml
	starship init fish | source

	# zoxide
	zoxide init fish | source
end

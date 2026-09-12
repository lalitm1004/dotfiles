function ls
    if type -q eza
        command eza $argv --git --icons
    else
        command ls $argv
    end
end

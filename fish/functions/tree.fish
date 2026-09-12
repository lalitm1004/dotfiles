function tree
    if type -q eza
        eza --tree --git-ignore
    else
        echo "eza not found"
    end
end

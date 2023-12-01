function bubu -d "Update brew and packages"
    brew update && brew upgrade
    brew cleanup && brew autoremove
end

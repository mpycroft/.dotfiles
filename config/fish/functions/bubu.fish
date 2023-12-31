function bubu -d "Update Homebrew and packages"
    brew update && brew upgrade
    brew cleanup && brew autoremove
end

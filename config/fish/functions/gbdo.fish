function gbdo -d "Delete local and origin branch"
    git branch -d $argv
    git push -d origin $argv
end

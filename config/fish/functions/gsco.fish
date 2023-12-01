function gsco -d "Switch and create branch and push to origin"
    git switch --create $argv
    git push -u origin $argv
end

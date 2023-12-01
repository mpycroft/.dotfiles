function __git_local_branches
    git for-each-ref --format='%(refname:strip=2)%09Local Branch' \
        --sort=-committerdate refs/heads/ 2>/dev/null
end

complete -c gbdo -f -ka '(__git_local_branches)'

# Add Fisher directory to the Fish completion and function paths and then load
# any files in Fisher's conf.d directory. Note that Fish's complete/function
# paths are global so we can't set them as universal, hence we have to do this
# on every load.

set -g fisher_path ~/.config/fisher
set -ga fish_complete_path $fisher_path/completions
set -ga fish_function_path $fisher_path/functions

for conf_file in $fisher_path/conf.d/*
    if test -f $conf_file
        source $conf_file
    end
end

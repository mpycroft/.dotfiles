# Use a guard variable so we don't have to perform setup every time we start.
# This method is used instead of just storing fish_variables into git since
# paths are stored fully expanded in the fish_variables file so they won't work
# when switching between ARM and Intel homebrew.
if not set -q __custom_fish_init
    switch (uname -m)
        case arm64
            set Homebrew /opt/homebrew
        case x86_64
            set Homebrew /usr/local
        case "*"
            echo "Unknown architecture, can't configure homebrew! Fix" \
                "config/fish/config.fish to handle this case."
            exit 1
    end

    set -U fish_user_paths $Homebrew/bin $Homebrew/sbin /opt/rust/cargo/bin
    set -Ua fish_user_paths \
        /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin

    # Setup Rust variables since I'd prefer to keep it elsewhere than $HOME
    set -Ux CARGO_HOME /opt/rust/cargo/
    set -Ux RUSTUP_HOME /opt/rust/rustup/

    set -U fish_greeting

    # Keep Starship configuration file in its own directory
    set -Ux STARSHIP_CONFIG ~/.config/starship/starship.toml

    # Default colour theme was changed to use ANSI colours, so set the old
    # colours here.
    set -U fish_color_normal normal
    set -U fish_color_command 005fd7
    set -U fish_color_quote 999900
    set -U fish_color_redirection 00afff
    set -U fish_color_end 009900
    set -U fish_color_error ff0000
    set -U fish_color_param 00afff
    set -U fish_color_comment 990000
    set -U fish_color_match --background=brblue
    set -U fish_color_search_match bryellow --background=brblack
    set -U fish_color_selection white --bold --background=brblack
    set -U fish_color_history_current --bold
    set -U fish_color_operator 00a6b2
    set -U fish_color_escape 00a6b2
    set -U fish_color_cwd green
    set -U fish_color_valid_path --underline
    set -U fish_color_cwd_root red
    set -U fish_color_user brgreen
    set -U fish_color_autosuggestion 555 brblack
    set -U fish_pager_color_completion normal
    set -U fish_color_host normal
    set -U fish_pager_color_description B3A06D yellow
    set -U fish_color_cancel -r
    set -U fish_pager_color_prefix normal --bold --underline
    set -U fish_pager_color_progress brwhite --background=cyan
    set -U fish_pager_color_selected_background -r
    set -U fish_color_option 00afff
    set -U fish_color_keyword 005fd7

    set -U __custom_fish_init
end

starship init fish | source

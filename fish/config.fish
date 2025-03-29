if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

source ~/.config/fish/env.fish

source ~/.config/fish/ch-functions.fish
source ~/.config/fish/git-functions.fish

starship init fish | source

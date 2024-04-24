# source <(gopass completion bash)
alias tmux=tmux -2

function rebuild {
    echo "$1 $2"
    sudo nixos-rebuild $1 --flake "${HOME}/tools/dotfiles/nixos/#${2}"
}

#!/usr/bin/env zsh

if ! command -v conda >/dev/null; then
    echo 'conda command not found: please install via https://conda.io/'
fi

if ! command -v fzf >/dev/null; then
    echo 'fzf command not found: please install via "brew install fzf"'
fi

# functions
function fuzzy_conda_activate() {
    local env=$(conda env list | awk '3<=NR && NR<($Num) {print$1}' | fzf --query="$1")

    if [[ is_active ]]; then
        conda deactivate && conda activate $env
    else
        conda activate $env
    fi
}

function is_active() {
    if [ -z "$(echo $CONDA_DEFAULT_ENV)" ]; then
        return 1
    else
        return 0
    fi
}

alias cda='fuzzy_conda_activate'
alias cdd='conda deactivate'

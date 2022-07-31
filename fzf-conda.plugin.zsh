#!/usr/bin/env zsh

if ! command -v conda >/dev/null; then
    echo 'conda command not found: please install via https://conda.io/'
fi

if ! command -v fzf >/dev/null; then
    echo 'fzf command not found: please install via "brew install fzf"'
fi

# functions
function fuzzy_conda_activate() {
    if [[ -z "$1" ]]; then
        printf "No environment name provided.\n"
        local env=$(conda env list | awk '3<=NR && NR<($Num) {print$1}' | fzf --query="$1")
    elif [ -z "$(conda env list | grep $1)" ]; then
        local env="$1"
        printf "Environment '$env' not found.\n"
        printf "Creating environment '$env'...\n"
        conda create -n "$env"
    else
        local env="$1"
    fi

    if [ "$(echo $CONDA_DEFAULT_ENV)" ]; then
        printf "Deactivating environment '$CONDA_DEFAULT_ENV'...\n"
        conda deactivate && conda activate "$env"
    else
        conda activate "$env"
    fi
}

alias cda='fuzzy_conda_activate'
alias cdd='conda deactivate'
alias cdel='conda env list'
alias cdl='conda list'
alias cdc='conda create -n'
alias cdi='conda install'

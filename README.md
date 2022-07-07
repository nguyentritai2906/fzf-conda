# Conda environment enhanced with fzf

Use the excellent [fzf](https://github.com/junegunn/fzf) to activate [conda](https://conda.io) environment.

## Usage

The following alias is defined:

* `cda`: Fuzzy search and activate environment
* `cdd`: Conda deactivate

You can specify a search parameter, e.g., `fcd base` will start your search with `base`.

## Install

### `ohmyzsh`

1. `cd ~/.oh-my-zsh/custom/plugins`
2. `git clone git@github.com:nguyentritai2906/fzf-conda.git fzf-conda`
3. Add `fzf-conda` to your `.zshrc` plugin list `plugins=(... fzf-conda)`

### `zgen` or `zgenom`

Add `zgenom load nguyentritai2906/fzf-conda` or `zgenom load nguyentritai2906/fzf-conda` to your `.zshrc`

### `antigen`

Add `antigen bundle nguyentritai2906/fzf-conda` to your `.zshrc`

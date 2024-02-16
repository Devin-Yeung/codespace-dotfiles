#!/bin/zsh
# man pages
export MANPATH=$(manpath -g):~/.codespace/man

# useful alias
alias ls='exa'
alias lg='lazygit'
alias pt='poetry'
alias mamba='micromamba'
alias chad='nvim'

# Rust Setup
function install_rust() {
  # rust
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  # cargo binstall
  curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash
}

# Check if Rust environment exists
if [ -d "$HOME/.cargo" ]; then
  source "$HOME/.cargo/env"
fi

if [ -d "$HOME/.rye/env" ]; then
  source "$HOME/.rye/env"
fi

# antigen
source ~/.zsh/antigen/antigen.zsh

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

function zvm_config() {
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  ZVM_VI_INSERT_ESCAPE_BINDKEY=jj
}

# see https://github.com/jeffreytse/zsh-vi-mode/issues/25
function zvm_after_init() {
  antigen bundle zsh-users/zsh-autosuggestions
  antigen bundle zsh-users/zsh-completions
}

antigen bundle jeffreytse/zsh-vi-mode
antigen apply

# init mamba if exists
if which micromamba &> /dev/null; then
  eval "$(micromamba shell hook --shell zsh)"
fi

# starship init
eval "$(starship init zsh)"

# zoxide init
eval "$(zoxide init zsh)"

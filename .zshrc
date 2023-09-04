#!/bin/zsh
# man pages
export MANPATH=$(manpath -g):~/.codespace/man

# useful alias
alias ls='exa'
alias lg='lazygit'
alias pt='poetry'
alias mamba='micromambar'
alias chad='nvim'

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

set -gx PYENV_ROOT $HOME/.pyenv
set -gx PATH $PYENV_ROOT/bin $PATH
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
eval pyenv init - | source

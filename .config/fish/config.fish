set -gx PYENV_ROOT $HOME/.pyenv/bin 
set -gx PATH $PYENV_ROOT/bin $PATH
alias v='nvim'
alias vi='nvim'
eval pyenv init - | source

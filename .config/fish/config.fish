set -gx PYENV_ROOT $HOME/.pyenv
set -gx PATH $PYENV_ROOT/bin $HOME/.cargo/bin $PATH
set -gx RUST_SRC_PATH (rustc --print sysroot)/lib/rustlib/src/rust/src
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
pyenv init - | source

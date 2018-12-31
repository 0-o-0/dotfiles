# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel9k/powerlevel9k"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  z
  fzf
  zsh-completions
)

source $ZSH/oh-my-zsh.sh


### Customization Section
# use vi to edit commands
bindkey -v

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--extended"
# fd is a faster version of find
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export PATH="/usr/local/sbin:$PATH"

# Racer - Rust Auto-Complete-er
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# aliases for Cargo
alias cb="cargo build"
alias cr="cargo run"
alias ct="cargo test"
alias cc="cargo check"

# alias for long-running command notification
alias notif='echo NOTIFY ME'

# gnu-getopt
export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"

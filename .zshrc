# Persist and share history between terminal sessions.
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000
setopt extended_history hist_expire_dups_first hist_ignore_dups
setopt hist_ignore_space hist_verify share_history

# Native completion, including Git, with case-insensitive matching.
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
bindkey -e

# A small prompt with the current directory and normal/root indicator.
PROMPT='%F{cyan}%1~%f %# '

# Preferred editor for local and remote sessions.
# Use Zed's app-bundled CLI directly so the AuthZed `zed` command remains available.
if [[ -x /Applications/Zed.app/Contents/MacOS/cli ]]; then
  export EDITOR='/Applications/Zed.app/Contents/MacOS/cli --wait'
  export VISUAL="$EDITOR"
fi

alias lg='lazygit'

# Local tools, asdf-managed runtimes, and Bun.
export BUN_INSTALL="$HOME/.bun"
typeset -U path PATH
path=("$BUN_INSTALL/bin" "$HOME/.asdf/shims" "$HOME/.local/bin" $path)
export PATH

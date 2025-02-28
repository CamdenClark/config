# Uncomment to profile -- this was exceptionally helpful!
# Also uncomment the zprof line at the end of the file
# zmodload zsh/zprof

export PATH=$HOME/anaconda3/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/go/bin:$PATH
export PATH=$HOME/flutter/bin:$PATH
export PATH=$HOME/lua-language-server/bin:$PATH
export PATH=$HOME/app/terraform/bin:$PATH
export FLYCTL_INSTALL="/home/camden/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
export PATH=$HOME/.local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

HYPHEN_INSENSITIVE="true"

export VAULT_ADDR="https://vault.amperity.top:8200"

zstyle ':omz:update' mode auto      # update automatically without asking

# Uncomment the following line to disable auto-setting terminal title.
export DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(asdf git httpie lein npm)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='nvim'
export BROWSER='/usr/bin/firefox'
export NOTES="$HOME/notes/camden"
export MACHINE='home'
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="nvim ~/.zshrc"
alias lg="lazygit"
alias claude="ccode"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias luamake=/luamake

# pnpm
export PNPM_HOME="/home/camden/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# opam configuration
[[ ! -r /home/camden/.opam/opam-init/init.zsh ]] || source /home/camden/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
export GODEBUG=asyncpreemptoff=1
export TFENV_ARCH=amd64

# bun completions
[ -s "/home/camden/.bun/_bun" ] && source "/home/camden/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

if [[ -e ~/.openai ]]; then
   export OPENAI_API_KEY=$(cat ~/.openai)
fi

if [[ -e ~/work.sh ]]; then
   source ~/work.sh
fi

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
#if [[ -e ~/home.sh ]]; then
#fi
ulimit -n 524288
# Uncomment to profile
# zprof

# Added by Windsurf
export PATH="/Users/camdenclark/.codeium/windsurf/bin:$PATH"

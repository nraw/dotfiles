# User configuration

# Prompt

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr 'green'
zstyle ':vcs_info:*' unstagedstr 'blue' 
zstyle ':vcs_info:git:*' formats '%c%u%m %F{%c%u%m}%b%f '
# zstyle ':vcs_info:*' formats "%u%c%m"
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]]
     git status --porcelain | grep -m 1 '^??' &>/dev/null
  then
    hook_com[misc]='red'
  fi
}

setopt PROMPT_SUBST
PROMPT='%F{%(?.blue.red)}%~%f ${vcs_info_msg_0_}$ '
# '%F{%(?.blue.red)}%~%f'

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

export VISUAL=nvim
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Auto suggestion
# source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#bindkey '^ ' autosuggest-accept

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Aliases
. ~/.zsh_aliases

# Virtual env wrapper
# export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
# export WORKON_HOME=$HOME/.virtualenvs
# export PROJECT_HOME=$HOME/code
# source /usr/local/bin/virtualenvwrapper.sh

autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# Vault
export VAULT_ADDR='https://vault.prod.init.ak8s.mckinsey.com'
complete -o nospace -C /usr/local/bin/vault vault

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ALT-I - Paste the selected entry from locate output into the command line
fzf-locate-widget() {
  local selected
  if selected=$(locate / | fzf -q "$LBUFFER"); then
    LBUFFER=$selected
  fi
  zle redisplay
}
zle     -N    fzf-locate-widget
bindkey '\ei' fzf-locate-widget

# Created by `userpath` on 2020-03-17 13:05:08
export PATH="$PATH:/Users/andrej_marsic/.local/bin"

# Brew shouldn't upgrade everything every time I want to install something
export HOMEBREW_NO_AUTO_UPDATE=1

# box autocomplete setup
BOX_AC_ZSH_SETUP_PATH=/Users/andrej_marsic/Library/Caches/@box/cli/autocomplete/zsh_setup && test -f $BOX_AC_ZSH_SETUP_PATH && source $BOX_AC_ZSH_SETUP_PATH;
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

# Fix backspace
bindkey -v '^?' backward-delete-char

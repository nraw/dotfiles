# User configuration

# Prompt

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%F{%m}%b%f '
zstyle ':vcs_info:git:*' actionformats '%F{%m}%b%f|%a '
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]]
  then
    st=$(git status --porcelain)
    if echo $st | grep -m 1 '^UU' &>/dev/null
    then
      hook_com[misc]='magenta'
    elif echo $st | grep -m 1 '^??' &>/dev/null
    then
      hook_com[misc]='red'
    elif echo $st | grep -m 1 '^ M' &>/dev/null
    then
      hook_com[misc]='red'
    elif echo $st | grep -m 1 '^M' &>/dev/null
    then
      hook_com[misc]='yellow'
    elif echo $st | grep -m 1 '^A' &>/dev/null
    then
      hook_com[misc]='yellow'
    else
      hook_com[misc]='green'
    fi
  else
    hook_com[misc]='white'
  fi
}

setopt PROMPT_SUBST
PROMPT='%F{%(?.blue.red)}%~%f ${vcs_info_msg_0_}$ '

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=$HISTSIZE
# Append immediately
setopt INC_APPEND_HISTORY
# Add timestamps
export HISTTIMEFORMAT="[%F %T] "
setopt EXTENDED_HISTORY
# No duplicates
setopt HIST_FIND_NO_DUPS
export HISTTIMEFORMAT="%F %T "

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

# locales

export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Auto suggestion
# source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#bindkey '^ ' autosuggest-accept

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Aliases
. ~/.zsh_aliases


autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# Vault
export VAULT_ADDR='https://vault.dsi.mckinsey.com'
complete -o nospace -C /usr/local/bin/vault vault

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/bin"

# Brew shouldn't upgrade everything every time I want to install something
export HOMEBREW_NO_AUTO_UPDATE=1

# box autocomplete setup
BOX_AC_ZSH_SETUP_PATH=/Users/andrej_marsic/Library/Caches/@box/cli/autocomplete/zsh_setup && test -f $BOX_AC_ZSH_SETUP_PATH && source $BOX_AC_ZSH_SETUP_PATH;
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

# Fix backspace
bindkey -v '^?' backward-delete-char

# Vi mode stuff

# edit command by pressing esc + v
autoload edit-command-line; zle -N edit-command-line
# bindkey -M vicmd v edit-command-line
bindkey "^X^E" edit-command-line
bindkey -M viins '\e.' insert-last-word

# use ctrl-z to go back to the app
bindkey -s "^Z" 'fg^M'

# Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
export KEYTIMEOUT=1

# FASD
eval "$(fasd --init auto)"

export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export WORKON_HOME=~/.venv

# added by Snowflake SnowSQL installer v1.2
export PATH=/Applications/SnowSQL.app/Contents/MacOS:$PATH

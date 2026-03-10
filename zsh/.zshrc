# User configuration

# Prompt theme

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

# Better history search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
export VISUAL=vim

# locales

export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Auto suggestion
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Aliases
. ~/.zsh_aliases


# Only regenerate compdump once per day
autoload -Uz compinit
setopt local_options extendedglob
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

autoload -U +X bashcompinit && bashcompinit

# fzf tab
source $HOME/code/random/fzf-tab/fzf-tab.zsh
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -trh $realpath'
zstyle ':fzf-tab:*' switch-group ',' '.'

# Vault
export VAULT_ADDR='https://vault.dsi.mckinsey.com'
complete -o nospace -C /usr/local/bin/vault vault

# Fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_CTRL_T_OPTS="--preview='bat --color=always {} || ls {}' --bind shift-up:preview-page-up,shift-down:preview-page-down"

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/bin"

# Brew shouldn't upgrade everything every time I want to install something
export HOMEBREW_NO_AUTO_UPDATE=1

# box autocomplete setup
BOX_AC_ZSH_SETUP_PATH=/Users/andrej_marsic/Library/Caches/@box/cli/autocomplete/zsh_setup && test -f $BOX_AC_ZSH_SETUP_PATH && source $BOX_AC_ZSH_SETUP_PATH;
# Lazy-load kubectl completions
kubectl() {
  unfunction kubectl
  source <(command kubectl completion zsh)
  command kubectl "$@"
}

# Fix backspace
bindkey -v '^?' backward-delete-char

# Vi mode stuff

# edit command by pressing esc + v
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line
bindkey "^X^E" edit-command-line
bindkey -M viins '\e.' insert-last-word

# use ctrl-z to go back to the app
bindkey -s "^Z" 'fg^M'

# Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
export KEYTIMEOUT=1

# Zoxide (directory jumper, replaces fasd)
eval "$(zoxide init zsh --cmd j)"

export VIRTUALENVWRAPPER_PYTHON=/Users/Andrej_Marsic/.pyenv/versions/3.11.3/bin/python3
export WORKON_HOME=~/.venv
export VIRTUALENVWRAPPER_SCRIPT=/Users/Andrej_Marsic/.pyenv/versions/3.11.3/bin/virtualenvwrapper.sh
source /Users/Andrej_Marsic/.pyenv/versions/3.11.3/bin/virtualenvwrapper_lazy.sh

# added by Snowflake SnowSQL installer v1.2
export PATH=/Applications/SnowSQL.app/Contents/MacOS:$PATH
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# Cached pyenv init (rm ~/.pyenv-init-cache after upgrading pyenv)
_pyenv_cache="$HOME/.pyenv-init-cache"
if [[ ! -s "$_pyenv_cache" || ~/.pyenv/versions -nt "$_pyenv_cache" ]]; then
  pyenv init - --no-rehash > "$_pyenv_cache"
fi
source "$_pyenv_cache"
unset _pyenv_cache

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk && export PATH=$PATH:$ANDROID_HOME/emulator && export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
EAS_AC_ZSH_SETUP_PATH=/Users/Andrej_Marsic/Library/Caches/eas-cli/autocomplete/zsh_setup && test -f $EAS_AC_ZSH_SETUP_PATH && source $EAS_AC_ZSH_SETUP_PATH;
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc'; fi

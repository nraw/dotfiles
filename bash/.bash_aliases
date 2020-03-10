alias nrawpi='ssh 192.168.0.94 -l pi'
alias nrawpi3='ssh 192.168.0.129 -l pi'
alias nrawzero='ssh 192.168.0.108 -l pi'
alias nrawpisftp='sftp pi@192.168.0.94'
alias dush='du -sh *'
alias go='gnome-open'
alias mutt='neomutt'
alias eshell='rshell -p /dev/ttyUSB0'
alias mount_drive='sshfs pi@192.168.0.94:/mnt/Elements /mnt/Elements'
alias xc='xclip -sel clip'
alias l='exa -l --git'
alias lg='git lg'
alias nn='nvim -c "Notes"'
alias dot='nvim ~/dotfiles/$(cd ~/dotfiles && git ls-files | fzf)'
alias n="nvim"
alias lsd='ls -d "$PWD"/*'
alias kp='xargs -I _ kedropipe _'
alias pp='pwd | xclip'

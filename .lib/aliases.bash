
# standard ubuntu aliases
alias ll='ls -AlF'
alias lt='ls -AltF'
alias la='ls -A'
alias l='ls -CF'
alias sl='ll'
alias gitup='git stash; git pull --rebase; git stash pop'
alias gitst='git status; echo "------STASHES------"; git stash list | head '
alias diskspace="du -S | sort -n -r | more"
alias folders="find . -maxdepth 1 -type d -print | xargs du -sk | sort -rn"
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   <command>; alert. For example: sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


alias hosts='sudo $EDITOR /etc/hosts'
alias reload_bash='. ~/.bash_profile'
alias histg="history | grep"
alias top="htop"
alias ..='cd ..'
alias ...='cd ../..'
alias fadb=fb-adb
alias pdf='open -a Preview '
alias ppath="echo $PATH | sed -e 's/:/\'$'\n/g'"
# alias emacs='emacsclient -nw -c -a ""'
alias gerp='grep'
alias dotfiles="code ~/dotfiles"
# Pipe my public key to my clipboard.
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"
alias tial='tail'
alias dott="cd ${HOME}/.dotfiles"
alias pingg='ping www.google.com'
alias funcs="cat ~/dotfiles/.lib/functions.bash | grep function | awk '{print OB\$2}'"
alias myip="ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'"
alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"
alias rm='rm -vi'
alias cp='cp -vi'
alias mv='mv -vi'
alias ccat="pygmentize -g"
alias sshconf="cat ~/.ssh/config"
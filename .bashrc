# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# Define color and format variables
FMT_BOLD="\[\e[1m\]"
FMT_DIM="\[\e[2m\]"
FMT_RESET="\[\e[0m\]"
FMT_UNBOLD="\[\e[22m\]"
FMT_UNDIM="\[\e[22m\]"

FG_BLACK="\[\e[30m\]"
FG_BLUE="\[\e[34m\]"
FG_CYAN="\[\e[36m\]"
FG_GREEN="\[\e[32m\]"
FG_GREY="\[\e[37m\]"
FG_MAGENTA="\[\e[35m\]"
FG_RED="\[\e[31m\]"
FG_WHITE="\[\e[97m\]"

BG_BLACK="\[\e[40m\]"
BG_BLUE="\[\e[44m\]"
BG_CYAN="\[\e[46m\]"
BG_GREEN="\[\e[42m\]"
BG_MAGENTA="\[\e[45m\]"
BG_RED="\[\e[41m\]"

# Git branch and status background color
parse_git_bg() {
  [[ $(git status -s 2> /dev/null) ]] && echo -e "\e[43m" || echo -e "\e[42m"
}

# Git branch and status text color
parse_git_fg() {
  [[ $(git status -s 2> /dev/null) ]] && echo -e "\e[33m" || echo -e "\e[32m"
}

if [ "$color_prompt" = yes ]; then
  # Combine PS1 prompt with user-provided information
  PS1="\n${FG_BLUE}╭─" # Begin arrow to prompt

  # Add username, hostname, and OS icon container
  PS1+="${FG_MAGENTA}" # Begin USERNAME container
  PS1+="${BG_MAGENTA}${FG_CYAN}${FMT_BOLD} " # OS icon (or any other symbol)
  PS1+="${FG_WHITE}\u@\h" # Add username and hostname
  PS1+="${FMT_UNBOLD} ${FG_MAGENTA}${BG_BLUE} " # End USERNAME container / Begin DIRECTORY container

  # Add directory container and print directory
  PS1+="${FG_GREY}\w " # Print current directory
  PS1+="${FG_BLUE}${BG_CYAN} " # End DIRECTORY container / Begin FILES container

  # Add files, folders, and symlinks count
  # PS1+="${FG_BLACK}"
  # PS1+="Dir \$(find . -mindepth 1 -maxdepth 1 -type d | wc -l) " # Folder count
  # PS1+="File \$(find . -mindepth 1 -maxdepth 1 -type f | wc -l) " # File count
  # PS1+="Sl \$(find . -mindepth 1 -maxdepth 1 -type l | wc -l) " # Symlink count

  # Reset format and colors before git info
  PS1+="${FMT_RESET}${FG_CYAN}"

  # Check if git branch exists, add git branch container
  PS1+="\$(git branch 2> /dev/null | grep '^*' | colrm 1 2 | xargs -I BRANCH echo -n \""
  PS1+="\$(parse_git_bg) " # End FILES container / Begin BRANCH container
  PS1+="${FG_WHITE}(BRANCH)" # Print current git branch
  PS1+="${FMT_RESET}\$(parse_git_fg)\")\n" # End last container

  # Final arrow and prompt symbol
  PS1+="${FG_BLUE}╰─ " # End arrow to prompt
  PS1+="${FG_CYAN}\\$ " # Print prompt symbol ($ or # for root)
  PS1+="${FMT_RESET}" # Reset formatting and colors

  # Export the prompt
  export PS1
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

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

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# pdcopy
alias pdcopy='xsel --clipboard --input'

# battery
#alias battery='upower -i /org/freedesktop/UPower/devices/battery_BAT1'
battery() {
  if [ "$1" == "-p" ]; then
    command="upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep percentage"
  else
    command="upower -i /org/freedesktop/UPower/devices/battery_BAT1"
  fi
  eval "$command"
}

# change audio
alias audio='sh -c '\''amixer sset Master ${1}'\'' - '

# tmux
alias t='tmux'
alias tl='tmux ls'
alias tk='tmux kill-session'
alias tks='tmux kill-server'
alias ta='tmux attach'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# CapsLock -> Zenkaku/Hankaku
# xmodmap | grep "Caps_Lock" | grep "mod1" > /dev/null 2>&1

# if [ $? == 0 ]; then

# xmodmap ~/.Xmodmap

# fi

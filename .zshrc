# 色の変更をできるようにcolorsコマンドをロードする
autoload -Uz colors && colors
# 新しくインストールしたコマンドをすぐに補完できるようにする
zstyle ":completion:*:commands" rehash 1

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  autoload -Uz compinit && compinit
  source $(brew --prefix)/opt/zsh-git-prompt/zshrc.sh
fi

#git_prompt() {
#  if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = true ]; then
#    PROMPT='%F{033}%n%f :%F{063}%~%f $(git_super_status)'
#    PROMPT+=""$'\n'"> "
#  else
#    PROMPT="%F{033}%n%f :%F{063}%~%f "$'\n'"> "
#  fi
#}

set_prompt() {
  if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = true ]; then
    if [ -n "$VIRTUAL_ENV" ]; then
      PYTHON_VIRTUAL_ENV="`basename \"$VIRTUAL_ENV\"`"

      PROMPT='%F{033}%n%f :%F{063}%~%f py:%F{032}$PYTHON_VIRTUAL_ENV%f git:$(git_super_status)'
      PROMPT+=""$'\n'"> "

    else
      PROMPT='%F{033}%n%f :%F{063}%~%f git:$(git_super_status)'
      PROMPT+=""$'\n'"> "
    fi
  else
    if [ -n "$VIRTUAL_ENV" ]; then
      PYTHON_VIRTUAL_ENV="`basename \"$VIRTUAL_ENV\"`"

      PROMPT='%F{033}%n%f :%F{063}%~%f py:%F{032}$PYTHON_VIRTUAL_ENV%f'
      PROMPT+=""$'\n'"> "
    else
      PROMPT="%F{033}%n%f :%F{063}%~%f "$'\n'"> "
    fi
  fi
}

add_newline() {
  if [[ -z $PS1_NEWLINE_LOGIN ]]; then
    PS1_NEWLINE_LOGIN=true
  else
    printf '\n'
  fi
}

precmd() {
  set_prompt
  add_newline
}

tgz() {
  env COPYFILE_DISABLE=1 tar zcvf $1 --exclude=".DS_Store" ${@:2}
}

# -F でファイル種別の表示
# -G で色を付ける (GNU/Linux での "--color=auto" と等価)
alias ls="ls -FG"

alias la="ls -a"
alias ll="ls -la"
alias lla="ls -la"

alias ..="cd .."
alias ...="cd ../.."

alias ip="ipconfig getifaddr en0"

alias global-ip="curl inet-ip.info"

alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"

alias t="tmux"
alias ta="tmux a"
alias tl="tmux ls"
alias tk="tmux kill-session"
alias tks="tmux kill-server"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/shuhei/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/shuhei/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/shuhei/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/shuhei/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH=~/anaconda3/bin:$PATH
export PATH="/opt/homebrew/bin:$PATH"

#単語の入力途中でもTab補完を有効化
setopt complete_in_word
# 補完候補をハイライト
zstyle ':completion:*:default' menu select=1
# キャッシュの利用による補完の高速化
zstyle ':completion::complete:*' use-cache true
#大文字、小文字を区別せず補完する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

export PATH="/opt/homebrew/opt/php@8.0/bin:$PATH"

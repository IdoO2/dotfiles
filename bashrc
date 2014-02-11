#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

source ~/Library/git-prompt.sh

#PS1='[\u@\h \W]\$ '
PS1=' \W $(__git_ps1 "<%s> ") '

# Aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# If not inside a tmux session, and if no session is started,
# start a new session ; affects all bash terms
# if which tmux 2>&1 >/dev/null; then
#  test -z "$TMUX" && (tmux attach || tmux new-session)
# fi

## New
# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth:erasedups

# For virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

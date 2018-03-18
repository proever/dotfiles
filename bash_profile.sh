export PS1="\[\e[33m\]\t\[\e[m\] : \[\e[34m\]\h\[\e[m\] > \[\e[34m\]\u\[\e[m\] > \[\e[34m\]\W\[\e[m\] \\$ "

# Setting PATH for Python 5.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

export EDITOR='nvim'

export FPP_EDITOR='nvim'

export FZF_COMPLETION_TRIGGER='ff'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

eval "$(thefuck --alias)"

alias r="source ~/.bash_profile"
alias ls="exa"
alias exa="exa -1"
alias mkdir="mkdir -pv"
alias fp="ls | fpp"
alias fpf="fc -s | tail -n +2 | fpp"

# alias df="df -Tha --total"
# alias du="du -ach | sort -h"
# alias free="free -mt"
# alias ps="ps auxf"
# alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi


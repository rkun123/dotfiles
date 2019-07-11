LANG=C
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
#
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.bin:/usr/local/bin:$PATH

alias vim="nvim"
alias v="nvim"
alias :e="nvim"

alias c="cd"
alias l="ls"
alias sl="ls"
alias lsal="ls -al"
alias yrmr="yes | rm -r"
alias rmr="rm -r"
alias cpr="cp -r"

alias gst="git status"
alias ga="git add"
alias gc="git commit"
alias gps="git push"
alias gpsh="git push origin HEAD"
alias gss="git stash"
alias gbl="git blame"

export KYUTECHID=182C1114
export PATH=/home/caseinna/.kyutools/bin:$PATH

# for mariadb
ln -s /run/mysqld/mysqld.sock  /tmp/mysql.sock &> /dev/null
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# zplug
source $HOME/.zplug/init.zsh
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

zplug load

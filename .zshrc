# LANG=en_US.UTF-8
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
#
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:/usr/local/bin:$PATH
export PATH=$HOME/.bin:/usr/local/bin:$PATH

alias vim="nvim"
alias vi="nvim"
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
alias gd="git diff"

alias java12="/usr/lib/jvm/java-12-openjdk/bin/java"
alias java12c="/usr/lib/jvm/java-12-openjdk/bin/javac"

export KYUTECHID=182C1114
export PATH=/home/caseinna/.kyutools/bin:$PATH

# for mariadb
ln -s /run/mysqld/mysqld.sock  /tmp/mysql.sock &> /dev/null
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# zplug
source $HOME/.zplug/init.zsh
# zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
zplug "sindresorhus/pure"

zplug load

export GOPATH=$HOME/go

export PATH=$GOPATH/bin:$PATH
export GO111MODULE=on


export EDITOR=vim
alias vim='/usr/local/Cellar/vim/7.4.712_1/bin/vim'
alias st='git status'
alias g='git'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

alias codigos="cd $HOME/Documents/codigos/"

alias el="elasticsearch --config=/usr/local/opt/elasticsearch/config/elasticsearch.yml"
alias up="python -m SimpleHTTPServer"
alias mutt="torify mutt 2>/dev/null"



export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

function co {
  git checkout $1
}


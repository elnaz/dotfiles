export PATH=$PATH:$HOME/.rvm/bin:/usr/local/bin:/usr/local/Library/Formula/nvm.rb

export EDITOR="vim"

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git osx rails node)
source $ZSH/oh-my-zsh.sh

for file in ~/.{functions,aliases}; do
  [ -r "$file" ] && source "$file"
done
unset file

# disable marking untracked files under VCS as dirty DISABLE_UNTRACKED_FILES_DIRTY="true"

source $HOME/.nvm/nvm.sh
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

# grep
GREP_OPTIONS=""
GREP_OPTIONS+=" --color=auto"
GREP_OPTIONS+=" --exclude=./*.log"
GREP_OPTIONS+=" --exclude-dir=.git"
GREP_OPTIONS+=" --exclude-dir=node_modules"
GREP_OPTIONS+=" --exclude-dir=coverage"
export GREP_OPTIONS

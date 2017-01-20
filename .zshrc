#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

export WORKON_HOME=/Users/greg/.venvs
source /usr/local/bin/virtualenvwrapper.sh
alias mkvirtualenv='mkvirtualenv --no-site-packages --distribute'

if [ -f $(brew --prefix)/etc/zsh_completion ]; then
  . $(brew --prefix)/etc/zsh_completion
fi

export VISUAL=/usr/bin/vim

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"

# rbenv stuff
#export RBENV_ROOT=/usr/local/var/rbenv
#if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
#eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Zsh custom
bindkey "^R" history-incremental-search-backward

# rbenv
export PATH=~/miniconda3/bin:"$PATH"

alias e='emacsclient --no-wait'

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

############################
# Platform-specific settings
############################

export PATH=/usr/local/bin:/usr/local/sbin:${PATH}
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="/Users/greg/.composer/vendor/bin:$PATH"

if [ "$(uname)" = "Darwin" ]; then
    # MAC
    #####

    if [ -f $(brew --prefix)/etc/zsh_completion ]; then
        . $(brew --prefix)/etc/zsh_completion
    fi

    ### Added by the Heroku Toolbelt
    export PATH=/usr/local/heroku/bin:${PATH}
    export PATH=/Applications/Postgres.app/Contents/Versions/9.3/bin:${PATH}
elif [[ $(uname -s) = Linux* ]]; then
    # Linux
    #######
fi

# Zsh custom
bindkey "^R" history-incremental-search-backward

# rbenv
export PATH=~/miniconda3/bin:"$PATH"
# AWS CLI
export PATH=~/bin:$PATH

alias e='emacsclient --no-wait'

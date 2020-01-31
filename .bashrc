PATH="/usr/local/bin:$PATH"
PATH="/usr/local/sbin:$PATH"
# add doom binary to the path
PATH="/Users/greg/.emacs.d/bin:$PATH"
# Add pipx's binaries
PATH="/Users/greg/.local/bin:$PATH"
# add `envsubst` from `gettext` package
PATH="/usr/local/opt/gettext/bin:$PATH"
export PATH

CDPATH=".:$CDPATH"
CDPATH="/Users/greg/Documents/2-Areas:$CDPATH"
CDPATH="/Users/greg/Dropbox:$CDPATH"
export CDPATH

### Bash customisation
export PS1="[\w] > \[$(tput sgr0)\]"
alias ls='ls -lG'
export force_color_prompt=yes

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash

# Load pyenv automatically by appending
# the following to your profile:

# Activate pyenv in the shell
eval "$(pyenv init -)"
# Activate/deactivate virtualenvs on entering/leaving directories which contain a .python-version

if [ -n "$(which pyenv)" ]; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
  export PYENV_VIRTUALENV_DISABLE_PROMPT=1
fi

# - direnv: https://direnv.net/
if [ -n "$(which direnv)" ]; then
  eval "$(direnv hook $(basename $SHELL))"
  # export DIRENV_WARN_TIMEOUT=100s
fi

# Fancy REPL, from https://asciinema.org/a/296507
function clj() {
    if [[ -z $@ ]]
    then
        command clojure -A:repl
    else
        command clj $@
    fi
}

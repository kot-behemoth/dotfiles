PATH="/usr/local/bin:$PATH"
PATH="/usr/local/sbin:$PATH"
# add doom binary to the path
PATH="/Users/greg/.emacs.d/bin:$PATH"
# Add pipx's binaries
PATH="/Users/greg/.local/bin:$PATH"
# add `envsubst` from `gettext` package
PATH="/usr/local/opt/gettext/bin:$PATH"
PATH="/usr/local/opt/postgresql@11/bin:$PATH"
export PATH

export LDFLAGS="-L/usr/local/opt/postgresql@11/lib"
export CPPFLAGS="-I/usr/local/opt/postgresql@11/include"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"

export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"

CDPATH=".:$CDPATH"
CDPATH="/Users/greg/Documents/2-Areas:$CDPATH"
CDPATH="/Users/greg/Dropbox:$CDPATH"
export CDPATH

eval "$(ssh-agent -s)" > /dev/null

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

# Fancy REPL, from https://asciinema.org/a/296507
function clj() {
    if [[ -z $@ ]]
    then
        command clojure -A:repl
    else
        command clj $@
    fi
}

# Disable conda for now, as we're using virtualenv
# . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
# export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
# conda activate base

# pyenv
if which pyenv-init > /dev/null; then eval "$(pyenv init -)"; fi

# liquidprompt prompt customisation
# if [ -f /usr/local/share/liquidprompt ]; then
#   . /usr/local/share/liquidprompt
# fi

# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
#         . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
#     else
#         export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<


# - direnv: https://direnv.net/
# NOTE: must come at the bottom
if [ -n "$(which direnv)" ]; then
  eval "$(direnv hook $(basename $SHELL))"
  # export DIRENV_WARN_TIMEOUT=100s
fi

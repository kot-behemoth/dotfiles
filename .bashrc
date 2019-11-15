export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
# use Homebrew's Python 3 as base python
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
# add doom binary to the path
export PATH="/Users/greg/.emacs.d/bin:$PATH"
source "/usr/local/miniconda3/etc/profile.d/conda.sh"

# set -o vi
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="/Users/greg/.composer/vendor/bin:$PATH"

# add `envsubst` from `gettext` package
export PATH="/usr/local/opt/gettext/bin:$PATH"

### Bash customisation
force_color_prompt=yes
alias ls='ls -lG'
export PS1="[\w] > \[$(tput sgr0)\]"

# Enable direnv
# eval "$(direnv hook bash)"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash

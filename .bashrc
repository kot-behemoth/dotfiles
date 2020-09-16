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

eval "$(ssh-agent -s)" > /dev/null

### Bash customisation
if [ -z "$INSIDE_EMACS" ]
then
      : # noop, outside of emacs
else
      # outside of emacs
      PS1="[\w] > \[$(tput sgr0)\]"
      export PS1
fi

alias ls='ls -lG'
export force_color_prompt=yes

alias python=/usr/local/opt/python/libexec/bin/python

## Bash completions
##
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc"

# Fancy REPL, from https://asciinema.org/a/296507
function clj() {
    if [[ -z $@ ]]
    then
        command clojure -A:repl
    else
        command clj $@
    fi
}

# pyenv
if which pyenv-init > /dev/null; then eval "$(pyenv init -)"; fi

# Only load in interactive shells
# [[ $- = *i* ]] && source ~/liquidprompt/liquidprompt
# liquidprompt prompt customisation
if [ -f /usr/local/share/liquidprompt ]; then
  . /usr/local/share/liquidprompt
fi

# - direnv: https://direnv.net/
# NOTE: must come at the bottom
if [ -n "$(which direnv)" ]; then
  eval "$(direnv hook $(basename $SHELL))"
  # export DIRENV_WARN_TIMEOUT=100s
fi

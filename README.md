# Installation

## Linking up the files

```bash
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.doom.d ~/.doom.d
ln -s ~/dotfiles/.direnvrc ~/.direnvrc

# legacy
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.zpreztorc ~/.zpreztorc
ln -s ~/dotfiles/.vimrc ~/.vimrc
```

# Legacy

## Input font

Download from <http://input.fontbureau.com/preview/?size=14&language=python&theme=monokai&family=InputSans&width=100&weight=100&line-height=1.2&a=0&g=0&i=serif&l=serif&zero=0&asterisk=height&braces=0&preset=pragmata&customize=please>

If on linux, will require `font-viewer`, via `sudo apt-get install gnome-font-viewer`.

## Installing Spacemacs

Need to link `.spacemacs.d` to `~/.spacemacs.d`

```bash
ln -s dotfiles/.spacemacs.d .spacemacs.d
```

## Installing zsh prezto

```shell
brew install zsh
zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Create a Zsh configuration by copying the configuration files provided by the repo.
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# Lastly, set Zsh as your default shell.
chsh -s /bin/zsh
```

## Terminal themes

https://github.com/lysyi3m/osx-terminal-themes

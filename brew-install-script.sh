#!/bin/sh

# Homebrew Script for OSX
# To execute: save and `chmod +x ./brew-install-script.sh` then `./brew-install-script.sh`

if ! command -v brew &> /dev/null
then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi


echo "Installing brew cask..."
brew tap Homebrew/cask

# brew install google-chrome
# brew install fzf
# /opt/fzf/install
brew install ctags
brew install zsh-syntax-highlighting
brew install tmux
brew install ripgrep
brew install reattach-to-user-namespace
brew install neovim

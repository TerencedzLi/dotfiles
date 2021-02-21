#!/bin/sh

if test ! $(which brew); then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [ ! -d ~/zsh-syntax-highlighting ]; then
  mkdir ~/zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/zsh-syntax-highlighting 
fi

if [ ! -f ~/.zshrc ]; then
  ln -s ~/Workspace/dotfiles/.zshrc ~/.zshrc
  source ~/.zshrc
fi

if [ ! -d ~/.config ] && [ ! -d ~/.config/nvim ]; then
  mkdir -p ~/.config/nvim
  mkdir -p ~/.config/nvim/config

  ln -s ~/Workspace/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
  ln -s ~/Workspace/dotfiles/nvim/config/test.vim ~/.config/nvim/config/test.vim
  ln -s ~/Workspace/dotfiles/nvim/config/fzf.vim ~/.config/nvim/config/fzf.vim
fi


if [ ! -f ~/.tmux.conf ]; then
  ln -s ~/Workspace/dotfiles/.tmux.conf ~/.tmux.conf
fi



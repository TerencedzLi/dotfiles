#!/bin/sh

if [ ! -d "~/zsh-syntax-highlighting" ];
then
  mkdir ~/zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/zsh-syntax-highlighting 
fi

ln -s ~/Workspace/dotfiles/.zshrc .zshrc

if [ ! -d "~/.config" ] && [ ! -d "~/.config/nvim" ];
then
  mkdir -p ~/.config/nvim
  mkdir -p ~/.config/nvim/config
fi


ln -s ~/Workspace/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/Workspace/dotfiles/nvim/config/test.vim ~/.config/nvim/config/test.vim
ln -s ~/Workspace/dotfiles/nvim/config/fzf.vim ~/.config/nvim/config/fzf.vim

source .zshrc

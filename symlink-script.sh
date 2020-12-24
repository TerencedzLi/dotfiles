#!/bin/sh

cd ~

ln -s ./dotfiles/.zshrc .zshrc

source .zshrc

mkdir -p ./.config/nvim/config

ln -s ./dotfiles/nvim/init.nvim ./.config/nvim/init.nvim
ln -s ./dotfiles/nvim/config/test.nvim ./.config/nvim/test.nvim
ln -s ./dotfiles/nvim/config/fzf.nvim ./.config/nvim/fzf.nvim

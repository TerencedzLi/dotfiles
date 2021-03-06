#!/bin/sh

if [ $SPIN ];
then
  if ! command -v fzf &> /dev/null; then
    sudo apt-get install -y fzf
  fi

  if ! command -v rg &> /dev/null; then
    sudo apt-get install -y ripgrep
  fi

  if ! command -v nvim &> /dev/null; then
    sudo apt install neovim
  fi

  if ! command -v ctags &> /dev/null; then
    sudo apt install exuberant-ctags
  fi
else
  if ! command -v brew &> /dev/null; then
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    brew bundle
  fi
fi

if [ ! -d ~/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ ! -d ~/zsh-syntax-highlighting ]; then
  mkdir ~/zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/zsh-syntax-highlighting 
fi

if [ ! -f ~/.zshrc ]; then
  ln -sf ~/Workspace/dotfiles/.zshrc ~/.zshrc
  source ~/.zshrc
fi

if [ ! -d ~/.config ] && [ ! -d ~/.config/nvim ]; then
  mkdir -p ~/.config/nvim
  mkdir -p ~/.config/nvim/config

  ln -sf ~/Workspace/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
  ln -sf ~/Workspace/dotfiles/nvim/config/test.vim ~/.config/nvim/config/test.vim
  ln -sf ~/Workspace/dotfiles/nvim/config/fzf.vim ~/.config/nvim/config/fzf.vim
fi


if [ ! -f ~/.tmux.conf ]; then
  ln -sf ~/Workspace/dotfiles/.tmux.conf ~/.tmux.conf
fi



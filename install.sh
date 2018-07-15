#!/usr/bin/env bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install emacs fd fzf neovim nvm pyenv pyenv-virtualenv rbenv the_silver_searcher thefuck tmux tree zsh zsh-completions
/usr/local/opt/fzf/install

mkdir -p ~/.config/nvim
mkdir ~/.emacs.d

brew cask install emacs iterm2 slack spectacle sublime-text
ln -s ~/Developer/dotfiles/zshenv.sh ~/.zshenv
ln -s ~/Developer/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/Developer/dotfiles/spacemacs.el ~/.spacemacs
ln -s ~/Developer/dotfiles/profile.sh ~/.profile
ln -s ~/Developer/dotfiles/pythonrc.py ~/.pythonrc
ln -s ~/Developer/dotfiles/init.el ~/.emacs.d/init.el
ln -s ~/Developer/dotfiles/init.vim ~/.config/nvim/init.vim

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

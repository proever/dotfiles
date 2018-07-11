#!/usr/bin/env bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install emacs fd fzf neovim nvm pyenv pyenv-virtualenv rbenv the_silver_searcher thefuck tmux tree zsh zsh-completions
/usr/local/opt/fzf/install
compaudit | xargs chmod g-w
sudo cat "/usr/local/bin/zsh" /etc/shells
chsh -s $(which zsh)
brew cask install emacs iterm2 slack spectacle sublime-text xquartz
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
mkdir Developer
git clone https://github.com/proever/dotfiles.git Developer
ln -s ~/Developer/dotfiles/zshrc.sh ~/.zshrc
ln -s ~/Developer/dotfiles/zshenv.sh ~/.zshenv

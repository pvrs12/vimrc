#!/bin/bash
mkdir -p ~/.config
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim
ln -s ~/.vimrcfunc ~/.config/nvim/.vimrcfunc

#alias vim to nvim so we get it right!
alias vim=nvim
string=$(cat ~/.bashrc)
if [[ $string == "*alias vim=nvim*" ]]
then
	echo "alias vim=nvim">>~/.bashrc
fi

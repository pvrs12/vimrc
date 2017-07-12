#!/bin/bash
mkdir -p ~/.config
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim
ln -s ~/.vimrcfunc ~/.config/nvim/.vimrcfunc

#alias vim to nvim so we get it right!
alias vim=nvim
string=$(cat ~/.bashrc)
if [[ $(echo $string | grep 'alias vim') == '' ]]
then
	echo "alias nvim='TERM=screen-256color && nvim'" >>~/.bashrc
	echo "alias vim=nvim">>~/.bashrc
	echo "run \`source ~/.bashrc\` to complete the changes"
fi

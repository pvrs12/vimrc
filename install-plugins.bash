#!/bin/bash
cp .vimrc ~/.vimrc

mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/bundle
cp pathogen.vim ~/.vim/autoload/pathogen.vim
cd ~/.vim/bundle
git clone https://github.com/davidhalter/jedi-vim --recursive --depth=1
git clone https://github.com/vim-airline/vim-airline --recursive --depth=1
git clone https://github.com/vim-airline/vim-airline-themes --recursive --depth=1
git clone https://github.com/tpope/vim-fugitive --recursive --depth=1
git clone https://github.com/airblade/vim-gitgutter --recursive --depth=1
git clone https://github.com/scrooloose/nerdcommenter --recursive --depth=1

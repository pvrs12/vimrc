#!/bin/bash
cp .vimrc ~/.vimrc

mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/bundle
cp pathogen.vim ~/.vim/autoload/pathogen.vim
cd ~/.vim/bundle
#python code completion
git clone https://github.com/davidhalter/jedi-vim --recursive --depth=1
#airline & themes
git clone https://github.com/vim-airline/vim-airline --recursive --depth=1
git clone https://github.com/vim-airline/vim-airline-themes --recursive --depth=1
#git commands from vim + details in airline
git clone https://github.com/tpope/vim-fugitive --recursive --depth=1
#git diff in the left gutter
git clone https://github.com/airblade/vim-gitgutter --recursive --depth=1
#commenting pluggin that allows for easily commenting/uncommenting code
git clone https://github.com/scrooloose/nerdcommenter --recursive --depth=1
#c++ autocomplete
git clone https://github.com/Rip-Rip/clang_complete --recursive --depth=1

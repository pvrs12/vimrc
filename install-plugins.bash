#/bin/bash
cp .vimrc ~/.vimrc
cp .vimrcfunc ~/.vimrcfunc

mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/bundle
cp pathogen.vim ~/.vim/autoload/pathogen.vim
cd ~/.vim/bundle
#python code completion
git clone https://github.com/davidhalter/jedi-vim --recursive --depth=1
cd jedi-vim && git pull
#airline & themes
git clone https://github.com/vim-airline/vim-airline --recursive --depth=1
cd vim-airline && git pull
git clone https://github.com/vim-airline/vim-airline-themes --recursive --depth=1
cd vim-airline-themes && git pull
#git commands from vim + details in airline
git clone https://github.com/tpope/vim-fugitive --recursive --depth=1
cd vim-fugitive && git pull
#git diff in the left gutter
git clone https://github.com/airblade/vim-gitgutter --recursive --depth=1
cd vim-gitgutter && git pull
#commenting pluggin that allows for easily commenting/uncommenting code
git clone https://github.com/scrooloose/nerdcommenter --recursive --depth=1
cd nerdcommenter && git pull
#c++ autocomplete
git clone https://github.com/Rip-Rip/clang_complete --recursive --depth=1
cd clang_complete && git pull
#java autocomplete
git clone https://github.com/artur-shaik/vim-javacomplete2 --depth=1
cd vim-javacomplete2 && git pull

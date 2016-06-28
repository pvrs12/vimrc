#/bin/bash
VIM_DIR=~/.vim
VIM_PATHOGEN_DIR=$VIM_DIR/autoload
VIM_PLUGIN_DIR=$VIM_DIR/bundle

cp .vimrc ~/.vimrc
cp .vimrcfunc ~/.vimrcfunc

function get_plugin {
	cd $VIM_PLUGIN_DIR
	git clone $1 --recursive --depth=1
	cd $(basename $1) && git pull
}

mkdir -p $VIM_PATHOGEN_DIR
mkdir -p $VIM_PLUGIN_DIR
cp pathogen.vim $VIM_PATHOGEN_DIR/pathogen.vim

for l in $(cat pluginlist); do
	l=${l##*( )}
	if [[ $l == \#* ]]; then
		continue
	fi
	get_plugin $l
done

#python code completion
#get_plugin https://github.com/davidhalter/jedi-vim
##airline & themes
#get_pluign https://github.com/vim-airline/vim-airline
#get_plugin https://github.com/vim-airline/vim-airline-themes
##git commands from vim + details in airline
#get_plugin https://github.com/tpope/vim-fugitive
##git diff in the left gutter
#get_plugin https://github.com/airblade/vim-gitgutter
##commenting pluggin that allows for easily commenting/uncommenting code
#get_plugin https://github.com/scrooloose/nerdcommenter 
##c++ autocomplete
#get_plugin https://github.com/Rip-Rip/clang_complete 
##java autocomplete
#get_plugin https://github.com/artur-shaik/vim-javacomplete2
##vim-table-mode
#get_plugin https://github.com/dhruvasagar/vim-table-mode

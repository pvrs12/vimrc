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

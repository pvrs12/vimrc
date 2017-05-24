#/bin/bash
VIM_DIR=~/.vim
VIM_PATHOGEN_DIR=$VIM_DIR/autoload
VIM_PLUGIN_DIR=$VIM_DIR/bundle

BASE_DIR=$(pwd)

PLUGIN_DIR=pluginlist.d

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

for f in $PLUGIN_DIR/*; do
	f=$BASE_DIR/$f
	echo ""
	echo "Installing plugins from '$f'..."

	while read l; do
		l=${l##*( )}
		if [[ $l == \#* ]]; then
			continue
		fi
		if [[ $l == '' ]]; then
			continue
		fi
		get_plugin $l
	done < $f
done

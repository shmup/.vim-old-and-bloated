#!/bin/sh
if [ "$PWD" != "$HOME/.vim" ]; then cd $HOME/.vim; fi

if [ -f "$HOME/.vimrc" ]; then
    echo "found an renaming the existing .vimrc"
    mv $HOME/.vimrc $HOME/.vimrc.old
fi

ln -s "$PWD/vimrc" "$HOME/.vimrc"
mkdir -p $HOME/.vim/{autoload,undo,backup,swap,sessions,autoload}
curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim

echo "installing vim plugins"
echo "ignore that it yells at you about missing colorscheme."
vim +PlugInstall

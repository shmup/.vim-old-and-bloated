#!/bin/sh

if [ "$PWD" != "$HOME/.vim" ]; then
    echo "we aren't in $HOME/.vim"
elif [ -f "$HOME/.vimrc" ]; then
    echo "$HOME/.vimrc found"
else
    echo "linking $PWD/vimrc to $HOME/.vimrc"
    ln -s "$PWD/vimrc" "$HOME/.vimrc"
fi

mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/undo
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/swap
mkdir -p ~/.vim/sessions
curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim

echo "installing vim plugins"
vim +PlugInstall

if [ -d "$HOME/.vim/bundle/YouCompleteMe" ]; then
    echo "compiling YouCompleteMe with C language support"
    cd $HOME/.vim/bundle/YouCompleteMe && ./install.sh --clang-completer
fi

ln -s $HOME/.vim/vimrc $HOME/.vimrc

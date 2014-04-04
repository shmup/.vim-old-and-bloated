#!/bin/sh

if [ "$PWD" != "$HOME/.vim" ]; then
    echo "we aren't in $HOME/.vim"
elif [ -f "$HOME/.vimrc" ]; then
    echo "$HOME/.vimrc found"
else
    echo "linking $PWD/vimrc to $HOME/.vimrc"
    ln -s "$PWD/vimrc" "$HOME/.vimrc"
fi

mkdir -p ~/.vim/undo

if [ ! -d "$HOME/.vim/bundle/vundle" ]; then
    echo "cloning vundle"
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

echo "installing vim plugins"
vim +PluginInstall +qall

if [ -d "$HOME/.vim/bundle/YouCompleteMe" ]; then
    echo "compiling YouCompleteMe with C language support"
    ./$HOME/.vim/bundle/YouCompleteMe/install.sh --clang-completer
fi


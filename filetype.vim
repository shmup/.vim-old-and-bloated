augroup filetypedetect
    au BufNewFile,BufRead .htaccess,*.conf setf apache
    au BufNewFile,BufRead *.coffee set ts=2 | set sw=2 | set sts=2 | setf coffee
    au BufNewFile,BufRead *vimrc set ts=2 | set sw=2 | set sts=2 | setf vim
    au BufNewFile,BufRead *.php set autoindent
    au BufNewFile,BufRead *.wiki set wrap
augroup END

augroup filetypedetect
    au BufNewFile,BufRead .htaccess,*.conf setf apache
    au BufNewFile,BufRead *.coffee set ts=2 | set sw=2 | set sts=2 | setf coffee
    au BufNewFile,BufRead *vimrc set ts=2   | set sw=2 | set sts=2 | setf vim
    au BufNewFile,BufRead *.js set ts=2     | set sw=2 | set sts=2 | setf javascript
    au BufNewFile,BufRead *.py set ts=4     | set sw=4 | set sts=4 | setf python | set autoindent
    au BufNewFile,BufRead *.php set ts=4    | set sw=4 | set sts=4 | setf php | set autoindent
    au BufNewFile,BufRead *.html set ts=2   | set sw=2 | set sts=2 | setf html | set autoindent
    au BufNewFile,BufRead *.spacebars set ts=2   | set sw=2 | set sts=2 | setf html | set autoindent
    au BufNewFile,BufRead *.wiki set wrap
augroup END

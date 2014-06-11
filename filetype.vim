augroup filetypedetect
    au BufNewFile,BufRead .htaccess,*.conf setf apache
    au BufNewFile,BufRead *.coffee set ts=4 | set sw=4 | set sts=4 | setf coffee
augroup END

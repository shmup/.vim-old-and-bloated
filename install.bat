set local
set vimrcpath=%HOMEPATH%\.vim\vimrc
set vimrcpath=%vimrcpath:\=/%
echo source %vimrcpath% > %HOMEPATH%\.vimrc

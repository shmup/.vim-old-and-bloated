syntax on

" vundle
filetype on
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
"Bundle 'jaredly/vim-debug'
Bundle 'airblade/vim-gitgutter'
Bundle 'altercation/vim-colors-solarized'
Bundle 'bling/vim-airline'
Bundle 'chilicuil/conque'
Bundle 'godlygeek/tabular'
Bundle 'jmcantrell/vim-virtualenv'
Bundle 'justinmk/vim-sneak'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
Bundle 'mileszs/ack.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'nvie/vim-flake8'
Bundle 'schickling/vim-bufonly'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'shmup/inkpot'
Bundle 'taglist.vim'
Bundle 'terryma/vim-expand-region'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-obsession'
Bundle 'tpope/vim-sensible'
Bundle 'Valloric/YouCompleteMe'
Bundle 'vim-scripts/django.vim'
Bundle 'vim-scripts/matrix.vim--Yang'

filetype plugin indent on

" code formatting
set autoindent smartindent                      " automatically indent on new lines
set expandtab                                   " expand tabs to spaces
set tabstop=4                                   " actual tab width
set softtabstop=4                               " insert mode tab/backspace width
set shiftwidth=2                                " normal mode (auto)indent width
set backspace=indent,eol,start

" search
set ignorecase                                  " case insensitive search
set smartcase                                   " case-sensitive search if query contains caps
set hlsearch                                    " highlight search results
set incsearch                                   " search as you type

" backup and undo files
set nobackup
set nowritebackup
set noswapfile
set backupdir=$HOME/.vim/backup
set backupcopy=yes
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=~/.vim/swap,~/tmp,.               " keep swp files under ~/.vim/swap
set undofile
set undodir=~/.vim/undo
set undolevels=1000                             " number of undos to keep

" editor setup
set autochdir                                   " auto cd into dir that file is in
set autoread                                    " watch for file changes
set complete=.,w,b,u,U,t,i,d                    " do lots of scanning on tab completion
set clipboard=unnamed                           " use system clipboard for yanking and putting
set cursorline cursorcolumn                     " use cursor lines because theyre awesome
set encoding=utf-8                              " define char set
set diffopt=filler,iwhite                       " ignore all whitespace and sync
set encoding=utf-8
set hidden                                      " automatically hide buffers with unsaved changes
set history=10000
set laststatus=2
set lazyredraw                                  " don't redraw when don't have to
set linebreak
set more                                        " use more prompt
set mouse+=a
set noautowrite                                 " don't automagically write on :next
set nocompatible                                " vim, not vi
set noerrorbells                                " No error bells please
set nowrap                                      " Don't wrap lines by default
set number                                      " line numbers
set ruler                                       " show the line number on the bar
set scrolloff=5                                 " keep at least 5 lines above/below
set shortmess+=I                                " hide intro screen
set showcmd
set showmatch                                   " show matching bracket
set showmode
set sidescrolloff=5                             " keep at least 5 lines left/right
set smarttab                                    " tab and backspace are smart
set ttyfast                                     " we havelet g:ctrlp_by_filename = 1 a fast terminal
set updatecount=100                             " switch every 100 chars
set wildmenu                                    " menu has tab completion
set wildmode=longest:full
set wildignorecase                              " ignore case in tab completion
set wildignore+=Zend,local
set wmh=0                                       " minimum window height

let mapleader = "\<Space>"

" ctrlp
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_working_path_mode = 'rca'

" YouCompleteMe
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<ENTER>']
let g:ycm_key_invoke_completion = '<C-Space>'

" editor styling
set t_Co=256
colorscheme solarized

" mapping for devices without easy <ESC>
inoremap jj <ESC>

" make Y like C/D
nnoremap Y y$

" more intuitive j/k
nnoremap j gj
nnoremap k gk

" quick tab changing
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt

" better window changing
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" clipboard things
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" return and backspace hacks
nnoremap <CR> G
nnoremap <BS> gg

" sudo write
cmap w!! w !sudo tee > /dev/null %

" sneak stuff
nmap <leader>s <Plug>Sneak_s
nmap <leader>S <Plug>Sneak_S
xmap <leader>s <Plug>Sneak_s
xmap <leader>S <Plug>Sneak_S
omap <leader>s <Plug>Sneak_s
omap <leader>S <Plug>Sneak_S

if has("autocmd")
  " git gutter color fix
  au ColorScheme * highlight clear SignColumn
  " remove/add cursorline colors
  au WinLeave * set nocursorline nocursorcolumn
  au WinEnter * set cursorline cursorcolumn
  " markdown gets wrapped
  au BufNewFile,BufRead *.md,*.markdown set wrap
endif

let g:CommandTCancelMap=['<ESC>','<C-c>']
let g:CommandTMaxHeight = 30
let g:CommandTInputDebounce = 200
let g:sneak#streak = 1
let NERDTreeIgnore = ['\.pyc$']
nnoremap <leader>. :CtrlPTag<cr>
map <leader>n :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
noremap <leader>0 :tablast<cr>
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>
nmap <leader>a :Ack!<space>
nmap <leader>g :GitGutterToggle<CR>
nmap <Leader><Leader> V
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
map <leader>ra :!sudo service apache2 restart<cr>
map <leader>eh :e ~/Work/hosts<cr>
map <leader>ev :e ~/.vim/vimrc<cr>
map <leader>et :e ~/.tmux.conf<cr>
map <leader>ec :e ~/Work/confs/
map <F3> :mksession! ~/.vim/sessions/
map <F4> :source ~/.vim/sessions/

" GUI only things
if has('gui_running')
  set background=light
  set lines=50
  set columns=120
  set guioptions-=T         " removes main toolbar
  set guioptions-=rRL       " removes vertical scrollbars
  set guioptions=aegimt
  "set guioptions+=rRL      " split vertical scrollbar
  "set guioptions+=bh       " adds horizontal scrollbar
  if has("gui_macvim")
    set guifont=Monaco:h13
  else
    set guifont=Inconsolata\ 10
  endif
else
  set background=dark
endif

" search. cs to replace. esc. n.n.n.n.
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

" automatically clean whitespace
map <leader>W  :%s/\s\+$//<cr>:let @/=''<CR>

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <leader>l :nohl<CR><C-l>

" <f9> will list the open buffers, and wait for you to choose a #
nnoremap <f9> :buffers<CR>:buffer<Space>

" <f5> autocommand for running files
autocmd FileType python nnoremap <buffer> <f5> :exec '!python' shellescape(@%, 1)<cr>
autocmd FileType sh nnoremap <buffer> <f5> :exec '!' shellescape(@%, 1)<cr>

" <f1> same as CTRL-^
nnoremap <f1> <C-^>

" When editing a file, always jump to the last cursor position
 autocmd BufReadPost *
 \ if line("'\"") > 0 && line ("'\"") <= line("$") |
 \   exe "normal g'\"" |
 \ endif

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  let g:ackprg = 'ag --nogroup --column'

  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Gist settings
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1

if has("unix")
  let s:uname = system("uname -s")
  if s:uname == "Darwin"
    let g:gist_clip_command = 'pbcopy'
  else
    let g:gist_clip_command = 'xclip -selection clipboard'
  endif
endif

command! PutVimrc call <SID>PutVimrc()
function! <SID>PutVimrc()
  :!cd ~/.vim && git add vimrc && git commit -m 'updated vimrc' && git push
endfunction

command! PullVimrc call <SID>PullVimrc()
if !exists("*<SID>PullVimrc")
  function! <SID>PullVimrc()
    :!cd ~/.vim && git pull
    :so ~/.vim/vimrc
  endfunction
endif

" Uses the Repeat group to highlight the repeated lines
" http://stackoverflow.com/questions/1268032/marking-duplicate-lines/1270689#1270689
command! HighlightRepeats call <SID>HighlightRepeats()
function! <SID>HighlightRepeats()
  :syn clear Repeat | g/^\(.*\)\n\ze\%(.*\n\)*\1$/exe 'syn match Repeat "^' . escape(getline('.'), '".\^$*[]') . '$"' | nohlsearch
endfunction

" Clears lines highlighted in Repeat group
command! ClearHighlightRepeats call <SID>ClearHighlightRepeats()
function! <SID>ClearHighlightRepeats()
  :syn clear Repeat
endfunction

" Toggles the background color, and reloads the colorscheme.
command! ToggleBackground call <SID>ToggleBackground()
function! <SID>ToggleBackground()
    let &background = ( &background == "dark"? "light" : "dark" )
    if exists("g:colors_name")
        exe "colorscheme " . g:colors_name
    endif
endfunction

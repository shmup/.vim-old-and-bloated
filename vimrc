" vim: set foldmethod=marker foldlevel=0:
" ============================================================================
" " .vimrc of Jared Tyler Miller {{{
" ============================================================================

let s:darwin = has('mac')

" }}}
" ============================================================================
" VIM-PLUG BLOCK {{{
" ============================================================================

silent! if plug#begin('~/.vim/plugged')

let g:plug_timeout = 10

""" PLUGINS
Plug 'bling/vim-airline'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/seoul256.vim'
Plug 'justinmk/vim-gtfo'
Plug 'mattn/webapi-vim'
Plug 'schickling/vim-bufonly'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-obsession'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer --omnisharp-completer' }
Plug 'vim-scripts/matrix.vim--Yang'
Plug 'vimwiki/vimwiki'
if s:darwin
  Plug 'junegunn/vim-emoji'
  Plug 'zerowidth/vim-copy-as-rtf'
endif

" Tmux
Plug 'tpope/vim-tbone'

" Lang
Plug 'cespare/vim-toml'
Plug 'fatih/vim-go'
Plug 'LokiChaos/vim-tintin'
Plug 'mattn/emmet-vim'
Plug 'OrangeT/vim-csharp'
Plug 'plasticboy/vim-markdown',  { 'for': 'markdown' }
Plug 'PProvost/vim-ps1'
Plug 'scrooloose/syntastic'
Plug 'shmup/crawl.vim'
Plug 'shmup/vim-sql-syntax'
Plug 'Slava/vim-spacebars'
Plug 'wlue/vim-dm-syntax'

" rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'phildawes/racer', { 'do' : 'cargo build --release', 'for': 'rust' }
" Plug 'timonv/vim-cargo'
Plug '~/code/vim-cargo'

" python
Plug 'jmcantrell/vim-virtualenv'
Plug 'nvie/vim-flake8'

" PHP
Plug 'captbaritone/better-indent-support-for-php-with-html'
Plug 'shawncplus/phpcomplete.vim'
Plug 'StanAngeloff/php.vim'

" JavaScript
Plug 'kchmck/vim-coffee-script'
Plug 'mephux/vim-jsfmt'
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'pangloss/vim-javascript'

" HTML/CSS
Plug 'groenewege/vim-less'
Plug 'ap/vim-css-color'
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/html5.vim'

" Edit
Plug 'AndrewRadev/switch.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-oblique'
" Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-pseudocl'
Plug 'justinmk/vim-sneak'
Plug 'mbbill/undotree'
Plug 'terryma/vim-expand-region'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" Browsing
Plug 'jeetsukumaran/vim-filebeagle'
Plug 'mileszs/ack.vim',     { 'on': 'Ack'            }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'yegappan/mru'
if v:version >= 703
  Plug 'majutsushi/tagbar'
endif

" Git
Plug 'gregsexton/gitv', { 'on': 'Gitv' }
Plug 'mattn/gist-vim'
Plug 'tpope/vim-fugitive'
if v:version >= 703
  Plug 'airblade/vim-gitgutter'
else
  Plug 'mhinz/vim-signify'
endif

call plug#end()
endif

" }}}
" ============================================================================
" BASIC SETTINGS {{{
" ============================================================================

let mapleader = "\<Space>"

" code formatting
set autoindent smartindent                      " automatically indent on new lines
set expandtab                                   " expand tabs to spaces
set tabstop=4                                   " actual tab width
set softtabstop=4                               " insert mode tab/backspace width
set shiftwidth=4                                " normal mode (auto)indent width
set backspace=indent,eol,start
set foldmethod=syntax
set foldlevelstart=1
let javascript_fold=1

" speed up syntax highlighting
syntax on
syntax sync minlines=256
let base16colorspace=256                        " Access colors present in 256 colorspace
set synmaxcol=500
set re=1

" search
set ignorecase                                  " case insensitive search
set smartcase                                   " case-sensitive search if query contains caps
set hlsearch                                    " highlight search results
set incsearch                                   " search as you type

" dictionary
set dictionary+=~/.vim/dict/*

" backup and undo files
set nobackup
set nowritebackup
set noswapfile
set backupdir=$HOME/.vim/backup
set backupcopy=yes
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=~/.vim/swap,~/tmp,.               " keep swp files under ~/.vim/swap
set tags=./tags;/
set undodir=~/.vim/undo
set undofile
set undolevels=1000                             " number of undos to keep

" editor setup
set autochdir                                   " auto cd into dir that file is in
set autoread                                    " watch for file changes
" set complete=.,w,b,u,U,t,i,d                    " do lots of scanning on tab completion
set complete-=i
if $TMUX == ''
    set clipboard+=unnamed
endif
set cursorline cursorcolumn                     " use cursor lines because theyre awesome
set display+=lastline
set diffopt=filler,iwhite                       " ignore all whitespace and sync
set encoding=utf-8
set fileformats=unix,dos,mac                    " Prefer Unix over Windows over OS 9 formats
set hidden                                      " automatically hide buffers with unsaved changes
set history=10000
set laststatus=2
set lazyredraw                                  " don't redraw when don't have to
set linebreak
set more                                        " use more prompt
set mouse+=a
" set noautochdir                                 " https://github.com/airblade/vim-rooter
set noautowrite                                 " don't automagically write on :next
set nocompatible                                " vim, not vi
set noerrorbells                                " No error bells please
set nowrap                                      " Don't wrap lines by default
set nrformats-=octal
set number                                      " line numbers
set ruler                                       " show the line number on the bar
set scrolloff=5                                 " keep at least 5 lines above/below
set shortmess+=I                                " hide intro screen
set showcmd
set showmatch                                   " show matching bracket
set showmode
set sidescrolloff=5                             " keep at least 5 lines left/right
set smarttab                                    " tab and backspace are smart
set ttimeout
set ttimeoutlen=100
set ttyfast                                     " we havelet g:ctrlp_by_filename = 1 a fast terminal
set updatecount=100                             " switch every 100 chars
set wildmenu                                    " menu has tab completion
set wildmode=longest:full
set wildignorecase                              " ignore case in tab completion
set wildignore+=*.pyc
set wmh=0                                       " minimum window height
set pastetoggle=<Ins>

" Shift-tab on GNU screen
" http://superuser.com/questions/195794/gnu-screen-shift-tab-issue
set t_kB=[Z

" editor styling
set t_Co=256
let g:seoul256_background = 234 " dark (239-233), light (256-252)
let g:seoul256_light_background = 256
colorscheme seoul256
set background=dark

if &background == 'light'
  let g:airline_theme='light'
endif


" }}}
" ============================================================================
" MAPPINGS {{{
" ============================================================================

" ----------------------------------------------------------------------------
" Basic mappings
" ----------------------------------------------------------------------------

" ctrlp
nnoremap <leader>v :CtrlPMRUFiles<CR>
nnoremap <leader>b :CtrlPBuffer<CR>

" true maximize
nnoremap <C-w>\ <C-w>\|<C-w>_

" No register delete
nnoremap <leader>dd "_dd

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" copy file name/file path to clipboard
nmap <leader>cs :let @+=expand("%")<CR>
nmap <leader>cl :let @+=expand("%:p:h")<CR>

" select last paste in visual mode
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

nnoremap <leader>z :FZF<CR>

" fu ex mode
nnoremap Q <nop>

" mapping for devices without easy <ESC>
inoremap jj <ESC>

" make Y like C/D
nnoremap Y y$

" more intuitive j/k
noremap j gj
noremap k gk

" fold ideas
noremap za zA
noremap zA za

" toggle boolean and other things
nnoremap <leader>t :Switch<cr>

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
" I commented these out because often I'll miss a command before hitting <return> and so it just
" does a G instead, taking me to the bottom of the window, forcing me to ctrl-o to return :)
" nnoremap <CR> G
" nnoremap <BS> gg

" sudo write
cmap w!! w !sudo tee > /dev/null %

" Better use of arrows
nnoremap <silent> <Right> :bnext<CR>
nnoremap <silent> <Left> :bprev<CR>

" sneak stuff
nmap <leader>s <Plug>Sneak_s
nmap <leader>S <Plug>Sneak_S
xmap <leader>s <Plug>Sneak_s
xmap <leader>S <Plug>Sneak_S
omap <leader>s <Plug>Sneak_s
omap <leader>S <Plug>Sneak_S

" Random bindings
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <leader>m :Matrix<cr>
map <leader>n :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
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
map <silent> <leader>rv :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
map <leader>ra :!sudo service apache2 restart<cr><cr>
map <leader>rn :!sudo service nginx restart<cr>
map <leader>eh :e ~/Work/hosts<cr>
map <leader>ev :e ~/.vim/vimrc<cr>
map <leader>ef :e ~/.vim/filetype.vim<cr>
map <leader>et :e ~/.tmux.conf<cr>
map <leader>ep :e /etc/php5/apache2/php.ini<cr>
map <leader>ec :e ~/Work/confs/
map <F3> :mksession! ~/.vim/sessions/
map <F4> :source ~/.vim/sessions/

" neovim terminal
if has('nvim')
  tnoremap jj <c-\><c-n>
endif

" GUI only things
if has('gui_running')
  set lines=50
  set columns=120
  set guioptions-=T         " removes main toolbar
  set guioptions-=rRL       " removes vertical scrollbars
  set guioptions=aegimt
  if has("gui_macvim")
    set guifont=Monaco:h13
  else
    set guifont=Fira\ Mono\ Medium\ 8
  endif
endif

" search. cw (or cs, c whatever) to replace/fix. esc. n.n.n.n.
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

" automatically clean whitespace
map <leader>W  :%s/\s\+$//<cr>:let @/=''<CR>

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <leader>l :nohl<CR><C-l>

" <f9> will list the open buffers, and wait for you to choose a #
nnoremap <f9> :buffers<CR>:buffer<Space>

" <f1> same as CTRL-g
nnoremap <f1> <C-^>

if s:darwin
    nnoremap <f6> :!osascript -e 'tell application FirefoxDeveloperEdition -e 'reload active tab of window 1' -e 'end tell'<CR><CR>
    let g:gist_clip_command = 'pbcopy'
else
    nnoremap <f6> :!wmctrl -a Firefox && xdotool key F5 && wmctrl -a ":)"<CR><CR>
    let g:gist_clip_command = 'xclip -selection clipboard'
endif

" }}}
" ============================================================================
" FUNCTIONS & COMMANDS {{{
" ============================================================================

" syntastic/flake8
" http://learnvimscriptthehardway.stevelosh.com/chapters/38.html (Toggling)
let g:python_length_is_big = 0
function! <SID>TogglePythonLength()
    if g:python_length_is_big
        let g:python_length_is_big = 0
        let g:syntastic_python_flake8_args = ""
        let g:syntastic_python_flake8_args = ""
        echo "Python max line length: 79"
    else
        let g:syntastic_python_flake8_args = "--ignore=E501"
        let g:syntastic_python_flake8_args = "--max-line-length=200"
        let g:python_length_is_big = 1
        echo "Python max line length: 200"
    endif
endfunction
command! TogglePythonLength call <SID>TogglePythonLength()

" focus
function! <SID>Focus()
  Goyo 200
  Limelight!!
  Tmux set -g status
  set wrap!
  set cursorline! cursorcolumn!
endfunction
command! Focus call <sid>Focus()

" hard wrap text function
" help command-range && help func-range
function! HardWrap(...)
  let textwidth = a:0 == 0? 79 : str2nr(a:1)
  normal! gqG
endfunction
command! -nargs=? HardWrap call HardWrap(<f-args>)

" ix.io paste
function! <SID>IX()
  :read !cat % | curl -n -s -F 'f:1=<-' paste.rupa.co | xclip -selection clipboard
endfunction
command! IX call <SID>IX()

" Uses the Repeat group to highlight the repeated lines
" http://stackoverflow.com/questions/1268032/marking-duplicate-lines/1270689#1270689
function! <SID>HighlightRepeats()
  :syn clear Repeat | g/^\(.*\)\n\ze\%(.*\n\)*\1$/exe 'syn match Repeat "^' . escape(getline('.'), '".\^$*[]') . '$"' | nohlsearch
endfunction
command! HighlightRepeats call <SID>HighlightRepeats()

" Clears lines highlighted in Repeat group
function! <SID>ClearHighlightRepeats()
  :syn clear Repeat
endfunction
command! ClearHighlightRepeats call <SID>ClearHighlightRepeats()

" Toggles the background color, and reloads the colorscheme.
function! <SID>ToggleBackground()
  if exists("g:colors_name")
    exe "colorscheme " . ( g:colors_name == "seoul256" ? "seoul256-light" : "seoul256")
  endif
endfunction
command! ToggleBackground call <SID>ToggleBackground()

" Pretty JSON
" https://coderwall.com/p/faceag
command! PrettyJSON %!python -m json.tool

" Toggle Tmux Status
function! <SID>ToggleTmuxStatus()
  Tmux set -g status
endfunction
command! ToggleTmuxStatus call <SID>ToggleTmuxStatus()

" Pretty HTML/XML
" http://vim.wikia.com/wiki/Cleanup_your_HTML
command! PrettyHtml :%!tidy -q -i --show-errors 0
command! PrettyXml  :%!tidy -q -i --show-errors 0 -xml

command! RustPointerCheatSheet execute '!cat ~/Dropbox/Briefcase/Documents/rust_pointers_cheat_sheet.txt'

" }}}
" ============================================================================
" PLUGINS {{{
" ============================================================================

if executable('ag')
  " let g:ackprg = 'ag --vimgrep'
  let g:ackprg = 'ag --nogroup --nocolor --column'
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
        \ --ignore .git
        \ --ignore .svn
        \ --ignore .hg
        \ --ignore .DS_Store
        \ --ignore "**/*.pyc"
        \ -g ""'

elseif !executable('ack')
  let g:ackprg = 'grep -rn "$*" * \| sed "s/:\([0-9]*\):/:\1:1:/" '
endif

" airline
let b:javascript_fold = 1
let g:airline_section_c = '%F'  " full file path on active file
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts=1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" vimwiki settings
let g:vimwiki_list = [{'path': '~/Dropbox/Public/briefcase/vimwiki'}]

" jsfmt
let g:js_fmt_fail_silently = 1

" Gist settings
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1

" gitgutter
nmap [h <Plug>GitGutterPrevHunk
nmap ]h <Plug>GitGutterNextHunk
let g:gitgutter_max_signs = 3000

" nerdtree
let g:NERDTreeChDirMode = 2
let NERDTreeIgnore = ['\.pyc$']

" php folding
let g:DisableAutoPHPFolding = 1

let g:sneak#streak = 1
let g:Tlist_GainFocus_On_ToggleOpen = 1
let g:tagbar_autofocus = 1
let nerdtreeignore = ['\.pyc$']

" emoji
silent! if emoji#available()
  let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
  let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
  let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
  let g:gitgutter_sign_modified_removed = emoji#for('collision')
endif

" ctrlp
let g:ctrlp_follow_symlinks = 2
let g:ctrlp_working_path_mode = 'rca'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" racer shit
let g:racer_cmd = "~/.vim/plugged/racer/target/release/racer"
if s:darwin
  let $RUST_SRC_PATH="/Users/jared/code/rust-lang/src/"
else
  let $RUST_SRC_PATH="/home/jared/code/rust-lang/src/"
endif

" YouCompleteMe
let g:ycm_register_as_syntastic_checker = 1
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']
let g:ycm_key_list_previous_completion = ['<C-TAB>', '<Up>']
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1

" syntastic
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_json_checkers=['jsonlint']
let g:syntastic_html_tidy_ignore_errors = [
    \  '<html> attribute "lang" lacks value'
    \ ]
let g:syntastic_html_tidy_ignore_errors = [
    \"trimming empty <i>",
    \"trimming empty <span>",
    \" proprietary attribute ",
    \" lacks \"action\" ",
    \"is not recognized!",
    \"discarding unexpected"
\]

" }}}
" ============================================================================
" AUTOCMD {{{
" ============================================================================

augroup vimrc
  autocmd!

  " git gutter color fix
  au ColorScheme * highlight clear SignColumn

  " remove/add cursorline colors
  au WinLeave * set nocursorline nocursorcolumn
  au WinEnter * set cursorline cursorcolumn

  " markdown gets wrapped
  au BufNewFile,BufRead *.md,*.markdown set wrap
  au BufNewFile,BufReadPost *.md set filetype=markdown
  let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'python', 'ruby', 'sass', 'xml', 'html']

  " python thing
  au! FileType python setl nosmartindent

  " Activate it by default
  " autocmd VimEnter * RainbowParentheses

  " Use octodown as default build command for Markdown files
  " autocmd FileType markdown let b:dispatch = 'octodown --live-reload %'

  " save dem folds
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent loadview

  " commentary ft adjustments
  autocmd FileType coffee set commentstring=#\ %s
  autocmd FileType htmldjango set commentstring={#\ %s\ #}
  autocmd FileType apache set commentstring=#\ %s
  autocmd FileType crawl set commentstring=#\ %s

  " <f5> autocommand for running files
  autocmd FileType python nnoremap <buffer> <f5> :exec '!python' shellescape(@%, 1)<cr>
  autocmd FileType sh nnoremap <buffer> <f5> :exec '!bash' shellescape(@%, 1)<cr>

  autocmd FileType rust nnoremap <buffer> <f5> :CargoRun<cr>
  autocmd FileType rust nnoremap <buffer> <leader>b :CargoBuild<cr>
  autocmd FileType rust nnoremap <buffer> <leader>t :CargoTest<cr>

  autocmd FileType go nnoremap <buffer> <f5> :GoRun<cr>
  autocmd FileType go nnoremap <buffer> <leader>b :GoBuild<cr>
  autocmd FileType go nnoremap <buffer> <leader>t :GoTest<cr>

  " When editing a file, always jump to the last cursor position
   autocmd BufReadPost *
   \ if line("'\"") > 0 && line ("'\"") <= line("$") |
   \   exe "normal g'\"" |
   \ endif
augroup END

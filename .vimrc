" --------------------------------------------
"
"   general
"
" --------------------------------------------

" Syntax
syntax on                " enable syntax highlighting
syntax enable

" General
set completeopt-=preview " dont show preview window
set hidden               " hide when switching buffers, don't unload
set mouse=a              " enable mouse in all modes
set nowrap               " no word wrap
set number               " show line numbers
set cursorline           " highlight cursor line
set title                " use filename in window title
set ttyfast              " indicates a fast terminal connection
set lazyredraw           " will buffer screen updates instead of updating all the time
set clipboard=unnamed    " enable clipboard
set autoread             " Set to auto read when a file is changed from the outside
set so=7                 " minimal number of screen lines to keep above and below the cursor when scrolling
set colorcolumn=80       " highlight the 80th column

" Search
set ignorecase           " case insensitive
set incsearch            " show match as search proceeds
set hlsearch             " search highlighting

" Tabs
set autoindent           " copy indent from previous line
set smartindent          " autoindent when starting a new line
set expandtab            " replace tabs with spaces
set shiftwidth=2         " spaces for autoindenting
set smarttab             " <BS> removes shiftwidth worth of spaces
set softtabstop=2        " spaces for editing, e.g. <Tab> or <BS>
set tabstop=2            " spaces for <Tab>

" Wildmenu
set wildmenu
set wildmode=list:longest,full
set wildignore+=.hg,.git,.svn
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.exe,*.dll
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=node_modules/*,bower_components/*

" enable pathogen
call pathogen#infect()

" syntax
let python_highlight_all = 1
let python_highlight_space_errors = 0

" color scheme
set background=dark
let g:gruvbox_bold = 0
let g:gruvbox_termcolors=16
let g:gruvbox_hls_cursor="green"
let g:gruvbox_invert_selection=0
colorscheme gruvbox

" use vim defaults instead of vi
set nocompatible

" file detection
filetype plugin indent on

" enable utf8 encoding
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8

" Delete trailing white space on save
autocmd BufWritePre * :call DeleteTrailingWS()

" persistent undo history
set undofile                        " Save undo's after file closes
set undodir=~/.vim/undo,/tmp        " where to save undo histories
set undolevels=1000                 " How many undos
set undoreload=10000                " number of lines to save for undo
set history=500                     " sets how many lines of history VIM has to remember

" --------------------------------------------
"
"   plugins
"
" --------------------------------------------

" HTML Close Tag
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.tpl,*.twig,*.htm,*.blade.php,*.jsx,*.pug"

" Templating
let g:username = "Kim Koomen"
let g:email = 'koomen@protonail.com'

" ctrlp
let g:ctrlp_use_caching  = 0
let g:ctrlp_regexp = 0
let g:ctrlp_by_filename = 1
let g:ctrlp_max_depth=40
let g:ctrlp_max_files=0
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Indentline
let g:indentLine_char = '|'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Nerd Tree
autocmd VimEnter * NERDTree               " Open Nerd Tree on vimenter
autocmd VimEnter * wincmd p               " Focus last accessed buffer
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let g:NERDTreeWinSize=50
let NERDTreeMinimalUI=1

" Close Nerd Tree too when closing the last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Nerd Tree Tabs
let g:nerdtree_tabs_open_on_console_startup = 1

" --------------------------------------------
"
"   Functions
"
" --------------------------------------------
" Indent if we're at the beginning of a line. Else, do completion.
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction

" Delete trailing whitespaces at the end of each line.
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
  %retab!
endfunc

" Set the last edit position
function! LastEditPosition()
  if line("'\"") > 0 && line("'\"") <= line("$") |
    exe "normal! g`\"" |
  endif
endfunction

" --------------------------------------------
"
"   mapping
"
" --------------------------------------------

" next / previous buffer
nnoremap Z :bprev<cr>
nnoremap X :bnext<cr>

" Set pastetoggle
set pastetoggle=<F2>

" return to last edit position when opening file
autocmd BufReadPost * :call LastEditPosition()

" some filetype(s)
autocmd BufNewFile,BufRead *.php,*.theme set ft=php
autocmd BufNewFile,BufRead *.blade.php set ft=blade.php
autocmd BufNewFile,BufRead *.js,*.json set ft=javascript
autocmd BufNewFile,BufRead *.pug set ft=jade
autocmd BufNewFile,BufRead *.md set ft=markdown spell
autocmd BufNewFile,BufRead *.bash_* set ft=sh
autocmd BufNewFile,BufRead *.ts set ft=typescript

" system clipboard pasting
nnoremap <Leader>y :call system('xclip', @0)<cr>
nnoremap <Leader>p "+p

" commenting
map <C-c> <Leader>cm<cr>
map <C-x> <Leader>cu<cr>
map <C-a> <Leader>cs<cr>

" rot13
nnoremap <silent> <F6> ggg?G<cr>

" space bar un-highligts search
noremap <silent> <Space> :silent noh<Bar>echo<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cnoremap w!! w !sudo tee > /dev/null %

" toggle spell check
nnoremap <leader>sc :setlocal spell!<cr>

" remove ^M
noremap <Leader>m :%s/\r//g<cr>

" map ; to : for simplicity
noremap ; :

" Close buffer (use without nerdtree)
"nnoremap Q :bw<cr>

" Close buffer (use with nerdtree)
nnoremap Q :bp<cr>:bd #<cr>

" Make selection stay
noremap > >gv
noremap < <gv

" Auto Complete
" inoremap <expr> <tab> InsertTabWrapper()

" avoid saving files like ; and w; and other typos
cnoremap ww w

cnoremap w; w
cnoremap W; w
cnoremap w: w
cnoremap W: w

cnoremap x; x
cnoremap X; x
cnoremap x: x
cnoremap X: x

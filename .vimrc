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
set nospell              " Disable spellcheck on default
set so=7                 " minimal number of screen lines to keep above and below the cursor when scrolling
set colorcolumn=80       " highlight the 80th column
set tw=80                " Set a max text width

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
set softtabstop=2        " spaces for editing, e.g. <Tab> or <BS> and this is a very long te
set tabstop=2            " spaces for <Tab>

" Keeps the visual textwidth but doesn't add new line in insert mode when
" passing the 'tw' value.
autocmd FileType * set formatoptions-=t
autocmd FileType .* set formatoptions-=t

" Make our custom aliases available within a non-interactive vim.
let $BASH_ENV = "~/.bash_aliases"

" Wildmenu
set wildmenu
set wildmode=list:longest,full
set wildignore+=.gitkeep
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

" Delete trailing white space when saving a file.
" Also, trigger a retab on the whole file to convert tabs to spaces
autocmd BufWritePre * :call DeleteWhiteSpace()

" persistent undo history
set undofile                        " Save undo's after file closes
set undodir=~/.vim/undo,/tmp        " where to save undo histories
set undolevels=1000                 " How many undos
set undoreload=10000                " number of lines to save for undo
set history=500                     " sets how many lines of history VIM has to remember

" handle swap files
set directory=~/.vim/swap,~/tmp,.
set backupdir=~/.vim/backup,~/tmp,.
set noswapfile
set nobackup

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

func! DeleteWhiteSpace()
  let cursor_pos = getpos(".")

  " Delete trailing whitespaces at the end of each line.
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"

  " Convert remaining tabs to spaces
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
autocmd BufNewFile,BufRead *.bash_* set ft=sh

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

" Close buffer
nnoremap Q :bw<cr>

" Make selection stay
noremap > >gv
noremap < <gv

" Auto complete
"inoremap <expr> <tab> InsertTabWrapper()

" avoid saving files like ; and w; and other typos
cnoremap w; w
cnoremap w: w

cnoremap x; x
cnoremap x: x


" --------------------------------------------
"
"   plugins
"
" --------------------------------------------

" HTML Close Tag
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.tpl,*.twig,*.htm,*.blade.php,*.pug,*.jsx"

" auto-pairs
let g:AutoPairsMultilineClose = 0

" Templating
let g:username = "Kim Koomen"
let g:email = 'koomen@protonail.com'

" vim-jsx
let g:jsx_ext_required = 0

" Indentline
let g:indentLine_char = '|'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" Neocomplete + Ultisnips (prereq: VimCompleteLikeAModernEditor)
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_select = 1
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Emmet
let g:user_emmet_leader_key='<C-f>'

" CtrlP
let g:ctrlp_use_caching = 0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|data\|log\|tmp$\|node_modules\|bower_components',
  \ 'file': '\.exe$\|\.swp$\|\.swo$\|\.jpg$\|\.bmp$\|\.gif$\|\.png$\|\.jpeg$\|\.dll$\|\.exe$\|\.zip$\|\.tar\.gz$\|\.tar\.bz2$\|\.rar$\|\.tar\.xz$'
  \ }

" https://github.com/FelikZ/ctrlp-py-matcher
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" Use git and use the .gitignore to also exclude those files.
"
" NOTE: If you use the g:ctrlp_user_command you can't use g:ctrlp_custom_ignore, since
" you determine the ignored files with your user command.
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

set ruler
set backspace=indent,eol,start
set shiftwidth=2
set tabstop=2
set smarttab
set autoindent
set cindent
set expandtab
set display+=lastline
set showcmd
set showmatch
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set hlsearch
set incsearch
set wildmenu
set wildmode=full
set relativenumber
set mouse=a
set path+=/home/ouzts/workspace/src/**

let g:netrw_altv=1
let g:netrw_browse_split = 4
let g:netrw_preview=1
let g:netrw_liststyle = 3
let g:netrw_winsize = 25
let g:netrw_menu=0
let g:netrw_banner=0

colorscheme ron

filetype plugin indent on
syntax on

match ErrorMsg '\%>80v.\+'

" Make %% expand to active file directory in command line mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" set compiler for :make
set makeprg=make\ -C\ ~/workspace/build

" I need to learn to use these, but for now they are just annoying
set noswapfile

" Autoformat files in google style
autocmd FileType c,cpp,h ClangFormatAutoEnable
" Equalize windows on resizing the terminal
autocmd VimResized * wincmd =

augroup WraplineInTeXFile
    autocmd!
    autocmd FileType tex,plaintex setlocal wrap
    autocmd FileType tex,plaintex setlocal tw=79
augroup END

execute pathogen#infect()

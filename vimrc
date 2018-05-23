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
set relativenumber
filetype plugin indent on
syntax on
colorscheme ron
match ErrorMsg '\%>80v.\+'
autocmd VimResized * wincmd =
let g:netrw_altv=1
let g:netrw_browse_split = 4
let g:netrw_preview=1
let g:netrw_liststyle = 3
let g:netrw_winsize = 25
let g:netrw_menu=0
let g:netrw_banner=0
set mouse=a
set path+=/home/ouzts/workspace/src/**

" Make %% expand to active file directory in command line mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Autoformat files in google style
autocmd FileType c,cpp,h ClangFormatAutoEnable

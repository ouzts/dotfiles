" Plugins
call plug#begin('~/.vim/plugged')
Plug 'w0rp/ale'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/vim-clang-format'
Plug 'vim-scripts/OmniCppComplete'
call plug#end()

packadd termdebug

let mapleader=","
syntax on
filetype plugin indent on

set autoindent
set backspace=indent,eol,start
set cindent
set cinoptions=g0,t0,(0,
set clipboard^=unnamed,unnamedplus
set directory^=$HOME/.vim/swapfiles//
set display+=lastline
set encoding=utf-8
set expandtab
set hidden
set history=1000
set hlsearch
set incsearch
set laststatus=2
set lazyredraw
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set matchpairs+=<:>
set mouse=a
set relativenumber
set ruler
set shiftwidth=2
set shortmess+=A
set showcmd
set showmatch
set smarttab
set t_Co=256
set tabstop=2
set undodir=~/.vim/undodir
set undofile
set updatetime=100
set visualbell t_vb=
set wildmenu
set wildignore+=.git,.hg,.svn,*.gitkeep
set wildignore+=*.so,*.swp,*.swo,*.pyc,.lock,.DS_Store,._*
set wildignore+=*.o,*.obj,*.exe,*.dll,*.a
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.mp3,*.oga,*.ogg,*.wav,*.flac
set wildmode=longest:full,full

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

set makeprg=make\ -C\ $DIR_TO_MAKEFILE
" Todo: :AsyncRun :make<CR>
noremap <F5> :make<CR> 
noremap <F6> :!bash -ic "cd $TEST_DIR && run_unit_tests"<CR>
map <F3> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
map <F4> :vs %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

nnoremap <cr> :noh<CR><CR>:<backspace> 

nnoremap <C-right> :bnext<CR>
nnoremap <C-left> :bprev<CR>
inoremap <C-right> <Esc>:bnext<CR>
inoremap <C-left> <Esc>:bprev<CR>

" Make %% expand to active file directory in command line mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

map <F7> :Termdebug /home/ouzts/${PROJECT_NAME}/build/src/${PROJECT_NAME}/${PROJECT_NAME}_simple ~/${PROJECT_NAME}/build/${PROJECT_NAME}.json<CR>
nnoremap <Leader>b :Break<cr>
nnoremap <Leader>r :Run ${PROJECT_NAME}.json<cr>
nnoremap <Leader>s :Step<cr>
nnoremap <Leader>n :Over<cr>
nnoremap <Leader>p :Evaluate<cr>
nnoremap <Leader>w :call TermDebugSendCommand('where')<cr>

autocmd FileType c,cpp,h ClangFormatAutoEnable " Autoformat files in google style

augroup WraplineInTeXFile
    autocmd!
    autocmd FileType tex,plaintex setlocal wrap
    autocmd FileType tex,plaintex setlocal tw=79
augroup END

autocmd VimResized * wincmd =

augroup ErrorLines
    autocmd!
    autocmd BufEnter,WinEnter * call clearmatches() |
    
autocmd BufEnter *.tpp :setlocal filetype=cpp
autocmd ColorScheme * highlight debugPC ctermfg=0 ctermbg=41 cterm=NONE guifg=#000000 guibg=#00d75f gui=NONE 
autocmd ColorScheme * highlight debugBreakpoint term=bold ctermbg=Red 
match ErrorMsg '\%>80v.\+'
colorscheme ron

let g:netrw_altv=1
let g:netrw_browse_split = 4
let g:netrw_preview=1
let g:netrw_liststyle = 3
let g:netrw_winsize = 25
let g:netrw_menu=0
let g:netrw_banner=0

let g:ale_echo_msg_format='[%linter%] %s'
let g:ale_cpp_gcc_options='-std=c++11 -Wall -Wextra -I/home/ouzts/${PROJECT_NAME}/src -I/home/ouzts/${PROJECT_NAME}'
let g:ale_cpp_cpplint_executable='/home/ouzts/${PROJECT_NAME}/tools/cpplint.py'
let g:ale_cpp_cpplint_options='--extensions=cpp,h,cpp,hpp --root=/home/${PROJECT_NAME} --counting=detailed'
let g:ale_cpp_cppcheck_options='--force --std=c++11 --language=c++ --enable=all --suppressions-list=/home/ouzts/${PROJECT_NAME}/cmake/Modules/cppchecksuppressions.txt --template=\"[{severity}][{id}] {message} {callstack} \(On {file}:{line}\)\""'
let g:ale_cpp_clang_options='-std=c++14 -Wall -I/home/ouzts/${PROJECT_NAME}/src'
let g:ale_c_build_dir='/home/ouzts/${PROJECT_NAME}/build'
let g:ale_cpp_clangtidy_checks=['*','-llvm-header-guard','-clang-analyzer-alpha*','-cert-err58-cpp','-readability-redundant-declaration','-misc-unused-parameters','-modernize-raw-string-literal','-llvm-include-order','-readability-else-after-return','-cppcoreguidelines-pro-bounds-array-to-pointer-decay','-readability-braces-around-statements','-readability-implicit-bool-cast','-cppcoreguidelines-special-member-functions','-clang-analyzer-core.uninitialized.UndefReturn','-cert-err60-cpp','-cppcoreguidelines-pro-bounds-pointer-arithmetic','-cppcoreguidelines-pro-bounds-constant-array-index','-clang-diagnostic-unused-command-line-argument']
nmap <silent> <C-up> <Plug>(ale_previous_wrap)
nmap <silent> <C-down> <Plug>(ale_next_wrap)

let g:OmniCpp_MayCompleteDot = 0
let g:OmniCpp_MayCompleteArrow = 0
let g:OmniCpp_MayCompleteScope = 0

let g:OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD", "_GLIBCXX_STD_A", "_GLIBCXX_STD_C"]

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'Valloric/YouCompleteMe'
Plug 'lervag/vimtex'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'skywind3000/asyncrun.vim'
Plug 'kien/ctrlp.vim'
Plug 'marcopaganini/termschool-vim-theme'
call plug#end()
packadd termdebug

let mapleader=","
syntax on
filetype plugin indent on

set encoding=utf-8
set ruler
set history=1000
set lazyredraw
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
set wildignore+=.git,.hg,.svn
set wildignore+=*.so,*.swp,*.swo,*.pyc,.lock,.DS_Store,._*
set wildignore+=*.o,*.obj,*.exe,*.dll
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.mp3,*.oga,*.ogg,*.wav,*.flac
set wildmode=longest:full,full
set relativenumber
set pyxversion=2
set mouse=a
set path+=/home/ouzts/${PROJECT_NAME}/src/**,/home/ouzts/${PROJECT_NAME}/test/**
set shortmess+=A
set directory^=$HOME/.vim/swapfiles//
set undodir=~/.vim/undodir
set undofile
set clipboard^=unnamed,unnamedplus
set updatetime=100
set makeprg=make\ -C\ ~/${PROJECT_NAME}/build
set matchpairs+=<:>
set hidden
set visualbell t_vb=
set t_Co=256
set laststatus=2

map <C-h> <C-w>h
map <C-j> <C-j>j
map <C-k> <C-k>k
map <C-l> <C-l>l
map <F3> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
map <F4> :vs %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
map <F5> :AsyncRun make<CR>

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


autocmd StdinReadPre * lets:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd FileType c,cpp,h ClangFormatAutoEnable " Autoformat files in google style

augroup WraplineInTeXFile
    autocmd!
    autocmd FileType tex,plaintex setlocal wrap
    autocmd FileType tex,plaintex setlocal tw=79
augroup END

autocmd VimResized * wincmd =
autocmd BufEnter *.tpp :setlocal filetype=cpp
autocmd ColorScheme * highlight debugPC ctermfg=0 ctermbg=41 cterm=NONE guifg=#000000 guibg=#00d75f gui=NONE 
autocmd ColorScheme * highlight debugBreakpoint term=bold ctermbg=Red 
match ErrorMsg '\%>80v.\+'
colorscheme termschool

"---------------------------------------------------------"
"                  YouCompleteMe Config                   "
"---------------------------------------------------------"
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_min_num_of_chars_for_completion=3
let g:ycm_filetype_whitelist = {'cpp' : 1}
let g:ycm_show_diagnostics_ui= 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_echo_current_diagnostic = 0
let g:ycm_max_diagnostics_to_display = 0
let g:ycm_max_num_candidates=25
let g:ycm_auto_trigger=1

function! Switch_ycm_auto_trigger()
  if g:ycm_auto_trigger == 0
    let g:ycm_auto_trigger = 1
   else
     let g:ycm_auto_trigger = 0
   endif
endfunction

nnoremap <leader>y :call Switch_ycm_auto_trigger()<CR>
nnoremap <leader>jd :YcmCompleter GoToDeclaration<cr>
nnoremap <leader>ji :YcmCompleter GoToInclude<cr>
nnoremap <leader>jj :YcmCompleter GoTo<cr>
nnoremap <leader>jf :YcmCompleter GoToDefinition<cr>
nnoremap <leader>jt :YcmCompleter GetType<cr>
nnoremap <leader>jp :YcmCompleter GetParent<cr>
nnoremap <leader>jx :YcmCompleter GetDoc<cr>
"---------------------------------------------------------"

"---------------------------------------------------------"
"                   NERDTree Config                       "
"---------------------------------------------------------"
noremap <leader>l :NERDTreeFind<CR>
"let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.so$', '\.git']
map <C-n> :NERDTreeToggle<CR>
"---------------------------------------------------------"


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

let g:airline#extensions#ale#enabled=1
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts = 1


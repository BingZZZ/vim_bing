"ZSH_THEME="agnoster"

let mapleader = "\<Space>"
filetype on
" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup
" set .rs file is rust
au BufNewFile,BufWrite,BufRead *.rs set filetype=rust
au BufRead,BufNewFile *.asd set filetype=lisp

" autocmd 系列
autocmd FileType python setlocal et sta sw=4 sts=4
autocmd FileType javascript setlocal et sta sw=2 sts=2

set autoread
"set guifont=Sauce\ Code\ Powerline\ Light:h18

set nocompatible        " Use Vim defaults instead of 100% vi compatibility
set backspace=2         " more powerful backspacing

" 代码着色
syntax enable
syntax on

" 标签页
set tabpagemax=9
set showtabline=2


" 制表符
set tabstop=4
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4

" 缩进
set autoindent
set smartindent

" 代码折叠
"set foldmethod=marker
" 基于缩进或语法进行代码折叠
set foldmethod=indent
set foldmethod=syntax
"" 启动 vim 时关闭折叠代码
set nofoldenable"

"设置快速编辑.vimrc文件 ,e 编辑.vimrc
" 快速修改 vimrc 文件
map <silent> <leader>e :e $HOME/.vim/vimrc<cr>
"保存.vimrc文件后会自动调用新的.vimrc
autocmd! bufwritepost _vimrc source $HOME/.vim/_vimrc


" 行号和标尺
set number
"左下角显示光标所在位置
set ruler
set rulerformat=%15(%c%V\ %p%%%)

" 命令行于状态行
set ch=2
set ls=2 " 始终显示状态行

" Search Option
set hlsearch  " Highlight search things
          
set encoding=utf-8
"set fenc=cp936
" English messages only
"language messages zh_CN.utf-8
set fencs=utf-8,gbk,chinese,latin1
set formatoptions+=mM

" =============
" " Key Shortcut
" " =============
nmap <Leader>wq   :wq<cr>
nmap <Leader>t   :tabnew<cr>
nmap <Leader>a   :tabprevious<cr>
nmap <Leader>d   :tabnext<cr>
nmap <Leader>q   :close<cr>
nmap <Leader>s   :sp<cr>
nmap <Leader>v   :vsp<cr>
nmap <Leader>h   :res
nmap <Leader>w   :vertical res 
nmap <Leader>e   :NERDTreeToggle<cr>
nmap <Leader>r   :TagbarToggle<cr>
nnoremap <CR> G
" change scheme
nmap <Leader>,  :colorscheme molokai<cr>
nmap <Leader>.  :colorscheme gruvbox<cr>

"映射切换buffer的键位
 nnoremap [b :bp<CR>
 nnoremap ]b :bn<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>;  :nohlsearch<cr>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
" " let Vundle manage Vundle, required
" 插件管理
Plugin 'gmarik/Vundle.vim'
" commonlisp
" Plugin 'kovisoft/slimv'
" rust
" Plugin 'rust-lang/rust.vim'
" fastfold
Plugin 'Konfekt/FastFold'
" |-------------------go----------------------------|
" go
Plugin 'fatih/vim-go'
" when your change your GOPATH or start a new project , exec: 
"   go get -u github.com/nsf/gocode 
Plugin 'nsf/gocode', {'rtp': 'vim/'}
" a local func jamp
"     go get -v code.google.com/p/rog-go/exp/cmd/godef
"     go install -v code.google.com/p/rog-go/exp/cmd/godef
Plugin 'dgryski/vim-godef'
" python
" Plugin 'klen/python-mode'
" |-------------------------------------------------|
"
" |-------------------comman------------------------|
" 注释
Plugin 'scrooloose/nerdcommenter'
" 代码提示
Plugin 'vim-scripts/AutoComplPop'
" 文件树
Plugin 'scrooloose/nerdtree'
Plugin 'Raimondi/delimitMate'
" edit with html
Plugin 'mattn/emmet-vim'
" add surrounding char for a word
" ys -> create surround  + range [iw, aw, i], i), i", i', ip] + sigal
" cs -> change surround  + origin_sigal + new_sigal
" ds -> delete surround  + sigal
Plugin 'tpope/vim-surround'
" rename {new name}
Plugin 'danro/rename.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" 括号
Plugin 'jiangmiao/auto-pairs'
Plugin 'tomasr/molokai'
Plugin 'dracula/vim'
Plugin 'morhetz/gruvbox'
Plugin 'joshdick/onedark.vim'
"Python complete
Plugin 'davidhalter/jedi-vim'
"C-Tags
Plugin 'szw/vim-tags'
"TagBar
Plugin 'majutsushi/tagbar'
Plugin 'mileszs/ack.vim'
" |-------------------------------------------------|
"
" |-------------------------js----------------------|
" jsfmt :
"   it dependence: npm install -g jsfmt
"Plugin 'mephux/vim-jsfmt'
" js更漂亮
Plugin 'pangloss/vim-javascript'
" |-------------------------------------------------|
"
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line
"

" for airline
let g:airline_powerline_fonts = 1
" let g:airline_theme = "dark"
let g:airline_theme = "gruvbox"
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
function! AirlineInit()
    "let g:airline_section_b = airline#section#create_left(['🐈 ', '%{getcwd()}'])
    let g:airline_section_b = airline#section#create_left(['🐈 ', 'CHIXYOU'])
    let g:airline_section_c = airline#section#create_left(['file'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()

" -------------------------for go ------------------------------"
" https://github.com/fatih/vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1 
" godef https://github.com/dgryski/vim-godef
let g:godef_split = 2

" -------------------------for jsfmt ------------------------------"
"  https://github.com/mephux/vim-jsfmt
let g:AutoPairsShortcutJump='<C-l>'
"let g:js_fmt_autosave = 1
"let g:js_fmt_command = "jsfmt"
" let g:js_fmt_options = '--no-format' "no space with variable and '='
" ""
"
" ------------------------for auto-pair -----------------------"
let g:AutoPairsShortcutJump='<C-l>'
" while file is vim or html ,add '<' complite
au FileType vim,html let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`','<':'>'}
" ------------------------for auto-pair -----------------------"

" ------------------------for auto close preview--------------------------------"
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"molokai---------------------------------------------
"let g:molokai_original = 1
"let g:rehash256 = 1
"colorscheme molokai
"javascript-vim----------------------------------------
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
set foldmethod=syntax
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"
set conceallevel=1
map <leader>l :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>

"ondark----------------------------------------------
let g:onedark_termcolors = 256
let g:onedark_terminal_italics = 1
"

"dracula
colorscheme gruvbox

"set mouse on
set mouse=a

"line number
set relativenumber number
set scrolloff=5

"search something
set hlsearch
set incsearch

" share clipboard
set clipboard=unnamed

"background---------------------------------------------------
set bg=dark

" ack->ag
if executable('ag')
      let g:ackprg = 'ag --vimgrep'
  endif

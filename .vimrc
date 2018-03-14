" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab": "^0.2.0",
set smarttab
" turn on line numbers
set number
" highlight the 80th column
set colorcolumn=80
" prevent syntax highlighting from turning off in tmux
set background=dark

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" file explorer
Plugin 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
" git integration
Plugin 'tpope/vim-fugitive'
" syntax highlighting
Plugin 'pangloss/vim-javascript'
" jsx highlighting for working with React
Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 0
" status bar at the bottom of the screen
Plugin 'bling/vim-airline'
" move around the screen more easily
Plugin 'easymotion/vim-easymotion'
" easy line comment/uncomment
Plugin 'tomtom/tcomment_vim'
" show git indicators on the right side of the screen
Plugin 'airblade/vim-gitgutter'
" makes levels of indentation visible
Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3
let g:indent_guides_enable_on_vim_startup = 1
" close () {} [] automatically
Plugin 'raimondi/delimitmate'
" autocomplete
Plugin 'shougo/neocomplete.vim'
" linting
Plugin 'w0rp/ale'
" fuzzy file
Plugin 'ctrlpvim/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

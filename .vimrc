" disable scroll when in insert mode
inoremap <ScrollWheelUp> <Nop>
inoremap <ScrollWheelDown> <Nop>

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

colorscheme default
syntax on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set backspace=2 " make backspace work like most other programs
" highlight search results
" set hlsearch
set expandtab": "^0.2.0",
set smarttab
" turn on line numbers
set number
" turn on relative line numbers
set relativenumber
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
" better searching
Plugin 'haya14busa/incsearch.vim'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
" file explorer
Plugin 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
" git integration
Plugin 'tpope/vim-fugitive'
" syntax highlighting for js
Plugin 'pangloss/vim-javascript'
" syntax highlighting for reasonml
Plugin 'reasonml-editor/vim-reason-plus'
" use the gruvbox color scheme
Plugin 'morhetz/gruvbox'
" jsx highlighting for working with React
Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 0
" for typescript support
Plugin 'leafgarland/typescript-vim'
" tsx highlighting
Plugin 'peitalin/vim-jsx-typescript'
" status bar at the bottom of the screen
Plugin 'bling/vim-airline'
" move around the screen more easily
Plugin 'easymotion/vim-easymotion'
" surround to wrap and remove " ' } ) ...
Plugin 'tpope/vim-surround'
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
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
" linting
Plugin 'w0rp/ale'
" graphql syntax highlighting
Plugin 'jparise/vim-graphql'

" plugin for elixir
Plugin 'elixir-lang/vim-elixir'

" plugin for golang
Plugin 'fatih/vim-go'

" rails helper plugins
Plugin 'christoomey/vim-run-interactive'
Plugin 'janko-m/vim-test'
Plugin 'pbrisbin/vim-mkdir'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-repeat'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/tComment'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'thoughtbot/vim-rspec'
Bundle 'jgdavey/tslime.vim'

let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

"--------------------------------------
Plugin 'zah/nim.vim'
fun! JumpToDef()
  if exists("*GotoDefinition_" . &filetype)
    call GotoDefinition_{&filetype}()
  else
    exe "norm! \<C-]>"
  endif
endf

" Jump to tag
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i
"--------------------------------------

" enable matchit (better '%' key mapping)
runtime macros/matchit.vim

" change indentation for js and ts
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2

let g:ale_linters = {                                                           
\   'javascript': ['eslint'],                                                   
\   'typescript': ['eslint', 'tsserver'],
\   'python': ['pylint', 'mypy'],
\   'html': ['prettier'],
\   'ruby': ['standardrb']
\}                                                                              
let g:ale_fixers = {                                                            
\   'python': ['black'],
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'tslint'],
\   'ruby': ['standardrb'],
\   'html': ['prettier'],
\   'ocaml': ['ocamlformat']
\}            

" Set this variable to 1 to fix files when you save them.                       
let g:ale_fix_on_save = 1
" fuzzy file
Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

" All of your Plugins must be added before the following line
call vundle#end()            " required

" set the color scheme to gruvbox
colorscheme gruvbox

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
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## ab659db6b73f4107b92fa0b9e3a6e9bd ## you can edit, but keep this line
if count(s:opam_available_tools,"ocp-indent") == 0
  source "/Users/colincrawford/.opam/default/share/ocp-indent/vim/indent/ocaml.vim"
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line

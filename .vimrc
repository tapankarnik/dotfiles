colorscheme molokai
syntax enable
" To go into normal mode from insert mode without having to type <C-[>
inoremap jk <ESC>
nnoremap H ^
nnoremap L $
set so=7
set tabstop=4
set shiftwidth=4
set autoindent
set smarttab
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set smartindent
set number              " show line numbers
set wrap
set nocompatible
" set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
filetype plugin on
set clipboard=unnamedplus
set wildmenu
set wildignore=*.o,*~,*.pyc
set showmatch
set incsearch           " search as characters are entered
"set hlsearch            " highlight matches
set encoding=utf-8
set ruler
set novisualbell
set relativenumber
" Turn backup off, since most stuff is in SVN, git etc. anyway...
"set nobackup
"set nowb
"set noswapfile
"A mapping to make spellchecking easier
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
nnoremap <leader>f 1z= 
" The one above autocorrects the word to the first suggested word
" Some mappings for moving thorugh buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" A shortcut to insert the date in DoW-Day-Month-Year format
inoremap <leader>date <C-r>=strftime("%a-%d-%m-%Y")<CR>

" check off a todo item and time stamp it
inoremap <leader>td <Esc>^rx <Esc>:r! date +" [\%H:\%M]"<ENTER>kJA<Esc>$
" create a new todo item
inoremap <leader>nt <Esc>o_ 

"Below is for automatic installation of vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"Below is for initializing and installing new plugins

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Vim HardTime
"Plug 'takac/vim-hardtime' "Don't really need this anymore, survived 2weeks :)
" Vim Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Vim Bufferline for displaying the opened files in the command line
Plug 'bling/vim-bufferline'
" AutoComplete Plugin
" Plug 'Valloric/YouCompleteMe'
" The file explorer plugin
Plug 'preservim/nerdtree'
" LateX support for vim
Plug 'lervag/vimtex'
" Markdown viewer
" Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
" VimWiki for taking notes
Plug 'vimwiki/vimwiki'
" Initialize plugin system
call plug#end()

" Setting to turn on the Simple theme in vim-airline
let g:airline_theme='simple'

" Setting to turn on the Hard Mode plugin
"let g:hardtime_default_on=1
" The is the keybinding for toggling NERDTree plugin
map <C-n> :NERDTreeToggle<CR>

" This is for changing the vimwiki syntax to markdown
let g:vimwiki_list = [{'syntax': 'markdown', 'ext': '.md'}]
"let g:vimwiki_list = [{'path': '~/vimwiki/',
"                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 1
"Some settings for the markdown viewer. Uncomment to override defaults
" let g:instant_markdown_slow = 1
" let g:instant_markdown_autostart = 0
" map <leader>md :InstantMarkdownPreview<CR>


" Setting for vimtex
let g:tex_flavor = 'latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" Syntax highlighting for minizinc
Plug 'vale1410/vim-minizinc'

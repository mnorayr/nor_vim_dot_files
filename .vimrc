" vimrc file before reducing on 2017-Dec-08 13:26

"""""""""""""""""""""""""""""""""""""""""
"https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
""""""""""""""""""""""""""
set nocompatible              " required
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

au BufNewFile,BufRead *.py
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set textwidth=79
    set expandtab
    set autoindent
    set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"Syntax Checking/Highlighting
"You can have VIM check your syntax on each save with the syntastic extension:



let python_highlight_all=1

"run visually selected code in python
nnoremap <leader>[ :w !python<cr>
xnoremap <leader>] :w !python<cr>

set clipboard=unnamed


""""""""""""""""""""""""""""""
set encoding=utf8

"""" START Vundle Configuration 

" Disable file type for vundle
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" Enable folding with the spacebar
nnoremap <space> za

"Flag bad whitespace
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'




" Utility
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}



" Generic Programming Support 
"Bundle 'ivanov/vim-ipython'

" Markdown / Writting
Plugin 'tmhedberg/SimpylFold'
Bundle 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'


" Git Support
Plugin 'tpope/vim-fugitive'


" Theme / Interface
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'


call vundle#end()            " required
filetype plugin indent on    " required
"""" END Vundle Configuration 

"""""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""""
set nowrap

" OSX stupid backspace fix
set backspace=indent,eol,start

" Show linenumbers
set number

" Set Proper Tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab


" Always display the status line
set laststatus=2

" Enable highlighting of the current line
set cursorline

" Theme and Styling 


syntax on
syntax enable
set t_Co=256

" if (has("termguicolors"))
"   set termguicolors
" endif




let base16colorspace=256  " Access colors present in 256 colorspace


if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme darcula "zenburn
endif






" per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

"""""""""""""""""""""""""""""""""""""
" Mappings configurationn
"""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
map <C-m> :TagbarToggle<CR>



set nocompatible " no vi compability
set hlsearch " highlight search
set ic
set autoindent
set mousehide 
set number " Set Line Numeration
set history=256
set showcmd
set tabstop=4
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-airline/vim-airline'
Plug 'mattn/emmet-vim'
Plug 'frazrepo/vim-rainbow'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'
call plug#end()

let g:rainbow_active = 1 " rainbow global activation
let g:gitgutter_terminal_reports_focus=0 " init gitgutter
let g:airline#extensions#tabline#enabled = 1 " enable tabs
let g:airline#extensions#tabline#formatter = 'default' " Custom Line formatter


" Custom NERDTree Key Binds
nnoremap <C-q> :NERDTreeFocus<CR>	
nnoremap <C-s> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR> 
nnoremap <C-a> :IndentGuidesToggle<CR>
inoremap <silent><expr> <C-@> coc#refresh()

autocmd VimEnter * NERDTree | wincmd p " Start NERDTree when openning Vim
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif " Close NERDTree if is the last window

" VundleVim Plugin
" syntax on 
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" Plugin 'neoclide/coc-lists'
" Plugin 'VundleVim/Vundle.vim'
" Plugin 'NLKNguyen/papercolor-theme'
" call vundle#end()
" filetype plugin indent on
"
set background=dark
colorscheme PaperColor
set laststatus=2

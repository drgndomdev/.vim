set nocompatible " no vi compability
set hlsearch " highlight search
set ic
set autoindent
set mousehide 
set number " Set Line Numeration
set history=512
set showcmd
set tabstop=4
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set encoding=UTF-8

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd")

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-airline/vim-airline'
Plug 'mattn/emmet-vim'
Plug 'frazrepo/vim-rainbow'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'NLKNguyen/papercolor-theme'
Plug 'hugolgst/vimsence'
call plug#end()

" loading the plugin
let g:webdevicons_enable = 1
" adding the flags to NERDTree
let g:webdevicons_enable_nerdtree = 1
" adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1
" adding the column to vimfiler
let g:webdevicons_enable_vimfiler = 1
" Force extra padding in NERDTree so that the filetype icons line up vertically
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:airline_theme='papercolor'
let g:rainbow_active = 1 " rainbow global activation
let g:gitgutter_terminal_reports_focus=0 " init gitgutter
let g:airline#extensions#tabline#enabled = 1 " enable tabs
let g:airline#extensions#tabline#formatter = 'default' " Custom Line formatter
let g:python_highlight_all = 1
let g:LanguageClient_serverCommands = {
	\ 'kotlin' : ['']}
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ } " NerdTree custom signs
let g:PaperColor_Theme_Options = { 
  \   'theme': {
  \     'default.dark': {
  \       'transparent_background': 1
  \     }
  \   }
  \ }  
let g:vimsence_client_id = '439476230543245312'
let g:vimsence_small_text = 'Vim'
let g:vimsence_small_image = 'Vim'
let g:vimsence_editing_details = 'Editing: {}'
let g:vimsence_editing_state = 'Working on: {}'
let g:vimsence_file_explorer_text = 'In NERDTree'
let g:vimsence_file_explorer_details = 'Looking for files'
let g:vimsence_custom_icons = {'filetype': 'iconname'}

" Custom NERDTree Key Binds
nnoremap <C-q> :NERDTreeFocus<CR>	
nnoremap <C-s> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR> 
nnoremap <C-z> :IndentGuidesToggle<CR>
inoremap <silent><expr> <C-@> coc#refresh()

autocmd VimEnter * NERDTree | wincmd p " Start NERDTree when openning Vim
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif " Close NERDTree if is the last window

set background=dark
colorscheme PaperColor
set laststatus=2

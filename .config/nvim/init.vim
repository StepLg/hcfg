call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'
Plug 'arakashic/nvim-colors-solarized'
Plug 'freeo/vim-kalisi'
Plug 'romainl/flattened'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jby/tmux.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'sjl/vitality.vim'
call plug#end()

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set termguicolors

" set background=dark
" let g:solarized_italic=0
" let g:solarized_termcolors=256
colorscheme flattened_dark
" colorscheme flattened_light
let g:airline_theme='solarized'
" let g:airline_powerline_fonts = 1

" line numbers
set nu

" tab configuration
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set softtabstop=2

" folding
set foldcolumn=1
set foldlevelstart=2
autocmd FileType cpp set foldmethod=syntax

set autoread

" relative line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
  else
    set rnu
  endif
endfunc

set rnu
nnoremap <C-n> :call NumberToggle()<cr>

" autosave all files on lost focus and buffers switch
set autowrite
au FocusLost * silent! wa

set noswapfile

" use system clipboard by default
set clipboard+=unnamedplus


" ======================= vim tmux navigator ======================
" Don't allow any default key-mappings.
let g:tmux_navigator_no_mappings = 1

" Re-enable tmux_navigator.vim default bindings, minus <c-\>.
" <c-\> conflicts with NERDTree "current file".

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>


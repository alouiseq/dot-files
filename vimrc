" Initialize Vim-Plug Plugin Manager
call plug#begin('~/.vim/plugged')

" Code Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" File Explorer
Plug 'preservim/nerdtree'

" Git Integration
Plug 'tpope/vim-fugitive'

" Syntax Highlighting
Plug 'sheerun/vim-polyglot'

" Code Formatting
Plug 'Chiel92/vim-autoformat'

" Quick Navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Theme
Plug 'dracula/vim', { 'as': 'dracula' }

" End of Vim-Plug Plugin Manager Initialization
call plug#end()

" Additional settings and configurations
colorscheme dracula  " Activating Dracula theme

" Setters
set number

" Remaps
inoremap jk <ESC>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

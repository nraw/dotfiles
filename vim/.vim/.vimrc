let g:plugged_home = '~/.vim/plugged'

" Plugins List
call plug#begin(g:plugged_home)
  " UI related
  Plug 'chriskempson/base16-vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " Better Visual Guide
  Plug 'Yggdroot/indentLine'
  " FZF <3
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-unimpaired'  " ]q ]Q cnext, ]a next, ]b bnext, ]<Space> newline
  " Python
  Plug 'wmvanvliet/jupyter-vim'
  Plug 'kassio/neoterm'
  " Indentation
  Plug 'michaeljsmith/vim-indent-object'  " vai,  dii
  " syntax check
  Plug 'w0rp/ale'
  " Autocomplete
  Plug 'ncm2/ncm2'
  Plug 'roxma/nvim-yarp'
  Plug 'ncm2/ncm2-bufword'
  Plug 'ncm2/ncm2-path'
  Plug 'ncm2/ncm2-jedi'
  " Docstrings
  " Plug 'heavenshell/vim-pydocstring'  " damn the ctrl l mapping
  " Formater
  Plug 'Chiel92/vim-autoformat'
  " Others
  Plug 'scrooloose/nerdcommenter' " <leader>c<space>
  Plug 'ctrlpvim/ctrlp.vim' " Find anything with ctrl+p
  Plug 'junegunn/vim-easy-align' " Aligning with gaip + whatever
  Plug 'mechatroner/rainbow_csv'
  " Surrounding
  Plug 'machakann/vim-sandwich' " saiw(, sdb and srb
  Plug 'vim-scripts/ReplaceWithRegister' " griw to replace with copy
call plug#end()

filetype plugin indent on

" Configurations Part

" UI configuration
syntax on
syntax enable

" No to auto folding
set nofoldenable
set diffopt+=context:99999

" Add subdirectories to path
set path+=**

" Map leader
let mapleader=" "
let maplocalleader = ','
nnoremap <SPACE> <Nop>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" terminal commands
tnoremap <C-H> <C-\><C-n><C-w>h
tnoremap <C-J> <C-\><C-n><C-w>j
tnoremap <C-K> <C-\><C-n><C-w>k
tnoremap <C-L> <C-\><C-n><C-w>l
autocmd BufEnter term://* startinsert
"To map <Esc> to exit terminal-mode:
:tnoremap <Esc> <C-\><C-n>

set splitbelow
set splitright

" colorscheme
let base16colorspace=256
colorscheme base16-gruvbox-dark-hard
set background=dark

" True Color Support if it's avaiable in terminal
if has("termguicolors")
    set termguicolors
endif

if has("gui_running")
  set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:blocks
endif

" Scroll a bit before cutting off
if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif

set number
" relative numbers just dont work on the pc..
set relativenumber

" Mouse feature
set mouse=a

" Backspace
set backspace=indent,eol,start

" Copy selection
set clipboard=unnamed
:vmap <C-C> "+y

" Clear highlight with ctrl+l
" nnoremap <silent> <C-l> :noh<CR>
" if maparg('<C-L>', 'n') ==# ''
  " nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
" endif
" Backups
set noshowmode
set noswapfile

" Search configuration
set ignorecase                    " ignore case when searching
set smartcase                     " turn on smartcase

" Tab and Indent configuration
set expandtab
set tabstop=4
set shiftwidth=4

" Live substitution
set inccommand=split

" vim-autoformat
noremap <F3> :Autoformat<CR>

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view

" NCM2
" augroup NCM2
    " autocmd!
    " " enable ncm2 for all buffers
    " autocmd BufEnter * call ncm2#enable_for_buffer()
    " " :help Ncm2PopupOpen for more information
    " set completeopt=noinsert,menuone,noselect
    " " When the <Enter> key is pressed while the popup menu is visible, it only
    " " hides the menu. Use this mapping to close the menu and also start a new line.
    " inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
    " " Use <TAB> to select the popup menu:
    " inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    " inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" augroup END

" Ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}

" Airline
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'

" Neoterm
let g:neoterm_default_mod='belowright' " open terminal in bottom split
let g:neoterm_size=16 " terminal split size
let g:neoterm_autoscroll=1 " scroll to the bottom when running a command
let g:neoterm_repl_python='bpython'

nnoremap <A-e> :TREPLSendLine<CR><Esc>j
inoremap <A-e> <Esc>:TREPLSendLine<CR>j
vnoremap <A-e> :TREPLSendSelection<CR><Esc>

nnoremap <C-e> :TREPLSendFile<CR><Esc>
inoremap <C-e> <Esc>:TREPLSendFile<CR>

" Jupyter-vim
nnoremap <leader>R       :JupyterRunFile<CR>
nnoremap <leader>I       :JupyterImportThisFile<CR>
" Change rrent file
nnoremap <leader>d       :JupyterCd %:p:h<CR>
" Send jue
nnoremap <leader>X       :JupyterSendCell<CR>
nnoremap <leader>E       :JupyterSendRange<CR>
nmap     <leader>e       <Plug>JupyterRunTextObj
vmap     <leader>e       <Plug>JupyterRunVisual
nnoremap <leader>U       :JupyterUpdateShell<CR>
" Debuggi
nnoremap <leader>b       :PythonSetBreak<CR>

" Comments
let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


:command Json :%!python -m json.tool
:command E :edit .

" fugitive bug fix
autocmd BufNewFile,BufRead fugitive://* set bufhidden=delete

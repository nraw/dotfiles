let g:plugged_home = '~/.vim/plugged'

" Plugins List
call plug#begin(g:plugged_home)
  " UI related
  " Plug 'chriskempson/base16-vim'
  Plug 'kristijanhusak/vim-hybrid-material'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'bling/vim-bufferline'
  " Better Visual Guide
  " Plug 'Yggdroot/indentLine'
  " FZF <3
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
  Plug 'jesseleite/vim-agriculture'
  " Tags
  " Plug 'ludovicchabant/vim-gutentags'
  " Moving around
  Plug 'easymotion/vim-easymotion'
  " Highlighting removed after moving
  Plug 'romainl/vim-cool'
  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-unimpaired'  " ]q ]Q cnext, ]a next, ]b bnext, ]<Space> newline
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
  Plug 'ncm2/ncm2-ultisnips'
  Plug 'davidhalter/jedi-vim'
  " Docstrings
  " Plug 'heavenshell/vim-pydocstring'  " damn the ctrl l mapping
  " Formater
  Plug 'Chiel92/vim-autoformat'
  " Others
  Plug 'scrooloose/nerdcommenter' " <leader>c<space>
  Plug 'junegunn/vim-easy-align' " Aligning with gaip + whatever
  Plug 'mechatroner/rainbow_csv'
  " Surrounding
  Plug 'machakann/vim-sandwich' " saiw(, sdb and srb
  Plug 'vim-scripts/ReplaceWithRegister' " griw to replace with copy
  " Tmux
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'benmills/vimux'
  " Plug 'esamattis/slimux'
  Plug 'lotabout/slimux'
  " Plug 'greghor/vim-pyShell'
  " Vim Wiki
  Plug 'vimwiki/vimwiki'
  Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
  " Plug 'michal-h21/vim-zettel'
  Plug 'xarthurx/taskwarrior.vim'
  Plug 'tbabej/taskwiki'
  Plug 'Shougo/echodoc.vim'
  " snippets
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'mbbill/undotree' " F5
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'dbeniamine/cheat.sh-vim' " <leader> KP / KE / :Cheat
  Plug 'jpalardy/vim-slime'
  " Potential
  " Tmuxinator
call plug#end()

filetype plugin indent on

" Configurations Part

" UI configuration
syntax on
syntax enable

" No to auto folding
set nofoldenable
set diffopt+=context:99999

" Open buffer at last location
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | end

" Add subdirectories to path
set path+=**

" Maintain undo history between sessions
set undofile
set undodir=~/.vim/undodir

" Map leader
let mapleader=" "
let maplocalleader = ','
nnoremap <SPACE> <Nop>

" terminal commands
tnoremap <C-H> <C-\><C-n><C-w>h
tnoremap <C-J> <C-\><C-n><C-w>j
tnoremap <C-K> <C-\><C-n><C-w>k
tnoremap <C-L> <C-\><C-n><C-w>l
autocmd BufEnter term://* startinsert
"To map <Esc> to exit terminal-mode:
:tnoremap <Esc> <C-\><C-n>

" change directory to the file being edited
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

set splitbelow
set splitright
" vv to generate new vertical split
nnoremap <silent> vv <C-w>v

" colorscheme
" let base16colorspace=256
" colorscheme base16-gruvbox-dark-hard

" vim-hybrid-material
colorscheme hybrid_reverse
set background=dark
let g:enable_bold_font = 1
let g:enable_italic_font = 1
let g:hybrid_transparent_background = 1
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

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
" set relativenumber

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

" Not for yaml though
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Live substitution
set inccommand=split

" Crontab bug
autocmd filetype crontab setlocal nobackup nowritebackup

" vim-autoformat
noremap <F3> :Autoformat<CR>

" Tweaks for browsing
" let g:netrw_banner=0        " disable annoying banner
" let g:netrw_browse_split=4  " open in prior window
" let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view

" NCM2
let g:python3_host_prog = "/usr/bin/python3"
augroup NCM2
    autocmd!
    " enable ncm2 for all buffers
    autocmd BufEnter * call ncm2#enable_for_buffer()
    " :help Ncm2PopupOpen for more information
    set completeopt=noinsert,menuone,noselect
    " When the <Enter> key is pressed while the popup menu is visible, it only
    " hides the menu. Use this mapping to close the menu and also start a new line.
    inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
    " Use <TAB> to select the popup menu:
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
augroup END
set shortmess+=c
let ncm2#popup_delay = 5
let ncm2#complete_length = [[1, 1]]
" Use new fuzzy based matches
let g:ncm2#matcher = 'substrfuzzy'

" jedi
let g:jedi#completions_enabled = 0
let g:jedi#goto_stubs_command = ""


" Echodoc
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'floating'
" " To use a custom highlight for the float window,
" " change Pmenu to your highlight group
highlight link EchoDocFloat Pmenu

" Ale
let g:ale_lint_on_enter = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {'python': ['black', 'isort']}

" Airline
let g:airline_theme = "hybrid"
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'

" Slimux
map <Leader>s :SlimuxREPLSendLine<CR>
vmap <Leader>s :SlimuxREPLSendSelection<CR>
map <Leader>b :SlimuxREPLSendBuffer<CR>
map <Leader>a :SlimuxShellLast<CR>
map <Leader>k :SlimuxSendKeysLast<CR>

" Vimux
" Prompt for a command to run
map <leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>
" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>
" Zoom the tmux runner pane (tmux: ctrl+a z)
map <Leader>vz :VimuxZoomRunner<CR>

" K equals Ggrep
nnoremap <silent> K :Ggrep <cword><CR>

" Comments
let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" vimwiki settings
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
"
" Removes <CR> behaviour from random md files
let g:vimwiki_global_ext = 0
let g:vimwiki_table_mappings = 0

" instant markdown
let g:instant_markdown_autostart = 0
let g:instant_markdown_port = 9898
:nmap <Leader>wp :InstantMarkdownPreview<CR>
command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.md VimwikiDiaryGenerateLinks
augroup end

" Zettel
" let g:zettel_fzf_command = "rg"

" TaskWiki
let g:taskwiki_disable_concealcursor = "yes"
let g:taskwiki_markup_syntax='markdown'

inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

let g:UltiSnipsRemoveSelectModeMappings = 0
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-n>"
let g:UltiSnipsExpandTrigger="<Plug>(ultisnips_expand)"
let g:ultisnips_python_style="google"

" Undotree
nnoremap <F5> :UndotreeToggle<cr>

" Kedro
:command -nargs=1 Node :e src/ccn_team_predict/nodes/<args>.py
:command -nargs=1 Pipeline :e src/ccn_team_predict/pipelines/<args>.py
xnoremap <leader>o <esc>:'<,'>!xargs -I _ kedropipe _ <CR>

" Useful Commands
:command Json :%!python -m json.tool
:command E :edit .
:command RC :edit ~/dotfiles/vim/.vim/.vimrc
:command Notes :Files ~/vimwiki
:command RGN :RgRaw "" ~/vimwiki
:command Date :r !date +"\%F"
" :nnoremap <leader> :Commands<CR>

nnoremap <C-p> :Files<CR>
nnoremap <C-e> :Buffers<CR>

" Disable quote concealing in JSON files
let g:vim_json_conceal=0

" fugitive
" deletes hidden buffers
autocmd BufNewFile,BufRead fugitive://* set bufhidden=delete
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
" adds branch to statusline
" .. to go back, doesn't work tho :D
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

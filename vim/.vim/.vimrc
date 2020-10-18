let g:plugged_home = '~/.vim/plugged'

" Plugins List
call plug#begin(g:plugged_home)
  " UI related
  " Plug 'chriskempson/base16-vim'
  Plug 'kristijanhusak/vim-hybrid-material'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " Better Visual Guide
  " Plug 'Yggdroot/indentLine'
  " FZF <3
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
  Plug 'jesseleite/vim-agriculture' " :RgRaw
  " Moving around
  Plug 'easymotion/vim-easymotion'
  Plug 'tpope/vim-unimpaired'  " ]q ]Q cnext, ]a next, ]b bnext, ]<Space> newline
  Plug 'michaeljsmith/vim-indent-object'  " vai,  dii
  Plug 'vim-scripts/ReplaceWithRegister' " griw to replace word with copy
  Plug 'troydm/zoomwintab.vim' " <leader>z
  Plug 'machakann/vim-swap'  " g<, g>, gs on parameters in functions
  Plug 'tpope/vim-eunuch'  " Move, Rename, Delete
  " Highlighting removed after moving
  Plug 'romainl/vim-cool'
  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'airblade/vim-gitgutter'
  " Tests
  Plug 'tpope/vim-dispatch'
  Plug 'vim-test/vim-test'
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
  Plug 'Shougo/echodoc.vim'
  Plug 'dbeniamine/cheat.sh-vim' " <leader> KP / KE / :Cheat
  " Comments and Docstrings
  Plug 'scrooloose/nerdcommenter' " <leader>c<space>
  Plug 'kkoomen/vim-doge'
  " Plug 'heavenshell/vim-pydocstring'  " damn the ctrl l mapping
  " Formater
  Plug 'Chiel92/vim-autoformat'
  " Others
  Plug 'junegunn/vim-easy-align' " Aligning with gaip + whatever
  " Colors
  Plug 'mechatroner/rainbow_csv'
  Plug 'norcalli/nvim-colorizer.lua'
  " Surrounding
  Plug 'machakann/vim-sandwich' " saiw(, sdb and srb
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
  " Plug 'xarthurx/taskwarrior.vim'
  " Plug 'tbabej/taskwiki'
  " Snippets
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  " Better understanding
  Plug 'mbbill/undotree' " F5
  Plug 'junegunn/vim-peekaboo'
  " File manager integration
  Plug 'mcchrish/nnn.vim'
  " Potential
  " Tmuxinator
  " Personal
  Plug '/Users/andrej_marsic/code/research/kedro/ncm2-kedro_datasets'
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
augroup ReopenBuffer
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | end
augroup END

" Add subdirectories to path
set path+=**

" Maintain undo history between sessions
set undofile
set undodir=~/.vim/undodir

" Map leader
let mapleader=' '
let maplocalleader = ','
nnoremap <SPACE> <Nop>

" Remap start and end
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

" Useful for prosaic texts
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

" Keep visual after move
vnoremap < <gv
vnoremap > >gv

" New lines map to unimpaired
map <leader>o ]
map <leader>O [

" map U to undo till last save
nnoremap U :earlier 1f<CR>

" terminal commands
tnoremap <C-H> <C-\><C-n><C-w>h
tnoremap <C-J> <C-\><C-n><C-w>j
tnoremap <C-K> <C-\><C-n><C-w>k
tnoremap <C-L> <C-\><C-n><C-w>l
augroup Term
    autocmd BufEnter term://* startinsert
augroup END
"To map <Esc> to exit terminal-mode:
:tnoremap <Esc> <C-\><C-n>

" change directory to the file being edited
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

set splitbelow
set splitright

" - and _ to generate splits
nnoremap <silent> - <C-w>s
nnoremap <silent> _ <C-w>v

" Additional operators
:onoremap in( :<c-u>normal! f(vi(<cr>
:onoremap = :<c-u>normal! ^f=lv$h<cr>

" Easymotion F
nmap F <Plug>(easymotion-prefix)s

" colorscheme
" let base16colorspace=256
" colorscheme base16-gruvbox-dark-hard

" vim-hybrid-material
colorscheme hybrid_reverse
set background=dark
let g:enable_bold_font = 1
let g:enable_italic_font = 1
let g:hybrid_transparent_background = 1
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" True Color Support if it's avaiable in terminal
if has('termguicolors')
    set termguicolors
endif

if has('gui_running')
  set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:blocks
endif

" Scroll a bit before cutting off
if !&scrolloff
  set scrolloff=5
endif
if !&sidescrolloff
  set sidescrolloff=5
endif

set number
" relative numbers just dont work on the pc..
" set relativenumber

" Mouse feature
set mouse=a

" Speed up scrolling
" set ttyfast

" Map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Leader>f @=(foldlevel('.')?'za':"\<Leader>")<CR>
vnoremap <Leader>f zf

" Backspace
set backspace=indent,eol,start

" Copy selection
set clipboard=unnamedplus

" Some nifty macro shortcuts
nnoremap Q @q
nnoremap <Leader>Q :%norm @q<CR>
nnoremap <Leader>qp o<esc>"qp
nnoremap <Leader>qy "qdd

" Do not redraw until macro is finished
set lazyredraw

" Remapping s to behave like d, fights with sandwich
xnoremap s "_d
nnoremap ss "_dd

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
nnoremap <leader>/ :%s/

" Tab and Indent configuration
set expandtab
set tabstop=4
set shiftwidth=4

" Not for yaml though
augroup YAML
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
augroup END

" Live substitution
set inccommand=split

" Crontab bug
augroup crontab
    autocmd filetype crontab setlocal nobackup nowritebackup
augroup END

" Tweaks for browsing
" let g:netrw_banner=0        " disable annoying banner
" let g:netrw_browse_split=4  " open in prior window
" let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view

" NCM2
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
let g:jedi#goto_stubs_command = ''


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
let g:ale_fixers = {'python': ['black', 'isort'], 'sh': ['shfmt'], 'yaml': ['prettier'], 'markdown': ['prettier']}

nnoremap <silent> ]e :ALENextWrap<cr>
nnoremap <silent> [e :ALEPreviousWrap<cr>
nnoremap <silent> [E :ALEFirst<cr>
nnoremap <silent> ]E :ALELast<cr>

" Airline
let g:airline_theme = 'hybrid'
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1

" Slimux
map <Leader>s :SlimuxREPLSendLine<CR>
vmap <Leader>s :SlimuxREPLSendSelection<CR>
map <Leader>b :SlimuxREPLSendBuffer<CR>
" map <Leader>a :SlimuxShellLast<CR>
" map <Leader>ak :SlimuxSendKeysLast<CR>

" Custom Slimux
map <Leader>ee :norm ^viW s<CR>

" Last python command
map <Leader>ll :r !last_python<CR>
map <Leader>la :r !last_python_find<CR>

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
let g:NERDDefaultAlign = 'left'

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
:nmap <Leader>md :InstantMarkdownPreview<CR>
command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.md VimwikiDiaryGenerateLinks
augroup end

" Zettel
" let g:zettel_fzf_command = "rg"

" TaskWiki
let g:taskwiki_disable_concealcursor = 'yes'
let g:taskwiki_markup_syntax='markdown'

inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

let g:UltiSnipsRemoveSelectModeMappings = 0
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-n>'
let g:UltiSnipsExpandTrigger='<Plug>(ultisnips_expand)'
let g:ultisnips_python_style='google'

" Undotree
nnoremap <F5> :UndotreeToggle<cr>

" Zoom on tab
nnoremap <Leader>z :ZoomWinTabToggle<CR>

" nnn
" let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }

" Kedro
xnoremap <leader>ko <esc>:'<,'>!xargs -I _ kedropipe _ <CR>
nnoremap <leader>kn :.w !xargs -I _ kedro_new_node _ <CR>
augroup Catalog
    autocmd BufNewFile,BufRead catalog.yml UltiSnipsAddFiletypes catalog
augroup END

" Useful Commands
:command! Json :%!python -m json.tool
:command! E :edit .
:command! RC :edit ~/dotfiles/vim/.vim/.vimrc
:command! Notes :Files ~/vimwiki
:command! Nnr :RgRaw "" ~/vimwiki
:command! Date :r !date +"\%F"
:command! Re :so $MYVIMRC
:command! Box :!box_dump %

" FZF
nnoremap ,, :Commands<CR>
nnoremap <C-p> :Files<CR>
nnoremap <C-e> :Buffers<CR>

" Disable quote concealing in JSON files
let g:vim_json_conceal=0

" fugitive
" deletes hidden buffers
augroup Hidden
    autocmd BufNewFile,BufRead fugitive://* set bufhidden=delete
augroup END

" adds branch to statusline
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
" .. to go back, doesn't work tho :D
augroup branches
    autocmd User fugitive
      \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
      \   nnoremap <buffer> .. :edit %:h<CR> |
      \ endif
augroup END

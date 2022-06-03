let g:plugged_home = '~/.vim/plugged'

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins List
call plug#begin(g:plugged_home)
  " UI related
  Plug 'kristijanhusak/vim-hybrid-material'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " FZF <3
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
  Plug 'jesseleite/vim-agriculture' " :RgRaw
  " Moving around
  Plug 'tpope/vim-unimpaired'  " ]q ]Q cnext, ]a next, ]b bnext, ]<Space> newline
  Plug 'troydm/zoomwintab.vim' " <leader>z
  Plug 'machakann/vim-swap'  " g<, g>, gs on parameters in functions
  Plug 'tpope/vim-eunuch'  " Move, Rename, Delete
  Plug 'wellle/targets.vim'
  " Highlighting removed after moving
  Plug 'romainl/vim-cool'
  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'shumphrey/fugitive-gitlab.vim'
  Plug 'junegunn/gv.vim'  " :GV
  Plug 'airblade/vim-gitgutter'
  " Indentation
  Plug 'michaeljsmith/vim-indent-object'  " vai,  dii
  Plug 'junegunn/vim-easy-align' " Aligning with gaip + whatever
  " Tests
  Plug 'tpope/vim-dispatch'
  Plug 'vim-test/vim-test'
  Plug 'drmingdrmer/vim-toggle-quickfix'
  " Linting
  Plug 'w0rp/ale'
  " Additional syntax
  Plug 'cespare/vim-toml'
  " Autocomplete
  Plug 'ncm2/ncm2'
  Plug 'roxma/nvim-yarp'
  Plug 'ncm2/ncm2-bufword'
  Plug 'ncm2/ncm2-path'
  Plug 'ncm2/ncm2-jedi'
  Plug 'ncm2/ncm2-ultisnips'
  Plug 'davidhalter/jedi-vim'
  Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
  " Snippets
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  " Refactoring
  Plug 'apalmer1377/factorus'
  " Help
  Plug 'dbeniamine/cheat.sh-vim' " <leader> KB / :Cheat
  " Comments and Docstrings
  Plug 'scrooloose/nerdcommenter' " <leader>c<space>
  " Colors
  Plug 'mechatroner/rainbow_csv'
  Plug 'norcalli/nvim-colorizer.lua'
  " Surrounding
  Plug 'machakann/vim-sandwich' " saiw(, sdb and srb, sdf, saiwf
  " Tmux
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'benmills/vimux'
  " Plug 'esamattis/slimux'
  Plug 'lotabout/slimux'
  " Vim Wiki
  Plug 'vimwiki/vimwiki'
  Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
  " Terraform
  Plug 'hashivim/vim-terraform'
  " Front End
  Plug 'mattn/emmet-vim' " div>ul>li*3 ,,
  Plug 'AndrewRadev/tagalong.vim' " changes ending tags
  Plug 'rstacruz/vim-ultisnips-css'
  " Better understanding
  Plug 'mbbill/undotree' " F5
  " Plug 'junegunn/vim-peekaboo'
  " File manager integration
  Plug 'mcchrish/nnn.vim'
  " Collaboration
  " Potential
  " Plug 'Yggdroot/indentLine'
  " Plug 'easymotion/vim-easymotion'
  " Plug 'vim-scripts/ReplaceWithRegister' " griw to replace word with copy
  " Plug 'Shougo/echodoc.vim'
  " Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
  " Plug 'heavenshell/vim-pydocstring'  " damn the ctrl l mapping
  " Plug 'sheerun/vim-polyglot'
  " LSP
  " Plug 'neovim/nvim-lspconfig'
  " Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
  " Plug 'vim-scripts/ReplaceWithRegister' " griw to replace with copy
  " Plug 'michal-h21/vim-zettel'
  " Plug 'xarthurx/taskwarrior.vim'
  " Plug 'tbabej/taskwiki'
  " Plug 'wellle/context.vim'
  " Tmuxinator
  " Personal
  Plug '/Users/andrej_marsic/code/research/kedro/ncm2-kedro_datasets'
call plug#end()

filetype plugin indent on

" Configurations Part

" UI configuration
syntax on
syntax enable

" Autoread in case file has changed
set autoread
set updatetime=150

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

" Maintain undo history between sessions
set undofile
set undodir=~/.vim/undodir

" Map leader
let mapleader=' '
let maplocalleader = ','
nnoremap <SPACE> <Nop>

" Path to clipboard
command! CopyPath let @+ = expand('%:p')

" Remap start and end
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

" Yank map
nnoremap Y y$

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
onoremap = :<c-u>normal! ^f=wv$h<cr>
xnoremap il $o^
onoremap il :normal vil<CR>
xnoremap al $o0
onoremap al :normal val<CR>

" Do not add regular n and N for search into jumplist
nnoremap <silent> n :<C-u>execute "keepjumps norm! " . v:count1 . "n"<CR>
nnoremap <silent> N :<C-u>execute "keepjumps norm! " . v:count1 . "N"<CR>
" Their counterparts here
nnoremap <leader>n n
nnoremap <leader>N N

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

" Backups
set noshowmode
set noswapfile

" Search configuration
set ignorecase                    " ignore case when searching
set smartcase                     " turn on smartcase
nnoremap <leader>/ :%s/
vnoremap & y/\V<C-R>=escape(@",'/\')<CR><CR>

" Tab and Indent configuration
set expandtab
set tabstop=2
set shiftwidth=2

" Live substitution
set inccommand=split

" Crontab bug
augroup crontab
    autocmd filetype crontab setlocal nobackup nowritebackup
augroup END

" Tweaks for browsing
let g:netrw_liststyle=3     " tree view

" Targets settings
" Remove vi=
autocmd User targets#mappings#user call targets#mappings#extend({
    \ '=': {},
    \ })

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
let g:ncm2_jedi#call_sig_hint = 0

au User Ncm2Plugin call ncm2#register_source({
    \ 'name' : 'css',
    \ 'priority': 9,
    \ 'subscope_enable': 1,
    \ 'scope': ['css','scss'],
    \ 'mark': 'css',
    \ 'word_pattern': '[\w\-]+',
    \ 'complete_pattern': ':\s*',
    \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
    \ })

" LSP
" let g:LanguageClient_serverCommands = {'python': ['pyls'], 'yaml': ['yaml-language-server']}

" nnoremap <silent> gk :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" jedi
" Disable completions but keep other features
let g:jedi#completions_enabled = 0
" Remove goto_stubs as it's set to <leader>s
let g:jedi#goto_stubs_command = ''


" Ale
let g:ale_lint_on_enter = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'always'
let g:ale_echo_msg_format = '%linter% | %severity% | %s '
let g:ale_fixers = {
 \ 'python': ['black', 'isort'],
 \ 'sh': ['shfmt'], 
 \ 'yaml': ['prettier'], 
 \ 'css': ['prettier'],  
 \ 'javascript': ['prettier'],  
 \ 'html': ['prettier'],  
 \ 'markdown': ['prettier']}

command! ALEDisableFixers let g:ale_fix_on_save=0
command! ALEEnableFixers  let g:ale_fix_on_save=1

nnoremap <silent> ]e :ALENextWrap<cr>
nnoremap <silent> [e :ALEPreviousWrap<cr>
nnoremap <silent> [E :ALEFirst<cr>
nnoremap <silent> ]E :ALELast<cr>

" Ale frontend
let g:ale_css_stylelint_use_global = 1
let g:ale_css_stylelint_options = '--config ~/.config/.stylelintrc.json'
let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_eslint_options = '--config ~/.config/.eslintrc.json'

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
let g:slimux_select_from_current_window = 1
map <Leader>s :SlimuxREPLSendLine<CR>
vmap <Leader>s :SlimuxREPLSendSelection<CR>
map <Leader>b :SlimuxREPLSendBuffer<CR>
" map <Leader>a :SlimuxShellLast<CR>
" map <Leader>ak :SlimuxSendKeysLast<CR>

" Custom Slimux
map <Leader>ee :norm ^viW s<CR>
map <Leader>ew :norm viw s<CR>
map <Leader>e= :norm ^f=wv$h s<CR>
map <Leader>e? :call SlimuxSendCommand(expand('<cword>') . '??')<CR>
map <Leader>ec :call SlimuxSendCommand(expand('<cword>') . '.columns')<CR>
map <Leader>ed :call SlimuxSendCommand('%debug')<CR>
map <Leader>eh :call SlimuxSendCommand(expand('<cword>') . '.head()')<CR>
map <Leader>ei :call SlimuxSendCommand(expand('<cword>') . '.info()')<CR>
map <Leader>ek :call SlimuxSendCommand(expand('<cword>') . '.keys()')<CR>
map <Leader>el :call SlimuxSendCommand('len(' . expand('<cword>') . ')')<CR>
map <Leader>en :call SlimuxSendCommand('next(iter(' . expand('<cword>') . '))')<CR>
map <Leader>ep :call SlimuxSendCommand(getline('.') . 'pass')<CR>
map <Leader>er :call SlimuxSendCommand('%run ' . expand('%'))<CR>
map <Leader>es :call SlimuxSendCommand(expand('<cword>') . '.size()')<CR>
map <Leader>e1 :call SlimuxSendCommand(expand('<cword>') . '.iloc[0]')<CR>
map <Leader>ev :call SlimuxSendCommand('from visidata import view_pandas as vd; vd(' . expand('<cword>') . ')')<CR>
map <Leader>e_ :call SlimuxSendCommand(expand('<cword>') . ' = _')<CR>
map <Leader>ekl :call SlimuxSendCommand(expand('<cword>') . '=catalog.load("' . expand('<cword>') . '")')<CR>
map <Leader>eks :call SlimuxSendCommand('catalog.save("' . expand('<cword>') . '",' . expand('<cword>') . ')')<CR>
map <Leader>eF :norm V[[O][ s<CR>
map <Leader>ef :norm V[[%jO][k s<CR>
nnoremap <Leader>ea /if __name__ == "__main__":<CR> <bar> kVgg :SlimuxREPLSendSelection<CR>



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

" Dispatch
autocmd FileType python let b:dispatch = 'python3 %'
" Add python errorformat
set errorformat+=%*\\sFile\ \"%f\"\\,\ line\ %l\\,\ %m,%*\\sFile\ \"%f\"\\,\ line\ %l
set errorformat+=%*\\s%f\(%l\)
nnoremap <Leader>cp :cexpr system("pbpaste")<CR>
:nmap <leader>\ <Plug>window:quickfix:loop

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

" Vimwiki autosave
augroup vimwikisave
    autocmd!
    autocmd BufWritePost */vimwiki/** execute ':silent ! cd ~/vimwiki && nohup $(if git rev-parse --git-dir > /dev/null 2>&1 ; then git add . && git commit -m "Auto-commit: saved %" && git push; fi > /dev/null 2>&1) &'
augroup end

" Zettel
" let g:zettel_fzf_command = "rg"

" TaskWiki
let g:taskwiki_disable_concealcursor = 'yes'
let g:taskwiki_markup_syntax='markdown'

" Press enter to expand selection
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

let g:UltiSnipsRemoveSelectModeMappings = 0
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsJumpForwardTrigger='<c-n>'
let g:UltiSnipsJumpBackwardTrigger='<c-b>'
let g:UltiSnipsExpandTrigger='<Plug>(ultisnips_expand)'
let g:ultisnips_python_style='google'

" Undotree
nnoremap <F5> :UndotreeToggle<cr>

" Zoom on tab
nnoremap <Leader>z :ZoomWinTabToggle<CR>

" nnn
let g:nnn#set_default_mappings = 0
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }
let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-x>': 'split',
      \ '<c-v>': 'vsplit' }

" Kedro
xnoremap <leader>ko <esc>:'<,'>!xargs -I _ kedropipe _ <CR>
nnoremap <leader>kn :.w !xargs -I _ kedro_new_node _ <CR>
nnoremap <leader>kc :.w !xargs -I _ kedro_add_catalog _ <CR>
augroup Catalog
    autocmd BufNewFile,BufRead catalog.yml UltiSnipsAddFiletypes catalog
augroup END

" Useful Commands
:command! Json :%!python -m json.tool
:command! E :edit .
:command! RC :edit ~/dotfiles/vim/.vim/.vimrc
:command! Notes :Files ~/vimwiki
:command! NNR :RgRaw -L "" ~/vimwiki
:command! Date :r !date +"\%F"
:command! Event :read !icalBuddy -n -li 1 -ps '/ | /' -b '\# ' -nnr -ea -nc -eed -nrd -tf "\%Y-\%b-\%d" -iep title,datetime,attendees -po title,datetime eventsToday
:command! Re :so $MYVIMRC
:command! Box :exec "!box_dump % | pbcopy"
nnoremap <leader>ks :Start! ks % <CR>
:command! -nargs=1 Pic :r !save_pic <args>
:command! OCR :r !ocr

" FZF
nnoremap ,, :Commands<CR>
nnoremap <C-p> :Files<CR>
nnoremap <C-e> :Buffers<CR>
nnoremap <C-n> :Notes<CR>
nnoremap <leader>yp :Start! yp -p 1<CR>
" nnoremap <leader>ypf :Start yp --f=true<CR>

" Disable quote concealing in JSON files
let g:vim_json_conceal=0

" Fugitive
" deletes hidden buffers
augroup Hidden
    autocmd BufNewFile,BufRead fugitive://* set bufhidden=delete
augroup END

" Enterprise
let g:github_enterprise_urls = ['https://githuben.intranet.mckinsey.com']
let g:fugitive_gitlab_domains = ['https://git.msv.mckinsey.com']

" Fugitive Conflict Resolution (besides do and dp)
nnoremap <leader>gd :Gdiffsplit!<CR>
" nnoremap gdh :diffget //2<CR>
" nnoremap gdl :diffget //3<CR>

" Translate
nnoremap <leader>ts :.w !xargs -I _ ./sub.sh _ <CR>
nnoremap <leader>tr :.w !xargs -I _ docker run --rm soimort/translate-shell --theme none _ <CR>
nnoremap <leader>tb :.w !xargs -I _ docker run --rm soimort/translate-shell -b _ <CR>

" Front End
" Colorizer
lua require'colorizer'.setup()

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key=','
let g:tagalong_verbose = 1

" FASD
function! s:fasd_update() abort
  if empty(&buftype) || &filetype ==# 'dirvish'
    call jobstart(['fasd', '-A', expand('%:p')])
  endif
endfunction
augroup fasd
  autocmd!
  autocmd BufWinEnter,BufFilePost * call s:fasd_update()
augroup END
command! FASD call fzf#run(fzf#wrap({'source': 'fasd -al', 'options': '--no-sort --tac --tiebreak=index'}))


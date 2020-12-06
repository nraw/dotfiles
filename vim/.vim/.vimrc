let g:plugged_home = '~/.vim/plugged'

" Plugins List
call plug#begin(g:plugged_home)
  " UI related
  " Plug 'chriskempson/base16-vim'
  Plug 'kristijanhusak/vim-hybrid-material'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " Plug 'bling/vim-bufferline'
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
  Plug 'airblade/vim-gitgutter'
  " Indentation
  Plug 'michaeljsmith/vim-indent-object'  " vai,  dii
  " syntax check
  " Plug 'w0rp/ale'
  " " Autocomplete
  " Plug 'ncm2/ncm2'
  " Plug 'roxma/nvim-yarp'
  " Plug 'ncm2/ncm2-bufword'
  " Plug 'ncm2/ncm2-path'
  " Plug 'ncm2/ncm2-jedi'
  " Plug 'ncm2/ncm2-ultisnips'
  " Plug 'davidhalter/jedi-vim'
  " Coc
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " LSP
  " Plug 'neovim/nvim-lspconfig'
  " Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
  " Docstrings
  " Plug 'heavenshell/vim-pydocstring'  " damn the ctrl l mapping
  " Formater
  Plug 'Chiel92/vim-autoformat'
  " Others
  Plug 'scrooloose/nerdcommenter' " <leader>c<space>
  Plug 'junegunn/vim-easy-align' " Aligning with gaip + whatever
  Plug 'mechatroner/rainbow_csv'
  Plug 'tpope/vim-dispatch'
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
  " snippets
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'mbbill/undotree' " F5
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'dbeniamine/cheat.sh-vim' " <leader> KP / KE / :Cheat
  Plug 'troydm/zoomwintab.vim'
  Plug 'machakann/vim-swap'  " g<, g>, gs on parameters in functions
  Plug 'mcchrish/nnn.vim'
  Plug 'junegunn/vim-peekaboo'
  Plug 'kkoomen/vim-doge'
  " Potential
  " Tmuxinator
call plug#end()

filetype plugin indent on

" Configurations Part

" UI configuration
syntax on
syntax enable

" No to auto folding
" set nofoldenable
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
" set shortmess+=c
" let ncm2#popup_delay = 5
" let ncm2#complete_length = [[1, 1]]
" " Use new fuzzy based matches
" let g:ncm2#matcher = 'substrfuzzy'

" COC
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
  \ pumvisible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ?
  \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.3 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" LSP
" let g:LanguageClient_serverCommands = {'python': ['pyls'], 'yaml': ['yaml-language-server']}

" nnoremap <silent> gk :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" jedi
let g:jedi#completions_enabled = 0
let g:jedi#goto_stubs_command = ''


" Ale
let g:ale_lint_on_enter = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {'python': ['black', 'isort'], 'sh': ['shfmt'], 'yaml': ['prettier'], 'markdown': ['prettier']}

" Airline
let g:airline_theme = 'hybrid'
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
map <Leader>ak :SlimuxSendKeysLast<CR>

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

" Dispatch
autocmd FileType python let b:dispatch = 'python3 %'
" Add python errorformat
set errorformat+=%*\\sFile\ \"%f\"\\,\ line\ %l\\,\ %m,%*\\sFile\ \"%f\"\\,\ line\ %l
nnoremap <Leader>cp :cexpr system("xclip -o -sel clip")<CR>

" Comments
let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default

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
let g:taskwiki_disable_concealcursor = 'yes'
let g:taskwiki_markup_syntax='markdown'

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
:command! -nargs=1 Node :e src/ccn_team_predict/nodes/<args>.py
:command! -nargs=1 Pipeline :e src/ccn_team_predict/pipelines/<args>.py
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
:command! RGN :RgRaw "" ~/vimwiki
:command! Date :r !date +"\%F"
:command! Re :so $MYVIMRC
:command! Box :!box_dump %
:command! -nargs=1 Pic :r !save_pic <args>

" Random maps
nnoremap <leader>ka :!kubectl apply -f %

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

set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
" adds branch to statusline
" .. to go back, doesn't work tho :D
augroup branches
    autocmd User fugitive 
      \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
      \   nnoremap <buffer> .. :edit %:h<CR> |
      \ endif
augroup END

" Translate
nnoremap <leader>ts :.w !xargs -I _ ./sub.sh _ <CR>
nnoremap <leader>tr :.w !xargs -I _ docker run --rm soimort/translate-shell --theme none _ <CR>
nnoremap <leader>tb :.w !xargs -I _ docker run --rm soimort/translate-shell -b _ <CR>

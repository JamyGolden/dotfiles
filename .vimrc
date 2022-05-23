" -----
" Setup
" -----
if has('nvim')
  let s:cachedir = $HOME."/.cache/nvim"
else
  let s:cachedir = $HOME."/.cache/vim"
endif

if !isdirectory(s:cachedir)
  call mkdir(s:cachedir, "", 0770)
endif
if !isdirectory(s:cachedir."/backup")
  call mkdir(s:cachedir."/backup", "", 0770)
endif
if !isdirectory(s:cachedir."/swp")
  call mkdir(s:cachedir."/swp", "", 0770)
endif
if !isdirectory(s:cachedir."/undodir")
  call mkdir(s:cachedir."/undodir", "", 0770)
endif

if !exists('g:os_env')
  if has('win64') || has('win32') || has('win16')
    let g:os_env = 'WINDOWS'
  else
    let g:os_env = toupper(substitute(system('uname'), '\n', '', ''))
  endif
endif


" -------
" General
" -------
set modifiable 
set shell=/bin/bash
set fileencoding=utf-8

set scrolloff=8

set linebreak " Break lines at word (requires Wrap lines)
set showbreak=+++ " Wrap-broken line prefix
set textwidth=72 " Line wrap (number of cols)
set colorcolumn=72,120 " Set column marker
set showmatch " Highlight matching brace
set visualbell " Use visual bell (no beeping)
set cursorline " Highlight current line
set hlsearch " Highlight all search results
set smartcase " Enable smart-case search
set ignorecase " Always case-insensitive
set backupcopy=yes
set ttyfast

if g:os_env !~ 'DARWIN'
  language en_GB.utf8
endif

if !has('nvim')
  set mouse=
  set ttymouse=
endif


" --------
" Advanced
" --------
set ruler " Show row and column ruler information
set number " line numbers and distances
set undolevels=1000 " Number of undo levels
set undofile
set suffixesadd+=.js " auto-append .js to files

filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Double slash tells vim to store absolute paths to avoid conflicts
let &undodir=s:cachedir.'/undodir//' " Persistent undo
let &directory=s:cachedir.'/swp//' " swp file tmp storage
let &backupdir=s:cachedir.'/backup//' " backup file tmp storage

" COC
let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-eslint',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-stylelintplus',
  \ 'coc-tsserver',
\ ]
autocmd CursorHold * silent call CocActionAsync('highlight')

" FZF
let g:fzf_history_dir = s:cachedir.'/fzf-history'

" Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" closetag
let g:closetag_filenames = '*.html,*.js,*.jsx,*.ts,*.tsx,*.css'
let g:closetag_emptyTags_caseSensitive = 1

" IndentLine
let g:indentLine_char = '¦'

" tmux
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 2


" -----------
" Vim Plugged
" -----------
if has('nvim')
  if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
else
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
endif

" Specify a directory for plugins
if has('nvim')
  call plug#begin('~/.local/share/nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'tpope/vim-sensible' " Defaults
Plug 'tpope/vim-sleuth' " Buffer defaults
Plug 'tpope/vim-surround' " Keyboard shortcuts
Plug 'pangloss/vim-javascript' " js/ts
Plug 'leafgarland/typescript-vim' " js/ts
Plug 'peitalin/vim-jsx-typescript' " js/ts
Plug 'maxmellon/vim-jsx-pretty' " js/ts
Plug 'jparise/vim-graphql' " GraphQL syntax
Plug 'tpope/vim-vinegar' " Feature: file manager
Plug 'tpope/vim-repeat' " Update repeat '.' functionality
Plug 'junegunn/fzf.vim' " Fuzzy Find vim plugin
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } } " Install fzf system executable
Plug 'chriskempson/base16-vim' " Theme provider
Plug 'tpope/vim-fugitive' " Git integration
Plug 'mhinz/vim-signify' " Git gutter
Plug 'editorconfig/editorconfig-vim' " Editorconfig defaults
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-commentary' " Code comment support
Plug 'suy/vim-context-commentstring' " Code comment support
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Async completion
Plug 'Yggdroot/indentLine'
Plug 'christoomey/vim-tmux-navigator'
Plug 'stephenway/postcss.vim' " postcss syntax support

call plug#end() " Initialize plugin system


" ------------
" Theme config
" ------------

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif


" ------------------
" Functions
" ------------------
"  Swap splits
function! MarkWindowSwap()
  let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
  "Mark destination
  let curNum = winnr()
  let curBuf = bufnr( "%" )
  exe g:markedWinNum . "wincmd w"
  "Switch to source and shuffle dest->source
  let markedBuf = bufnr( "%" )
  "Hide and open so that we aren't prompted and keep history
  exe 'hide buf' curBuf
  "Switch to dest and shuffle source->dest
  exe curNum . "wincmd w"
  "Hide and open so that we aren't prompted and keep history
  exe 'hide buf' markedBuf 
endfunction

" Show coc variable type
function! s:ShowDocumentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" ------------
" statusline
" ------------
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 


" ------------------
" Autocommand Groups
" ------------------
"Open quickfix window
augroup QuickFixAutoload
  autocmd!
  autocmd QuickFixCmdPost [^l]* nested botright cwindow
  autocmd QuickFixCmdPost    l* nested botright lwindow
augroup END

" ------------------
" Keyboard shortcuts
" ------------------
let mapleader="\<Space>"
nnoremap <Space> <Nop>

nmap <silent> <Leader>n <Plug>(coc-diagnostic-next)
nmap <silent> <Leader>N <Plug>(coc-diagnostic-prev)

vnoremap <Leader>y "+y
nnoremap <Leader>y "+y
nnoremap <Leader>Y gg"+yG
nnoremap <Leader>qn :cnext<CR>
nnoremap <Leader>qN :cprev<CR>
vnoremap <Leader>p "_dP
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" fzf related
nnoremap <Leader>k :GFiles<CR>
nnoremap <Leader>F :Rg<CR>
nnoremap <Leader>ff :Rg<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fl :Lines<CR>

" tmux related
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

" nnoremap <Leader>u :UndotreeToggle<CR>
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bN :bprevious<CR>
nnoremap <Silent> <Leader>mw :call MarkWindowSwap()<CR>
nnoremap <Silent> <Leader>pw :call DoWindowSwap()<CR>

nnoremap <Leader>aa :lua require("harpoon.mark").add_file()<CR>
nnoremap <Leader>af :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <Leader>an :lua require("harpoon.ui").nav_next()<CR>
nnoremap <Leader>aN :lua require("harpoon.ui").nav_prev()<CR>

" GoTo code navigation.
nmap <Silent> gd <Plug>(coc-definition)
nmap <Silent> gy <Plug>(coc-type-definition)
nmap <Silent> gi <Plug>(coc-implementation)
nmap <Silent> gr <Plug>(coc-references)
" nmap <Silent> gn <Plug>(coc-float-jump)

" Use K to show documentation in preview window
nnoremap <silent> <Leader>m :call <SID>ShowDocumentation()<CR>

" Install and update vim Plug
if has('nvim')
  nnoremap <Silent> <Leader>1 : source ~/ .config/nvim/init.vim \| :PlugInstall<CR>
  nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
else
  nnoremap <Silent> <Leader>1 : source ~/ .vimrc \| :PlugInstall<CR>
  nnoremap <Leader><CR> :so ~/.vimrc<CR>
endif


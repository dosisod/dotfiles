"to install vim-plug, follow instructions at https://github.com/junegunn/vim-plug/wiki/tutorial
call plug#begin('~/.cache/vim/')

Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.config/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'tpope/vim-surround'
Plug 'morhetz/gruvbox'
Plug 'dosisod/vim-skull'

call plug#end()

"make using Plug easier
command! PI PlugInstall
command! PC PlugClean
command! PU PlugUpdate

syntax on

set background=dark
colorscheme gruvbox
set tgc

"gitgutter settings
set updatetime=100
hi GruvBoxRedSign guifg=#fb4934 guibg=bg
hi GruvBoxAquaSign guifg=#8ec07c guibg=bg
hi GruvBoxGreenSign guifg=#b8bb26 guibg=bg
hi SignColumn guibg=bg
hi CursorLineNr guibg=bg
nmap <leader>j :GitGutterNextHunk<CR>
nmap <leader>k :GitGutterPrevHunk<CR>

nnoremap <SPACE> :GFiles<CR>
nnoremap <C-SPACE> :FZF<CR>

let g:fzf_preview_window = ''

au BufNewFile,BufRead *.pyi set syntax=python
au BufNewFile,BufRead *.sk set syntax=skull

au TermOpen * setlocal nonumber norelativenumber

"setup splits
set splitbelow
set splitright

"sane defaults
set nowrap
set number relativenumber
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set showcmd
set wildmenu
set scrolloff=2
set sidescrolloff=2
set lazyredraw
set ignorecase
set smartcase
set dir=~/.cache/swp/
set undofile
set undodir=/tmp
filetype plugin indent off "disable tab options set by plugins

"add clipboard capabilities if available
if has('unnamedplus')
	set clipboard=unnamed,unnamedplus
endif

set mousemodel=extend
set mouse=a

"added possible paths for `gf` command
set path=,./,/usr/include/

"changes search functionality/colors
set incsearch
set hlsearch
set gdefault

"whitespace highlighters
hi NoWhitespace term=standout cterm=standout ctermfg=196 ctermbg=234
hi SpecialKey term=bold ctermfg=237
match noWhitespace '\s\+$'
set listchars=tab:→\ 
set fillchars=vert:│,eob:\ 
set list

set cursorline
set guicursor=

"ALT UP and ALT DOWN to switch up and down buffers
map <M-UP> :bp<CR>
map! <M-UP> <ESC>:bp<CR>a
map <M-DOWN> :bn<CR>
map! <M-DOWN> <ESC>:bn<CR>a

"open nvimrc/bashrc from inside vim
command! V sp ~/.config/nvim/init.vim
command! B sp ~/.bashrc

"auto block creation
inoremap {<CR> {<CR><TAB><END><CR><BS>}<ESC>kI
inoremap (<CR> (<CR><TAB><END><CR><BS>)<ESC>kI

"below copied from:
"https://vim.fandom.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
"https://github.com/maralla/completor.vim
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

"makes quiting easier
command! WQ wq
command! Wq wq
command! W w

"switch between buffers easily
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

tnoremap <ESC> <C-\><C-N>
tnoremap <C-J> <C-W>j
tnoremap <C-K> <C-W>k
tnoremap <C-L> <C-W>l
tnoremap <C-H> <C-W>h

tnoremap <C-H> <C-\><C-N><C-W>h
tnoremap <C-J> <C-\><C-N><C-W>j
tnoremap <C-K> <C-\><C-N><C-W>k
tnoremap <C-L> <C-\><C-N><C-W>l

nnoremap <silent> <C-S-LEFT> <C-W><
nnoremap <silent> <C-S-RIGHT> <C-W>>
nnoremap <silent> <C-S-UP> <C-W>+
nnoremap <silent> <C-S-DOWN> <C-W>-

"hitting K instead of k is annoying
map K k
map Q q
imap <F1> <nop>
nmap <F1> <nop>

"makes sourcing vimrc easier
command! S source ~/.config/nvim/init.vim

command! S4 set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
command! S2 set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

"bad habbits
map <up> :qa!<CR>
map <down> :qa!<CR>
map <left> :qa!<CR>
map <right> :qa!<CR>
imap <up> <ESC>:qa!<CR>
imap <down> <ESC>:qa!<CR>
imap <left> <ESC>:qa!<CR>
imap <right> <ESC>:qa!<CR>

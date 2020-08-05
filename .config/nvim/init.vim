"to install vim-plug, follow instructions at https://github.com/junegunn/vim-plug/wiki/tutorial
call plug#begin('~/.cache/vim/')

Plug 'crusoexia/vim-monokai'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.config/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'chriskempson/base16-vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'embear/vim-localvimrc'
Plug 'tpope/vim-surround'
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'

call plug#end()

"make using Plug easier
command! PI PlugInstall
command! PC PlugClean
command! PU PlugUpdate

syntax on

set background=dark
colorscheme gruvbox

"colorscheme monokai
"let g:monokai_term_italic = 0

"set background=light
"colorscheme PaperColor

"enable when using base16 fonts
"let base16colorspace=16

set updatetime=100

nnoremap <SPACE> :FZF<CR>
inoremap <C-@> <C-N><C-N>

autocmd BufNewFile,BufRead *.ts set syntax=javascript
autocmd BufNewFile,BufRead *.pyi set syntax=python

"setup splits
set splitbelow
set splitright

"sane defaults
set nocompatible
set binary
set noeol
set nowrap
set number relativenumber
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set showcmd
set wildmenu
set scrolloff=2
set lazyredraw
set ignorecase
set smartcase
filetype plugin indent off "disable tab options set by plugins

"add clipboard capabilities if available
if has('unnamedplus')
	set clipboard=unnamed,unnamedplus
endif

"added possible paths for `gf` command
set path=.,templates/,static/,,
set suffixesadd=.py,.html,.js,.min.js

"changes search functionality/colors
set incsearch
set hlsearch

"whitespace highlighters
hi NoWhitespace term=standout cterm=standout ctermfg=196 ctermbg=234
hi SpecialKey term=bold ctermfg=237
match noWhitespace '\s\+$'
set listchars=tab:→\ 
set fillchars=vert:│
set list

set cursorline
set guicursor=

"using F1-9 keys switches buffers in all modes
"when switching in insert mode, you stay in insert mode
map <F1> :b1<CR>
map! <F1> <ESC>:b1<CR>a
map <F2> :b2<CR>
map! <F2> <ESC>:b2<CR>a
map <F3> :b3<CR>
map! <F3> <ESC>:b3<CR>a
map <F4> :b4<CR>
map! <F4> <ESC>:b4<CR>a
map <F5> :b5<CR>
map! <F5> <ESC>:b5<CR>a
map <F6> :b6<CR>
map! <F6> <ESC>:b6<CR>a
map <F7> :b7<CR>
map! <F7> <ESC>:b7<CR>a
map <F8> :b8<CR>
map! <F8> <ESC>:b8<CR>a
map <F9> :b9<CR>
map! <F9> <ESC>:b9<CR>a

"ALT LEFT and ALT RIGHT to move one tab left/right
map <M-LEFT> gT
map! <M-LEFT> <ESC>gTa
tmap <ESC>[1;3D <C-W>:tabp<CR>
map <M-RIGHT> gt
map! <M-RIGHT> <ESC>gta
tmap <ESC>[1;3C <C-W>:tabn<CR>

"ALT UP and ALT DOWN to switch up and down buffers
map <M-UP> :bp<CR>
map! <M-UP> <ESC>:bp<CR>a
map <M-DOWN> :bn<CR>
map! <M-DOWN> <ESC>:bn<CR>a

"open nvimrc/bashrc from inside vim
command! V sp ~/.config/nvim/init.vim
command! B sp ~/.bashrc

"used for jinja2 templates
inoremap {% {%%}<LEFT><LEFT><SPACE><LEFT><SPACE>
inoremap {{ {{}}<LEFT><LEFT><SPACE><LEFT><SPACE>

"auto block creation
inoremap {<CR> {<CR><TAB><END><CR><BS>}<ESC>kI
inoremap (<CR> (<CR><TAB><END><CR><BS>)<ESC>kI
inoremap [<CR> [<CR><TAB><END><CR><BS>]<ESC>kI

"auto close bracket
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"

iabbrev MM <<

"below copied from:
"https://vim.fandom.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
"https://github.com/maralla/completor.vim
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

"makes saving easier
"requires putting: "stty -ixon" into bashrc
imap <C-S> <ESC>:w<CR>a
map <C-S> :w<CR>

"makes quiting easier
command! WQ wq
command! Wq wq
command! W w

"allows for shift+home like capabilities
inoremap <A-HOME> <ESC>v<HOME>
map <A-HOME> v<HOME>
inoremap <A-END> <ESC>v<END>h
map <A-END> v<END>h

"enter works like J and backspace works like H, make them drop into insert mode instead
noremap <BS> i<BS>
noremap <expr> <CR> col(".") == col("$")-1 ? "o" : "i<CR>"

"hitting tab when in normal/command mode will insert a tab at the start of the line
noremap <TAB> I<TAB><ESC>
noremap <S-TAB> <<

"switch between buffers easily
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h
tnoremap <C-J> <C-W>j
tnoremap <C-K> <C-W>k
tnoremap <C-L> <C-W>l
tnoremap <C-H> <C-W>h

nnoremap <silent> <C-S-LEFT> <C-W><
nnoremap <silent> <C-S-RIGHT> <C-W>>
nnoremap <silent> <C-S-UP> <C-W>+
nnoremap <silent> <C-S-DOWN> <C-W>-
tnoremap <silent> <C-S-LEFT> <C-W><
tnoremap <silent> <C-S-RIGHT> <C-W>>
tnoremap <silent> <C-S-UP> <C-W>+
tnoremap <silent> <C-S-DOWN> <C-W>-

nnoremap `` :ter ++close ++curwin<CR>
tnoremap <ESC> <C-W>

"hitting K instead of k is annoying
map K k

"makes sourcing vimrc easier
command! S source ~/.config/nvim/init.vim

command! Spaces4 set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
command! Spaces2 set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

"hitting j/k at top and bottom of buffer goes to EOL or SOL
nnoremap <expr> j (line(".")==line("$")) ? "$" : "j"
inoremap <expr> <DOWN> (line(".")==line("$")) ? "<END>" : "<DOWN>"
nnoremap <expr> k (line(".")==1) ? "^" : "k"
inoremap <expr> <UP> (line(".")==1) ? "<HOME>" : "<UP>"

inoremap <expr> <LEFT> (col(".")==1) ? "<UP><END>" : "<LEFT>"
inoremap <expr> <RIGHT> (col(".")==col("$")) ? "<DOWN><HOME>" : "<RIGHT>"

"bad habbits
map <up> :qa!<CR>
map <down> :qa!<CR>
map <left> :qa!<CR>
map <right> :qa!<CR>
imap <up> <ESC>:qa!<CR>
imap <down> <ESC>:qa!<CR>
imap <left> <ESC>:qa!<CR>
imap <right> <ESC>:qa!<CR>
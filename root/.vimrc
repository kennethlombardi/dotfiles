set number
set relativenumber " use relative line numbers
set showcmd        " feedback showing <leader> key is pressed
set encoding=utf-8
set nocompatible   " disable vi compatibility as required by vundle
set laststatus=2
set autoread       " automatically prompt file for reload when changed outside of buffer
set background=dark
set t_Co=256
set cursorline
set tabstop=2 softtabstop=2 shiftwidth=2
set expandtab autoindent smarttab
set backspace=indent,eol,start " allow backspace when no text entered in insert session
set wildmenu
syntax enable
set scrolloff=5    " Try to keep at least 5 lines on the screen

let g:solarized_termcolors=256
let mapleader = "," " map <Leader> to ,

" Vundle
filetype off
call plug#begin('~/.vim/bundle')
Plug 'junegunn/fzf', { 'dir': '~/.vim/bundle/fzf', 'do': './install --all' }
Plug 'gmarik/vundle'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/localvimrc'
Plug 'Raimondi/delimitMate'
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.eruby'] }
Plug 'jelera/vim-javascript-syntax'
Plug 'roman/golden-ratio'
Plug 'junegunn/vim-easy-align'
Plug 'roman/golden-ratio'
Plug 'airblade/vim-gitgutter'
call plug#end()
filetype plugin indent on

colorscheme solarized

" NERDTree
nnoremap <silent> <c-d> :NERDTreeToggle<cr>
nnoremap <leader>t :NERDTreeFind<cr>

" FZF 
nnoremap <silent> <c-p> :FZF<cr>

"" Nop arrow keys
noremap <up> <nop>
noremap <right> <nop>
noremap <down> <nop>
noremap <left> <nop>
inoremap <up> <nop>
inoremap <right> <nop>
inoremap <down> <nop>
inoremap <left> <nop>

"" delimitMate
imap <C-c> <Esc>O

" airline
let g:airline_powerline_fonts=1
let g:airline_section_z=airline#section#create_right(["l/%L"])
let g:airline_theme="badwolf"

vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>

" Syntastic
nnoremap <leader>sc :SyntasticCheck<cr>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_html_tidy_ignore_errors = [" proprietary attribute \"ng-"]
let g:syntastic_scss_checkers=['']
let g:syntastic_eruby_ruby_quiet_messages = { "regex": "possibly useless use of a variable in void context" }
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'

" Search
:set hlsearch
:set incsearch

" Whitespace

"" List chars
set listchars=""
set listchars=tab:>>
set listchars+=trail:-
set listchars+=extends:>
set list

" Fugitive
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>ga :Gwrite<cr>
nnoremap <leader>gst :Gstatus<cr>
nnoremap <leader>gup :Gpull<space>--rebase<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gp :Gpush<cr>

" Vimdiff
if &diff
"  set cursorline
"  map ] ]c
"  map [ [c
"  hi DiffAdd    ctermfg=233 ctermbg=LightGreen guifg=#003300 guibg=#DDFFDD gui=none cterm=none
"  hi DiffChange ctermbg=white  guibg=#ececec gui=none   cterm=none
"  hi DiffText   ctermfg=233  ctermbg=yellow  guifg=#000033 guibg=#DDDDFF gui=none cterm=none
endif

" Search
" set nohlsearch  " don't highlight search matches
set incsearch  " incremental searching
set ignorecase " searches are case insensitive...
set smartcase  " ... unless they contain at least one capital letter

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

nmap <leader>= gaip=<cr>
vmap <leader>= gaip=<cr>

" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"""custom config

set guicursor=
set relativenumber "line numbers are relative to active line
"set number
set nu "shows line number on active number, replacing the default useless 0
syntax on

""tab stuff
set tabstop=8 softtabstop=0
set shiftwidth=4 
set smarttab
set autoindent
set smartindent
set expandtab

set nohlsearch "stops highlighting after searching
set hidden "something buffer something idk
set noswapfile "fok swap
set nobackup
set incsearch "highlights while searching
set scrolloff=8 "leaves 8 lines when reaching the bottom of a file
set noshowmode
set mouse=a
set ruler
set showcmd
set termguicolors

"""plugins
call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'LunarWatcher/auto-pairs'
Plug 'matze/vim-move'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'gosukiwi/vim-atom-dark'
call plug#end()

"au ColorScheme * hi Normal ctermbg=none guibg=none
"au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red

colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'
let g:airline_theme='base16_gruvbox_dark_hard'

colorscheme onehalfdark
let g:airline_theme='onehalfdark'

let g:airline_powerline_fonts = 1

"nerdtree config
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let NERDTreeShowHidden=1
autocmd VimEnter * NERDTree | wincmd p

"tab switching
nnoremap <leader>t :tabnew<CR>:NERDTree<CR><C-w><C-w>
nnoremap <F7> :tabp<CR>
nnoremap <F8> :tabn<CR>

"python run
autocmd FileType python map <buffer> <F9> :w<CR>:exec 'term python3' shellescape(@%, 1)<CR>i
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec 'term python3' shellescape(@%, 1)<CR>i

"cpp run
autocmd FileType cpp map <F9> :w <CR>:exec '!g++ %'<CR>:exec 'term ./a.out'<CR>:exec '!rm a.out'<CR>i 
autocmd FileType cpp imap <F9> <esc>:w <CR>:exec '!g++ %'<CR>:exec 'term ./a.out'<CR>:exec '!rm a.out'<CR>i

""schemes
"gruvbox
nnoremap <leader>1 :colorscheme gruvbox<CR>:let g:airline_theme='base16_gruvbox_dark_hard'<CR>
"onehalf
nnoremap <leader>2 :colorscheme onehalfdark<CR>:let g:airline_theme='onehalfdark'<CR>
"atom-dark
nnoremap <leader>3 :colorscheme atom-dark<CR>:let g:airline_theme='onehalfdark'<CR>

set nocompatible
filetype off

"Vundle setup
"Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

"NerdTree
Plugin 'https://github.com/scrooloose/nerdtree.git'

"Color schemes
Plugin 'jonathanfilip/vim-lucius'
Plugin 'nanotech/jellybeans.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'reedes/vim-colors-pencil'

"vim-airline
Plugin 'bling/vim-airline'

"All plugins must be added before following line
call vundle#end()

filetype plugin indent on
set laststatus=2
set t_Co=256
set encoding=utf-8

"vim-airline options
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='kalisi'


colorscheme lucius
LuciusLight

set guifont=Bitstream\ Vera\ Sans\ Mono\ 9

set nu 						"Line numbers
syntax on 					"Enable syntax higlighting
set autoread 					"Set to auto read when a file is changed from the outside
set autowrite 					"Set to auto write before changing buffers
set history=1000				"Set history value ( Default is 20 )
set clipboard=unnamedplus 			"Enable normal clipboard 
set ffs=unix 					"Set to save with UNIX line endings (LF)
set spell					"Enable spellchecking
set backupdir=/tmp 			"Set the swap file backup directory
set incsearch					"Increamental search
set hlsearch 					"Highlight search terms
set foldenable					"Auto fold code

set nowrap					"wrap long lines
set expandtab					"Tabs are now spaces, not tabs
set autoindent					"Indent at the same level as the previous line
set softtabstop=4               		" let backspace delete indent
let g:NERDTreeDirArrows=0
let NERDTreeChDirMode=2 			" Nerd tree auto refresh

:nnoremap <Tab> :bnext<CR>			"Easy buffer switching (next buffer)
:nnoremap <S-Tab> :bprevious<CR>		"Easy buffer switching (prev buffer)

set nospell


""----- Demu ---""
" Strip the newline from the end of a string
function! Chomp(str)
  return substitute(a:str, '\n$', '', '')
endfunction

" Find a file and pass it to cmd
function! DmenuOpen(cmd)
  let fname = Chomp(system("git ls-files | dmenu -i -l 20 -p " . a:cmd))
  if empty(fname)
    return
  endif
  execute a:cmd . " " . fname
endfunction


""----- Demu keybindsings ---""
map <c-t> :call DmenuOpen("tabe")<cr>
map <c-f> :call DmenuOpen("e")<cr>

"Exuberant ctags path
let Tlist_Ctags_Cmd='/usr/bin/ctags-exuberant'

let g:indentLine_color_gui = '#808080'

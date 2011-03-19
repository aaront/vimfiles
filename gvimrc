"let g:molokai_original = 1
set t_Co=256

" Change colorscheme
colorscheme molokai

" Turns on the tab bar always
" set showtabline=2

" Number of horizontal lines on the screen
" set lines=60

set bg=dark
if has("gui_running")
    "set fuoptions=maxvert,maxhorz
    "au GUIEnter * set fullscreen
endif

if &background == "dark"
    " hi normal guibg=black
endif

" GUI Option to remove the Toolbar (T)
set guioptions-=T

" Sets the font and size
set guifont=M+\ 1m\ regular:h15

""
" MacVim-specific Stuff
"

if has("gui_macvim")
	" Sets the percent transparency
	set transparency=5
endif
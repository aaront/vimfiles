""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Miv
"
"   Copyright 2009-2011 Aaron Toth

"   Licensed under the Apache License, Version 2.0 (the "License");
"   you may not use this file except in compliance with the License.
"   You may obtain a copy of the License at
"
"       http://www.apache.org/licenses/LICENSE-2.0
"
"   Unless required by applicable law or agreed to in writing, software
"   distributed under the License is distributed on an "AS IS" BASIS,
"   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
"   See the License for the specific language governing permissions and
"   limitations under the License.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Pathogen makes TextMate-like bundles work. See ~/.vim/bundles
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

set nocompatible
set modelines=0

" Unicode <3
set enc=utf-8

" Filetype Settings
filetype plugin on
filetype indent on

set wildmenu
set wildmode=list:longest
set cursorline

" Line Styles
set number              "Turn on line numbering
set nuw=6               "Give 6 digits room for the line numbering margin
set linespace=4         "Give some vertical space between lines
set wrap linebreak textwidth=0  "Softwrap lines at window border
set formatoptions=qrn1
"set rnu                 "Relative line numbers
if has('color_column')
	set colorcolumn=85
	hi clear ColorColumn
	hi ColorColumn ctermbg=black guibg=#222222
endif

" Tab-stop Widths
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Indentation
set autoindent          "Self-explanatory
set smartindent         "Intelligently indents the next line

" Window Settings
set ruler               "Show current positon in bottom-right corner
set list                "Show invisibles (newlines, tabs, etc)
set listchars=tab:▸\ ,eol:¬     "Use the same invisible characters as TextMate
set title               "Change the terminal's title
set visualbell          "Be quiet, beep!
set noerrorbells        "Be quiet, beep!
set spell               "No more spelling misteaks!

" Persistent Undo
if has('persistent_undo')
	set undodir=~/.vim/undodir      "Make sure this folder exists!
	set undofile
endif
set undolevels=1000     "Maximum number of changes that can be undone
set undoreload=10000    "Maximum number lines to save for undo on a buffer reload

" Searching
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

" Filesystem
"set autochdir           "Change working directory to current file's
set wildignore=*.swp,*.bak,*.pyc,*.class        "Ignore these files from tab-completion


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set the map button to ,
let mapleader=","

" Reformat Paragraphs
vmap Q gq
nmap Q gqap

" Exit out of highlight search mode
nmap <silent> ,/ :nohlsearch<CR>

nmap <silent> <D-≥> <C-_>

" Copy/Paste to System Clipboard
noremap y "*y
nnoremap yy "*yy
noremap Y "*Y
noremap d "*d
nnoremap dd "*dd
noremap D "*D
noremap p "*p
noremap P "*P

" Even shorter shortcut for Command-T
nmap <silent> <leader>, :CommandT<CR>

" No need to press shift to get :
nnoremap ; :

" Toggle invisible characters
nmap <leader>l :set list!<CR>

" Toggle taglist
nmap <leader>t :TlistToggle<CR>

" Shortcut for NERDTree
nmap <leader>n :NERDTree<CR> 

" Change to directory of file
nmap <silent> <leader>c :cd %:h<CR>

" ZoomWin Shortcut
nmap <leader>z <c-w>o

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Languages
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Python options
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
\ formatoptions+=croq softtabstop=4 smartindent
\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with

" Ruby options
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
\ colorcolumn=79

" Go options
autocmd BufNewFile,BufRead *.go setlocal ft=go
autocmd FileType go setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4

" PHP options
autocmd FileType php setlocal shiftwidth=4 tabstop=4 softtabstop=4

" JavaScript
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2
\ softtabstop=2 colorcolumn=79
let javascript_enable_domhtmlcss=1

" NerdTree
autocmd FileType nerdtree setlocal norelativenumber
autocmd FileType taglist setlocal norelativenumber

 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffer-type Customization
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" For LaTeX
let g:Tex_DefaultTargetFormat = 'pdf'
 
let g:Tex_CompileRule_dvi = 'latex --interaction=nonstopmode $*'
let g:Tex_CompileRule_ps = 'dvips -Pwww -o $*.ps $*.dvi'
let g:Tex_CompileRule_pspdf = 'ps2pdf $*.ps'
let g:Tex_CompileRule_dvipdf = 'dvipdfm $*.dvi'
let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 --interaction=nonstopmode $*'
 
let g:Tex_ViewRule_dvi = 'texniscope'
let g:Tex_ViewRule_ps = 'Preview'
let g:Tex_ViewRule_pdf = 'Skim'
 
let g:Tex_FormatDependency_ps  = 'dvi,ps'
let g:Tex_FormatDependency_pspdf = 'dvi,ps,pspdf'
let g:Tex_FormatDependency_dvipdf = 'dvi,dvipdf'
 
" let g:Tex_IgnoredWarnings ='
"       \"Underfull\n".
"       \"Overfull\n".
"       \"specifier changed to\n".
"       \"You have requested\n".
"       \"Missing number, treated as zero.\n".
"       \"There were undefined references\n".
"       \"Citation %.%# undefined\n".
"       \"\oval, \circle, or \line size unavailable\n"'

"let g:tex_flavor='latex'
"let g:Tex_DefaultTargetFormat = 'pdf'
"let g:Tex_ViewRule_pdf = 'open -a Preview.app'
"let g:Tex_UseMakefile = 1
let g:Imap_UsePlaceHolders = 0

" Configure whether to have tab-indent or soft tab-indent for different buffer
" types
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.html set expandtab
au BufRead,BufNewFile *.html set softtabstop=2
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab
au BufRead,BufNewFile *.php set expandtab
au BufRead,BufNewFile *.php set tabstop=2
au BufRead,BufNewFile *.php set shiftwidth=2
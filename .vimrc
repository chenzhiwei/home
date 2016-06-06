"Get out of VI's compatible mode..
set nocompatible

"I like using light background terminal
set background=light

"Sets how many lines of history VIM has to remember
set history=500

"Enable filetype plugin
filetype on
filetype plugin on
filetype indent on

"Set to auto read when a file is changed from the outside
set autoread

"Enable syntax hl
syntax on
syntax enable

"do not backup file
"set nobackup

"Highlight current
"set cursorline

"Turn on WiLd menu
"set wildmenu

"Always show current position
set ruler

"Show line number
set nu

"Set backspace
set backspace=eol,start,indent

"Bbackspace and cursor keys wrap to
set whichwrap+=<,>,h,l

set incsearch

"Set magic on
set magic

"show matching bracets
set showmatch

"How many tenths of a second to blink
set mat=4

"Highlight search things
set hlsearch

"Text options
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab
set lbr

"Auto indent
set ai

"Smart indent
set si

"C-style indenting
set cindent

"Wrap line
set wrap

"Chinese support
set encoding=utf-8
set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set ambiwidth=double

"Highlight trailing spaces/tabs
match ErrorMsg '\s\+$'

"Set the comment line DarkBlue
"highlight Comment ctermfg=DarkBlue

"Show C space errors
"Highligh trailing spaces/tabs in c language files
let c_space_errors=1

"Don't like q:
map q <Nop>

"When highlight words, don't jump to next
"nnoremap * *`` # This will cause screen flicker
nnoremap * :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

"Map :Q to :q, :W to :w
"cmap Q q
"cmap W w
cnoreabbrev Q <C-r>=(getcmdtype()==':'? 'q' : 'Q')<CR>
cnoreabbrev W <C-r>=(getcmdtype()==':'? 'w' : 'W')<CR>
cnoreabbrev Wq <C-r>=(getcmdtype()==':'? 'wq' : 'Wq')<CR>
cnoreabbrev WQ <C-r>=(getcmdtype()==':'? 'wq' : 'WQ')<CR>

"Map VIM command mode shortcut to bash shortcut
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-d> <Del>
cnoremap <C-k> <Nop>

"when paste a string contains `jk` will encounter error
"inoremap jk <ESC>

"Open/Close NERDTree
nmap <F7> :NERDTreeToggle<CR>

"C/C++ open/close TagbarToggle
nmap <F8> :TagbarToggle<CR>

"Tab switch
"inoremap <C-1> 1gt
"inoremap <C-2> 2gt

"when pasting from system clipboard, press F2 to set
"paste mode and after pasting pree F2 to set unpaste mode
"nnoremap <F2> :set invpaste paste?<CR>
"set pastetoggle=<F2>
"set showmode

"Pathogen support
silent! execute pathogen#infect()

"markdown disable folding
let g:vim_markdown_folding_disabled=1

"autocmd settings
if !exists("autocommands_loaded")
    let autocommands_loaded = 1

    "Strip trailing withspace
    fun! StripTrailingWhitespace()
        let l = line(".")
        let c = col(".")
        " if &ft =~ 'mkd'
        "     return
        " endif
        %s/\s\+$//e
        call cursor(l, c)
    endfun
    autocmd BufWritePre * call StripTrailingWhitespace()
    "autocmd BufWinLeave *.sh :![ -x % ] || chmod +x %
    autocmd BufNewFile,BufRead *.{htm,html} set sw=2 ts=2 sts=2
    autocmd BufNewFile,BufRead *.json if !exists("filetype")|set ft=javascript|endif
endif

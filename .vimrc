"{{{ Defaults I probably won't change... ever
set autoread
"set spell spelllang=en_us
"set updatetime=1000
"pathogen call stuff
execute pathogen#infect()
" best color scheme ever
colorscheme basicDark
set t_Co=256
" Make Vim more useful
set nocompatible
"text-width
set textwidth=82
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8
set encoding=utf-8
set binary
set eol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
"set directory=~/.vim/swaps
"I hate swap files
set noswapfile
if exists("&undodir")
    set undodir=~/.vim/undo
endif
" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
"set visualbell
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Highlight current line
set cursorline
" Show the (partial) command as it’s being typed
set showcmd
" Enable syntax highlighting
syntax on
"set max highlight column
set synmaxcol=80
" Start scrolling five lines before the horizontal window border when will this
" break
set scrolloff=5
set nowrap sidescrolloff=15
" sensible completion
set completeopt=longest,menuone
set ofu=syntaxcomplete#Complete
"fugitive statusline
set statusline=%{fugitive#statusline()}
" Show “invisible” characters
set lcs=tab:⟩\ ,trail:·,eol:↩,nbsp:_
set list
" Enable line numbers
set relativenumber
" Change mapleader
let mapleader=","
let localleader="\\"
"}}}
"{{{ Make tabs as wide as four spaces
set tabstop=4
set smartindent
set shiftwidth=4
"tabs to spaces
set expandtab
"}}}
"{{{ put splits in a logical place
set splitbelow
set splitright
" }}}
"{{{ Strip trailing whitespace (,ss)
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
"}}}
"{{{ Automatic commands
if has("autocmd")
    " Enable file type detection
    filetype on
    " Treat .json files as .js
    au BufRead,BufNewFile *.scss set filetype=css
    au BufNewFile,BufRead *.json setfiletype json syntax=javascript
    " use 2 spaces  for css and related files
    au Bufenter *.scss set tabstop=2
    au Bufenter *.css set tabstop=2
    au Bufenter *.scss set shiftwidth=2
    au Bufenter *.css set shiftwidth=2
    " automattically add semicolons in css
    au Bufenter *.scss ino : :;<esc>i
    au Bufenter *.css ino : :;<esc>i
    " save on focus lost
    au FocusLost * :silent! wall
    " leave insert mode on focus lost
    au FocusLost * call feedkeys("\<ESC>")
    " open nerdtree when vim opens
    au Bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
    au vimenter * if !argc() | NERDTree | endif
    " fold method marker for vimrc and zshrc
    au Bufenter .vimrc set foldmethod=marker
    au Bufenter *.zsh set foldmethod=marker
    " always reload files when changed outside vim
    au CursorHold,CursorMovedI,CursorMoved,Bufenter * :checktime
    " use absolute line numbering in insert mode and relative numbers elsewhere
    au InsertEnter * :set nu
    au InsertLeave * :set rnu

endif
"}}}
"{{{ kill arrow keys
no <down> <C-d>zz
no <left> <Nop>
ino <left> <Nop>
no <up> <C-u>zz
no <right> <Nop>
ino <right> <Nop>
ino <down> <Nop>
ino <up> <Nop>
vno <left> <Nop>
vno <down> <C-d>zz
vno <right> <Nop>
vno <up> <C-u>zz
"}}}
"{{{ remap escape for easier access
nno ` <ESC>
vno ` <ESC>
ino ` <ESC>
"}}}
"{{{Saving and closing
"control whitespace and tabs on save
nno <silent><leader>ss :%retab<CR>:call StripWhitespace()<CR>:w<CR>
ino <silent><leader>ss <ESC>:%retab<CR>:call StripWhitespace()<CR>:w<CR>
vno <silent><leader>ss <ESC>:%retab<CR>:call StripWhitespace()<CR>:w<CR>
"don't retab. usefull for some filetypes
nno <silent><leader><leader>ss :call StripWhitespace()<CR>:w<CR>
ino <silent><leader><leader>ss :call StripWhitespace()<CR>:w<CR>
vno <silent><leader><leader>ss :call StripWhitespace()<CR>:w<CR>
"save and close
nno <silent><leader>ww :%retab<CR>:call StripWhitespace()<CR>:w<CR>:close<CR>
ino <silent><leader>ww <ESC>:%retab<CR>:call StripWhitespace()<CR>:w<CR>:close<CR>
vno <silent><leader>ww <ESC>:%retab<CR>:call StripWhitespace()<CR>:w<CR>:close<CR>
"close but don't save
nno <leader>cl <ESC>:close!
ino <leader>cl <ESC>:close!
vno <leader>cl <ESC>:close!
"save and quit
nno <silent><leader>wq :call StripWhitespace()<cr>:wall<cr>:qall<CR>
ino <silent><leader>wq <ESC>:call StripWhitespace()<cr>:wall<cr>:qall<CR>
vno <silent><leader>wq <ESC>:call StripWhitespace()<cr>:wall<cr>:qall<CR>

"ruthelessly kill vim without a care in the world for what breaks
" quit without saving
nno <leader>\ :q!
ino <leader>\ <ESC>:q!
vno <leader>\ <ESC>:q!
"stay in or enter insert mode after current character on save
ino <C-s> <ESC>:call StripWhitespace()<CR>:w<CR>a
vno <C-s> <ESC>:call StripWhitespace()<CR>:w<CR>a
nno <C-s> <ESC>:call StripWhitespace()<CR>:w<CR>a

nno <C-w> :close<CR>
nno <C-q> :q<CR>
" }}}
"{{{always center when navigating
no j jzz
no k kzz
no G Gzz
no n nzz
no N Nzz
no { {zz
no ( (zz
no } }zz
no ) )zz
no n nzz
no N Nzz
"}}}
"{{{window navigation & and splits
no <C-l> <C-w>l
no <C-j> <C-w>j
no <C-h> <C-w>h
no <C-k> <C-w>k
ino <C-l> <ESC><C-w>li
ino <C-j> <ESC><C-w>ji
ino <C-h> <ESC><C-w>hi
ino <C-k> <ESC><C-w>ki

"splitting
no <leader>sn <ESC>:new<CR>
no <leader>sv <ESC>:vnew<CR>
"window stuff
set equalalways
no <localleader>= <C-w>=
"}}}
"{{{jump to ...
no <S-l> $
no <S-j> Gzz
no <S-h> ^
no <S-k> ggzz
"}}}
"{{{line numbering
no <silent> <leader>nn :set nonumber<CR>
no <silent> <leader>an :set number<CR>
no <silent> <leader>rn :set relativenumber!<CR>
"}}}
"{{{ folding
"{{{Open folds on enter
nno <CR> za
nno <leader><CR> zO
"}}}
"{{{close all folds
nno <localleader><localleader><CR> <ESC>gg0vG$zC<ESC>
ino <localleader><localleader><CR> <ESC>gg0vG$zC<ESC>
vno <localleader><localleader><CR> <ESC>gg0vG$zC<ESC>
"}}}
"{{{open all folds
nno <leader><leader><CR> <ESC>zR<ESC>
ino <leader><leader><CR> <ESC>zR<ESC>
vno <leader><leader><CR> <ESC>zR<ESC>
"}}}
"folding options
set foldmethod=indent
set foldcolumn=2
"Close folds locally
nno <localleader><CR> zC
"}}}
"{{{ completion
ino <leader>f <C-x><C-i>
ino <leader>l <C-x><C-l>
ino <leader>o <C-x><C-o>
ino <leader>c <C-x><C-p>
"}}}
"{{{ find and replace with control f
noremap <C-F> :%s/find/replace/I
inoremap <C-F> <ESC>:%s/find/replace/I
vnoremap <C-F> <ESC>:%s/find/replace/it
" }}}
"{{{ indent guides
let g:indentguides_state = 0
function! IndentGuides()
    if g:indentguides_state
        let g:indentguides_state = 0
        2match None
    else
        let g:indentguides_state = 1
        execute '2match IndentGuides /\%(\_^\s*\)\@<=\%(\%'.(0*&sw+1).'v\|\%'.(1*&sw+1).'v\|\%'.(2*&sw+1).'v\|\%'.(3*&sw+1).'v\|\%'.(4*&sw+1).'v\|\%'.(5*&sw+1).'v\|\%'.(6*&sw+1).'v\|\%'.(7*&sw+1).'v\)\s/'
    endif
endfunction
nnoremap <silent> <leader>I :call IndentGuides()<CR>
"call IndentGuides()
"}}}
"{{{ Indenting
"bind \] to indent
nmap <localleader>] >>
vmap <localleader>] >gv
imap <localleader>] <C-O>>>
"bind \[ to outdent
nmap <localleader>[ <<
vmap <localleader>[ <gv
imap <localleader>[ <C-O><<
"}}}
"{{{file navigation shortcuts
nno <silent> <leader>ev :e ~/.vimrc<CR>
nno <silent> <leader>wr :cd ~/Sites/wordpress/wp-content/themes<CR>:NERDTreeToggle<CR>
nno <silent> <leader>git :cd ~/Gits<CR>:NERDTreeToggle<CR>
nno <silent> <leader>dt :cd ~/Desktop<CR>:NERDTreeToggle<CR>
no <leader>rl <ESC>:source ~/.vimrc<CR>
"}}}
"{{{wordpress wrap function in 'function_exists()' check
function! WpWrap()
    normal ^vf(hyOif(function_exists(',p'){`jo}
endfunction
nno <c-w><c-w> :call WpWrap()<CR>
"}}}
"{{{ Fix Line Endings
function! LineEndings()
    update
    e ++ff=dos
    setlocal ff=unix
    :w
endfunction
nno <silent><leader>le :call LineEndings()<CR>
"}}}
"{{{ Make vim work logically
" Don't move on *
nnoremap * *<c-o>
"don't enter insert mode when adding blank lines
no <leader>b o<ESC>
no <leader>B O<ESC>
"paste in insert mode
ino <leader>p <ESC>pa
"don't enter insert mode when cutting lines
nno cc cc<ESC>
vno cc cc<ESC>
" delete till the end of the line
no D d$
no <leader>D d0
ino <leader>D <esc>d0xi
no dw df<space>
"}}}
"{{{ Formatting, TextMate-style
nno Q gqip
vno Q gq
" Reformat line.
nno Ql gqq
"}}}
"{{{ switch colorschemes
nno <silent> <localleader><leader>l :colorscheme basicLight<CR>
nno <silent> <localleader><leader>d :colorscheme basicDark<CR>
"}}}
"{{{ Convenience bindings
" Save a file as root ('W)
no <leader>W :w !sudo tee % > /dev/null<CR>
"delete blank lines
no <leader>db :g/^$/d<ESC>:let @/ = ""<CR>
"toggle nerdtree
no <silent><leader>nt <ESC>:NERDTreeToggle<CR>
"reformat
no <leader>rf <ESC>gg=G<ESC>:%retab<CR>
" select all
" ino <C-a> <ESC>gg0vG$
" no <C-a> <ESC>gg0vG$
"kill search hilighting
no <leader>sh <ESC>:noh<CR>
no <silent><leader><space> <ESC>:let @/ = ""<CR>
"bang last command
nno <Leader>! q:kWgea!<CR>
"uppercase words
ino <C-u> <esc>mzgUiwza
nno <C-u> <esc>mzgUiwza
" Toggle [i]nvisible characters
nno <silent><leader>i :set list!<cr>
" reset color scheme
nno U :syntax sync fromstart<cr>:redraw!<cr>
" make this_style into cammelCase
nno CC 0f_x~

ino <C-c> <ESC>I//
vno <C-c> I//

command Scratch new /dev/null/Scratch
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_c_compiler = 'clang'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
"}}}

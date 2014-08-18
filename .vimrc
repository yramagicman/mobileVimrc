"match pairs
ino ' ''<ESC>i
ino " ""<ESC>i
ino ( ()<ESC>i
ino { {}<ESC>i
ino [ []<ESC>i
ino [<CR> [<CR>]<ESC>O
ino (<CR> ()<ESC>a
ino {<CR> {<CR>}<ESC>O
vmap ' xi'<ESC>pa<ESC>'f'a
vmap " xi"<ESC>pa<ESC>"f"a
vmap { xi{<ESC>pa<ESC>la
vmap [ xi[<ESC>pa<ESC>la
vmap ( xi(<ESC>pa<ESC>la
" Automatic commands
if has("autocmd")
    " Enable file type detection
    filetype on
    "{{{ Treat .json files as .js
    au BufRead,BufNewFile *.scss set filetype=css
    au BufNewFile,BufRead *.json setfiletype json syntax=javascript
    "}}}
    "{{{ use 2 spaces  for css and related files
    au Bufenter *.scss set tabstop=2
    au Bufenter *.css set tabstop=2
    au Bufenter *.scss set shiftwidth=2
    au Bufenter *.css set shiftwidth=2
    "}}}
    "{{{ fix my fat fingers, change 90 to () in js
    au Bufenter *.js iabbr 90 ()
    au Bufleave *.js iabbr 90 90
    "}}}
    "{{{ automattically add semicolons in css
    au Bufenter *.scss ino : :;<ESC>i
    au Bufenter *.css ino : :;<ESC>i
    au Bufleave *.scss ino : :
    au Bufleave *.css ino : :
    "}}}
    "{{{ open nerdtree when vim opens
    "au Bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
    "au vimenter * if !argc() | NERDTree | endif
    "}}}
    "{{{ fold method marker for vimrc and zshrc
    au Bufenter,BufRead *.vim set foldmethod=marker
    au Bufenter *.zsh set foldmethod=marker
    "}}}
    "{{{ use absolute line numbering in insert mode and relative numbers elsewhere
    au InsertLeave * :set nonumber
    au InsertLeave * :set relativenumber
    au InsertEnter * :set number
    au InsertEnter * :set norelativenumber
    "}}}
    "{{{ tabs to spaces, four spaces per tab
    au Bufenter,BufRead * set tabstop=4
    au Bufenter,BufRead * set smartindent
    au Bufenter,BufRead * set shiftwidth=4
    au Bufenter,BufRead * set expandtab
    "}}}
    "{{{ drupal coding standards
    au Bufenter,BufRead */drupal*/* set tabstop=2
    au Bufenter,BufRead */drupal*/* set smartindent
    au Bufenter,BufRead */drupal*/* set shiftwidth=2
    au Bufenter,BufRead */drupal*/* set expandtab
    "au BufRead */drupal*/* call IndentGuides()
    "}}}
    "{{{ ratiochristi coding standards
    au Bufenter,BufRead */ratiochristi/* set tabstop=4
    au Bufenter,BufRead */ratiochristi/* set smartindent
    au Bufenter,BufRead */ratiochristi/* set shiftwidth=4
    au Bufenter,BufRead */ratiochristi/* set expandtab
    "}}}
    "{{{ Misc. individual commands that don't merrit their own fold group
    au BufEnter,BufRead mutt* set spell
    autocmd FileType make set noexpandtab
    autocmd BufNewFile,BufRead *.md set filetype=markdown
    " make vim edit cron again
    au BufEnter /private/tmp/crontab.* setl backupcopy=yes
    " always reload files when changed outside vim
    au CursorHold,CursorMovedI,CursorMoved,Bufenter * :checktime
    " save on focus lost
    au FocusLost * :silent! wall
    " leave insert mode on focus lost
    au FocusLost * call feedkeys("\<ESC>")
    " }}}
endif
"{{{ Defaults probably won't change... ever
set background=dark
noremap ; :
set autoread
set spelllang=en_us
"set updatetime=1000
"pathogen call stuff
"execute pathogen#infect()
" best color scheme ever
colorscheme darkblue
set t_Co=256
" Make Vim more useful
set nocompatible
"text-width
set textwidth=82
set cc=81
" Don't use os clipboard with tmux can't yank between buffers
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
" set gdefault
" Use UTF-8
set encoding=utf-8
set binary
set eol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups//
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
set synmaxcol=800
" Start scrolling five lines before the horizontal window border when will this
" break
set scrolloff=5
set nolist wrap linebreak sidescrolloff=15
" sensible completion
set completeopt=longest,menuone
set ofu=syntaxcomplete#Complete
" Show “invisible” characters
set lcs=tab:⟩\ ,trail:·,eol:↩,nbsp:_
"set list " breaks set linebreak
" Enable line numbers
set relativenumber
" Change mapleader
let mapleader=","
let localleader="/"
set tags=tags;
set autochdir
"}}}
"{{{ Make tabs as wide as four spaces
set tabstop=4
set smartindent
set shiftwidth=4
"tabs to spaces
set expandtab
"}}}
"{{{ set compiler
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_c_compiler = 'clang'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
"}}}
"{{{ set status line
" Always show status line
set laststatus=2
set statusline=\|\ %m%f%r\ \%y
set statusline+=%=
set statusline+=Line:
set statusline+=%4l/%-4L
set statusline+=\ Column\ %2c
set statusline+=\ \|
"}}}
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
"{{{ remap escape for easier access
nno <leader>m  <ESC>
vno <leader>m <ESC>
ino <leader>m <ESC>
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
" }}}
"{{{ Strip trailing whitespace
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
"}}}
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
"{{{ Fix Line Endings
function! LineEndings()
    update
    e ++ff=dos
    setlocal ff=unix
    :w
endfunction
nno <silent><leader>le :call LineEndings()<CR>
"}}}
"{{{wordpress wrap function in 'function_exists()' check
function! WpWrap()
    normal ^vf(hyOif(function_exists(',p'){`jo}
endfunction
nno <c-v><c-w> :call WpWrap()<CR>
"}}}
"{{{ create new tabs on <C-n> if no tabs exist
function TabBind()
    if tabpagenr('$') < 2
        tabnew
    else
        tabn
    endif
endfunction
nno <C-n> :call TabBind()<CR>
"}}}
"{{{ kill extra newlines
function Knl ()
    try
        %s#\($\n\s*\)\+\%$##
    catch
    endtry
endfunction
"}}}
"{{{ save, kill whitespace at end of lines, and end of file, convert tabs
function Save()
    syntax sync fromstart
    redraw!
    %retab
    call StripWhitespace()
    call Knl()
    w
endfunction
"}}}
"{{{ save, kill whitespace at end of lines, and end of file, don't convert tabs
function SaveNoRt()
    call StripWhitespace()
    call Knl()
    w
endfunction
"}}}
" {{{ Shortcut: F7 = Run anything with a shebang
" Source: http://superuser.com/a/21503/48014
if has("autocmd")
    au BufEnter * if match( getline(1) , '^\#!') == 0 |
    \ execute("let b:interpreter = getline(1)[2:]") |
    \endif
    fun! CallInterpreter()
        if exists("b:interpreter")
             exec ("!".b:interpreter." %")
        endif
    endfun
    nmap <Leader>R :call CallInterpreter()<CR>
endif
" }}}
"{{{ highlight repeated lines
function! HighlightRepeats() range
  let lineCounts = {}
  let lineNum = a:firstline
  while lineNum <= a:lastline
    let lineText = getline(lineNum)
    if lineText != ""
      let lineCounts[lineText] = (has_key(lineCounts, lineText) ? lineCounts[lineText] : 0) + 1
    endif
    let lineNum = lineNum + 1
  endwhile
  exe 'syn clear Repeat'
  for lineText in keys(lineCounts)
    if lineCounts[lineText] >= 2
      exe 'syn match Repeat "^' . escape(lineText, '".\^$*[]') . '$"'
    endif
  endfor
endfunction
command! -range=% HighlightRepeats <line1>,<line2>call HighlightRepeats()
nmap <silent><LocalLeader>r :HighlightRepeats<CR>
nmap <silent><LocalLeader>cr :syn clear Repeat<CR>
"}}}
"{{{line numbering
no <silent> <leader>nn :set nonumber<CR>
no <silent> <leader>an :set number<CR>
no <silent> <leader>rn :set relativenumber!<CR>
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
nno <silent> <leader>ev :e ~/.vim/config/<CR>
nno <silent> <leader>wr :cd ~/Sites/wordpress/wp-content/themes<CR>:Explore<CR>
nno <silent> <leader>git :cd ~/Gits<CR>:Explore<CR>
nno <silent> <leader>dt :cd ~/Desktop<CR>:Explore<CR>
no <leader>rl <ESC>:source ~/.vimrc<CR>
"}}}
"{{{ Make Vim work logically
" Don't move on *
nnoremap * *<c-o>
"paste in insert mode
ino <leader>p <ESC>pa
"don't enter insert mode when cutting lines
nno cc cc<ESC>
vno cc cc<ESC>
" delete till the beginning of a line
no <leader>D d0
ino <leader>D <ESC>d0xi
"}}}
"!{{{ Formatting, TextMate-style
nno Q gqip
vno Q gq
" Reformat line.
nno Ql gqq
"}}}
"{{{ Convenience bindings
" Save a file as root ('W)
no <leader>W :w !sudo tee % > /dev/null<CR>
"delete blank lines
no <localleader>db :g/^$/d<ESC>:let @/ = ""<CR>
" delete duplicate blank lines
no <leader>db :%!cat -s<CR>
" toggle word wrap
no <silent><leader>w <ESC>:set wrap!<CR>
ino <silent><leader>w <ESC>:set wrap!<CR>i
"toggle nerdtree
no <silent><leader>nt <ESC>:Explore<CR>
no <silent><leader>e <ESC>:Explore<CR>
"retab
no <leader>r <ESC>:%retab<CR>
"kill search highlighting
no <leader>sh <ESC>:noh<CR>
no <silent><leader><space> <ESC>:let @/ = ""<CR>
"uppercase words
ino <C-u> <ESC>mzgUiwza
nno <C-u> <ESC>mzgUiwza
" Toggle [i]nvisible characters
nno <silent><leader>i :set list!<CR>
" reset color scheme
nno U :syntax sync fromstart<CR>:redraw!<cr>
" make this_style into cammelCase
nno CC 0f_x~
ino <C-c> <ESC>I//
vno <C-c> I//
nno <leader>c :%!column -t<CR>
nno <leader>s :source %<CR>
"}}}
"{{{ spelling mappings
nno <C-s><C-s> :set spell!<CR>
nno <C-s>a zG
nno <C-s>n ]szo
nno <C-s>p [szo
nno <C-s>s z=
"}}}
"{{{ No... I don't want to record a macro now
"I never use replace mode anyway
nno R q
" there, now q won't do dumb stuff
nno q <NOP>
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
"{{{always center when navigating
no j gjzz
no k gkzz
no G Gzz
no { {zz
no ( (zz
no } }zz
no ) )zz
no n nzzzO
no N NzzzO
vno j jzz
vno k kzz
"}}}
"{{{jump to ...
no <S-l> $
no <S-j> Gzz
no <S-h> ^
no <S-k> ggzz
"}}}
no <tab> %
let @c = "/\/\/d"
let @f = "/function Äkbf{i,ss"
let @r = "/returnO,mjo,m"
let @e = "/^}aRÄkb,m"
let @z = "^vf(hyOif(function_exists(',p'){`jo}"
"{{{ Saving and closing
"control whitespace and tabs on save
nno <leader>ss :call Save()<CR>
ino <leader>ss <ESC>:call Save()<CR>
vno <leader>ss <ESC>:call Save()<CR>
"save but don't retab
nno <leader><leader>ss :call SaveNoRt()<CR>
ino <leader><leader>ss <ESC>:call SaveNoRt()<CR>
vno <leader><leader>ss <ESC>:call SaveNoRt()<CR>
"save and close
nno <silent><leader>ww :call Save()<CR>:close<CR>
ino <silent><leader>ww <ESC>:call Save()<CR>:close<CR>
vno <silent><leader>ww <ESC>:call Save()<CR>:close<CR>
"close but don't save
nno <leader>cl <ESC>:close!
ino <leader>cl <ESC>:close!
vno <leader>cl <ESC>:close!
"save and quit
nno <silent><leader>wq :call Save()<CR>:qall<CR>
ino <silent><leader>wq <ESC>:call Save()<CR>:qall<CR>
vno <silent><leader>wq <ESC>:call Save()<CR>:qall<CR>
"ruthelessly kill vim without a care in the world for what breaks
" quit without saving
nno <leader><ESC> :q!
ino <leader><ESC> <ESC>:q!
vno <leader><ESC> <ESC>:q!
""stay in or enter insert mode after current character on save
ino <C-s> <ESC>:call Save()<CR>a
vno <C-s> <ESC>:call Save()<CR>a
nno <C-s> <ESC>:call Save()<CR>a
nno <C-q> :q<CR>
nno <C-w> :close<CR>
nno <silent><leader>q :q<CR>
ino <silent><leader>q :q<CR>
vno <silent><leader>q :q<CR>
nno qq :wq
nno qw :wq
nno cl :close
ino q q
ino qq qq
" }}}
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
"{{{ put splits in a logical place
set splitbelow
set splitright
" }}}
"{{{
nno <C-t> :tabnew<CR>
nno <C-p> :tabp<CR>
no <S-right> <C-w>>
no <S-up> <C-w>+
no <S-left> <C-w><
no <S-down> <C-w>-
"}}}

" This file is automatically generated from the contents of
" https://github.com/yramagicman/dotfiles/tree/master/.vim/config


" Automatic commands
if has("autocmd")
    " Enable file type detection
    filetype on
    augroup general
        autocmd!
        " fold method marker for vimrc and zshrc
        autocmd FileType vim setlocal foldmethod=marker
        autocmd FileType zsh setlocal foldmethod=marker
        autocmd FileType lua setlocal foldmethod=marker
        " use absolute line numbering in insert mode and relative numbers elsewhere
        autocmd InsertLeave * :set nonumber
        autocmd InsertLeave * :set relativenumber
        autocmd InsertEnter * :set number
        autocmd InsertEnter * :set norelativenumber
    augroup end
    augroup js
        " Treat .json files as .js
        autocmd!
        autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
        " fix my fat fingers, change 90 to () in js
        autocmd Bufenter *.js iabbr 90 ()
        autocmd Bufleave *.js iabbr 90 90
    augroup end
    augroup css
        " filetype stuff
        autocmd!
        autocmd BufRead,BufNewFile *.scss set filetype=css
        autocmd BufRead,BufNewFile *.css set filetype=css
        " use 2 spaces  for css and related files
        autocmd FileType css setlocal tabstop=2
        autocmd FileType css setlocal shiftwidth=2
        " automattically add semicolons in css
        autocmd FileType css inoremap <buffer> : :;<ESC>i
    augroup end
    augroup coding
        autocmd!
        " drupal coding standards
        autocmd Bufenter,BufRead */drupal*/* set tabstop=2
        autocmd Bufenter,BufRead */drupal*/* set smartindent
        autocmd Bufenter,BufRead */drupal*/* set shiftwidth=2
        autocmd Bufenter,BufRead */drupal*/* set expandtab
        autocmd Bufenter,BufRead *.module set filetype=php
        autocmd Bufenter,BufRead *.inc set filetype=php
        autocmd Bufenter,BufRead *.install set filetype=php
        "autocmd BufRead */drupal*/* call IndentGuides()
        " ratiochristi coding standards
        autocmd Bufenter,BufRead */ratiochristi/* set tabstop=4
        autocmd Bufenter,BufRead */ratiochristi/* set smartindent
        autocmd Bufenter,BufRead */ratiochristi/* set shiftwidth=4
        autocmd Bufenter,BufRead */ratiochristi/* set expandtab
    augroup end
    augroup extra
        " Misc. individual commands that don't merrit their own fold group
        autocmd FileType mail set spell
        autocmd FileType make set noexpandtab
        autocmd FileType snippets set noexpandtab
        autocmd BufRead /usr/local/MERGE_MSG !ring
        autocmd BufNewFile,BufRead *.md set filetype=markdown
        " make vim edit cron again
        autocmd BufEnter /private/tmp/crontab.* setl backupcopy=yes
        " always reload files when changed outside vim
        autocmd CursorHold,CursorMovedI,CursorMoved,Bufenter * :checktime
        " save on focus lost
        autocmd FocusLost,BufLeave * :silent! wall
        " leave insert mode on focus lost
        autocmd FocusLost,BufLeave * call feedkeys("\<ESC>")
    augroup end
endif
" Defaults probably won't change... ever
set background=light
set autoread
set spelllang=en_us
" best color scheme ever
colorscheme default
set t_Co=256
" Make Vim more useful
set nocompatible
"text-width
set textwidth=82
set cc=0
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
set nonumber
set relativenumber
" Change mapleader
let mapleader=","
let localleader="/"
set tags=tags;
set autochdir
" Make tabs as wide as four spaces
set tabstop=4
set smartindent
set shiftwidth=4
"tabs to spaces
set expandtab
set lazyredraw
" set compiler
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_c_compiler = 'clang'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
" set status line
" Always show status line
set laststatus=2
set statusline=\|\ %m%f%r\ \%y
set statusline+=%=
set statusline+=Line:
set statusline+=%4l/%-4L
set statusline+=\ Column\ %2c
set statusline+=\ \|
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
" remap escape for easier access
nnoremap <leader>m  <ESC>
vnoremap <leader>m <ESC>
inoremap <leader>m <ESC>
" map colon to semi-colon. Life is just easier that way.
noremap ; :
" folding
"Open folds on enter
nnoremap <CR> za
nnoremap <leader><CR> zO
"close all folds
nnoremap <localleader><localleader><CR> <ESC>gg0vG$zC<ESC>
inoremap <localleader><localleader><CR> <ESC>gg0vG$zC<ESC>
vnoremap <localleader><localleader><CR> <ESC>gg0vG$zC<ESC>
"open all folds
nnoremap <leader><leader><CR> <ESC>zR<ESC>
inoremap <leader><leader><CR> <ESC>zR<ESC>
vnoremap <leader><leader><CR> <ESC>zR<ESC>
"folding options
set foldmethod=indent
set foldcolumn=1
"Close folds locally
nnoremap <localleader><CR> zC
" find and replace with control f
noremap <C-F> :%s/find/replace/I
inoremap <C-F> <ESC>:%s/find/replace/I
vnoremap <C-F> :s/find/replace/g
" Strip trailing whitespace
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
" indent guides
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
" Fix Line Endings
function! LineEndings()
    update
    e ++ff=dos
    setlocal ff=unix
    :w
endfunction
nnoremap <silent><leader>le :call LineEndings()<CR>
"wordpress wrap function! in 'function_exists()' check
function! WpWrap()
    normal ^vf(hyOif(function_exists(',p'){`jo}
endfunction
nnoremap <c-v><c-w> :call WpWrap()<CR>
" create new tabs on <C-n> if noremap tabs exist
function! TabBind()
    if tabpagenr('$') < 2
        tabnew
    else
        tabn
    endif
endfunction
nnoremap <C-n> :call TabBind()<CR>
" kill extra newlines
function! Knl ()
    try
        %s#\($\n\s*\)\+\%$##
    catch
    endtry
endfunction
" save, kill whitespace at end of lines, and end of file, convert tabs
function! Save()
    syntax sync fromstart
    redraw!
    %retab
    call StripWhitespace()
    call Knl()
    w
    call CheckErrorFn()
endfunction
" save, kill whitespace at end of lines, and end of file, don't convert tabs
function! SaveNoRt()
    call StripWhitespace()
    call Knl()
    w
    call CheckErrorFn()
endfunction
" Shortcut: <leader>R = Run anything with a shebang
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
" highlight repeated lines
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
" Check for :Error command so it can be run on save
function! CheckErrorFn()
    if exists(':Error')
        Error
    endif
endfunction
" presentation mode
let g:presmode = 1
function! PresMode()
    if  g:presmode == 0
        "normal opperation
        set relativenumber
        set nonumber
        autocmd!
        autocmd InsertLeave * :set nonumber
        autocmd InsertLeave * :set relativenumber
        autocmd InsertEnter * :set number
        autocmd InsertEnter * :set norelativenumber
        let g:presmode = 1
        return g:presmode
    else
        let g:presmode = 0
        "when people are watching
        set norelativenumber
        set number
        autocmd!
        autocmd InsertEnter * :set number
        autocmd InsertLeave * :set number
        autocmd InsertEnter * :set norelativenumber
        autocmd InsertLeave * :set norelativenumber
        return g:presmode
    endif
endfunction
noremap <leader>x :call PresMode()
" line numbers on or off
let g:numoff = 1
function! NumOff()
    if  g:numoff == 0
        "normal opperation
        set relativenumber
        set nonumber
        autocmd!
        autocmd InsertLeave * :set nonumber
        autocmd InsertLeave * :set relativenumber
        autocmd InsertEnter * :set number
        autocmd InsertEnter * :set norelativenumber
        let g:numoff = 1
        return g:numoff
    else
        echom g:numoff
        let g:numoff = 0
        "when people are watching
        set norelativenumber
        set nonumber
        autocmd!
        autocmd InsertEnter * :set nonumber
        autocmd InsertLeave * :set nonumber
        autocmd InsertEnter * :set norelativenumber
        autocmd InsertLeave * :set norelativenumber
        return g:numoff
    endif
endfunction
noremap <silent> <leader>nn :call NumOff()<CR>
noremap <silent> <leader>ns :call PresMode()<CR>
" get stuff off my screen
let g:clean = 1
function! CleanScreen()
    if  g:clean == 0
        let g:numoff = 0
        set laststatus=2
        call NumOff()
        let g:clean=1
        return g:clean
    else
        let g:numoff = 1
        set laststatus=0
        set showmode!
        call NumOff()
        let g:clean=0
        return g:clean
    endif
endfunction
"
" Indenting
"bind \] to indent
nnoremap <localleader>] >>
vnoremap <localleader>] >gv
inoremap <localleader>] <C-O>>>
"bind \[ to outdent
nnoremap <localleader>[ <<
vnoremap <localleader>[ <gv
inoremap <localleader>[ <C-O><<
"file navigation shortcuts
nnoremap <silent> <leader>ev :e ~/.vim/config/<CR>
noremap <leader>rl <ESC>:source ~/.vimrc<CR>
" Make Vim work logically
" Don't move on *
nnoremap * *<c-o>
"paste in insert mode
inoremap <leader>p <ESC>pa
"paste from x clipboard
nnoremap <leader><leader>p <ESC>"+p
inoremap <leader><leader>p <ESC>"+p
vnoremap <leader><leader>p <ESC>"+p
"don't enter insert mode when cutting lines
nnoremap cc cc<ESC>
vnoremap cc cc<ESC>
" delete till the beginning of a line
nnoremap <leader>D d0
inoremap <leader>D <ESC>d0xi
" Formatting, TextMate-style
nnoremap Q gqip
vnoremap Q gq
" Reformat line.
nnoremap Ql gqq
" Convenience bindings
" Save a file as root ('W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>
"delete blank lines
noremap <localleader>db :g/^$/d<ESC>:let @/ = ""<CR>
" delete duplicate blank lines
noremap <leader>db :%!cat -s<CR>
" toggle word wrap
noremap <silent><leader>w <ESC>:set wrap!<CR>
inoremap <silent><leader>w <ESC>:set wrap!<CR>i
"toggle file explorer
noremap <silent><leader>e <ESC>:Explore<CR>
"retab
noremap <leader>r <ESC>:%retab<CR>
"kill search highlighting
noremap <silent><leader><space> <ESC>:let @/ = ""<CR>
"uppercase words
inoremap <C-u> <ESC>mzgUiw
nnoremap <C-u> <ESC>mzgUiw
" Toggle [i]nvisible characters
nnoremap <silent><leader>i :set list!<CR>
" reset color scheme
nnoremap U :syntax sync fromstart<CR>:redraw!<CR>
" make this_style into cammelCase
nnoremap CC 0f_x~
inoremap <C-c> <ESC>I//
vnoremap <C-c> I//
nnoremap <leader>c :%!column -t<CR>
nnoremap <leader>s :source %<CR>
" spelling mappings
nnoremap <C-a>s :set spell!<CR>
nnoremap <C-a>a zG
nnoremap <C-a>n ]szo
nnoremap <C-a>p [szo
nnoremap <C-a>w z=
" No... I don't want to record a macro now
"I never use replace mode anyway
nnoremap R q
" there, now q won't do dumb stuff
nnoremap q <NOP>
"match pairs
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap { {}<ESC>i
inoremap [ []<ESC>i
inoremap [<CR> [<CR>]<ESC>O
inoremap (<CR> (<Cr>)<ESC>O
inoremap {<CR> {<CR>}<ESC>O
" If inserted quickly, don't reinsert matching character
inoremap () ()
inoremap [] []
inoremap {} {}
inoremap '' ''
inoremap "" ""
" This sequence (xi'...) surrounds a selected block in whatever character it's
" mapped to work with by copying and pasting the selected text inside the block
" and then appending the character at the end.
vnoremap ' xi'<ESC>pa<ESC>'f'a
vnoremap " xi"<ESC>pa<ESC>"f"a
" For some odd reason I don't need the closing character in these mappings. I
" guess the previous insert mode mappings take care of it, which is odd because
" that wasn't true with the single and double quote mappings
vnoremap { xi{<ESC>pa<ESC>la
vnoremap [ xi[<ESC>pa<ESC>la
vnoremap ( xi(<ESC>pa<ESC>la
augroup abbrevs
    autocmd!
    autocmd FileType mail iabbrev <buffer> api API
    autocmd FileType mail iabbrev <buffer> etap Etapestry
    autocmd FileType mail iabbrev <buffer> durpal Drupal
    autocmd FileType mail iabbrev <buffer> drupal Drupal
    autocmd FileType mail inoremap <buffer> ' '
    autocmd FileType html inoremap <buffer> <> <>
    autocmd FileType html inoremap <buffer> < <><ESC>i
    autocmd FileType html vnoremap <buffer> < xi<<ESC>pa<ESC>la
augroup end
" kill arrow keys
nnoremap <down> <C-d>zz
nnoremap <left> <Nop>
nnoremap <up> <C-u>zz
nnoremap <right> <Nop>
inoremap <right> <Nop>
inoremap <down> <Nop>
inoremap <left> <Nop>
inoremap <up> <Nop>
vnoremap <left> <Nop>
vnoremap <down> <C-d>zz
vnoremap <right> <Nop>
vnoremap <up> <C-u>zz
"always center when navigating
noremap j gjzz
noremap k gkzz
noremap G Gzz
noremap { {zz
noremap ( (zz
noremap } }zz
noremap ) )zz
noremap n nzzzO
noremap N NzzzO
vnoremap j jzz
vnoremap k kzz
"jump to ...
noremap <S-l> $
noremap <S-j> Gzz
noremap <S-h> ^
noremap <S-k> ggzz
nnoremap <tab> %
vnoremap <tab> %
let @c = "/\/\/d"
let @f = "/function Äkbf{i,ss"
let @r = "/returnO,mjo,m"
let @e = "/^}aRÄkb,m"
let @z = "^vf(hyOif(function_exists(',p'){`jo}"
" control whitespace and tabs on save
nnoremap <leader>ss :call Save()<CR>
inoremap <leader>ss <ESC>:call Save()<CR>
vnoremap <leader>ss <ESC>:call Save()<CR>
" save but don't retab
nnoremap <leader><leader>ss :call SaveNoRt()<CR>
inoremap <leader><leader>ss <ESC>:call SaveNoRt()<CR>
vnoremap <leader><leader>ss <ESC>:call SaveNoRt()<CR>
" save and close
nnoremap <silent><leader>ww :call Save()<CR>:close<CR>
inoremap <silent><leader>ww <ESC>:call Save()<CR>:close<CR>
vnoremap <silent><leader>ww <ESC>:call Save()<CR>:close<CR>
" close but don't save
nnoremap <leader>cl <ESC>:close!
inoremap <leader>cl <ESC>:close!
vnoremap <leader>cl <ESC>:close!
" save and quit
nnoremap <silent><leader>wq :call Save()<CR>:qall<CR>
inoremap <silent><leader>wq <ESC>:call Save()<CR>:qall<CR>
vnoremap <silent><leader>wq <ESC>:call Save()<CR>:qall<CR>
" quit without saving
nnoremap <leader>Q :q!
inoremap <leader>Q <ESC>:q!
vnoremap <leader>Q <ESC>:q!
" nice quit
nnoremap <silent><leader>q :q<CR>
inoremap <silent><leader>q :q<CR>
vnoremap <silent><leader>q :q<CR>
" sanity mappings
nnoremap qq :wq
nnoremap qw :wq
nnoremap cl :close<CR>
inoremap q q
inoremap qq qq
"window navigation & and splits
noremap <C-l> <C-w>l
noremap <C-j> <C-w>j
noremap <C-h> <C-w>h
noremap <C-k> <C-w>k
inoremap <C-l> <ESC><C-w>li
inoremap <C-j> <ESC><C-w>ji
inoremap <C-h> <ESC><C-w>hi
inoremap <C-k> <ESC><C-w>ki
"splitting
noremap <leader>sn <ESC>:new<CR>
noremap <leader>sv <ESC>:vnew<CR>
"window stuff
set equalalways
noremap <localleader>= <C-w>=
" put splits in a logical place
set splitbelow
set splitright
" tab mappings
nnoremap <C-t> :tabnew<CR>
nnoremap <C-p> :tabp<CR>
nnoremap <C-d> <C-w>>
nnoremap <C-w> <C-w>+
nnoremap <C-a> <C-w><
nnoremap <C-s> <C-w>-

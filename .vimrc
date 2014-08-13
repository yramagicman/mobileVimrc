if has("autocmd")
    filetype on
    au BufRead,BufNewFile *.scss set filetype=css
    au BufNewFile,BufRead *.json setfiletype json syntax=javascript
    au Bufenter *.scss set tabstop=2
    au Bufenter *.css set tabstop=2
    au Bufenter *.scss set shiftwidth=2
    au Bufenter *.css set shiftwidth=2
    au Bufenter *.js iabbr 90 ()
    au Bufleave *.js iabbr 90 90
    au Bufenter *.scss ino : :;<esc>i
    au Bufenter *.css ino : :;<esc>i
    au Bufleave *.scss ino : :
    au Bufleave *.css ino : :
    au FocusLost * :silent! wall
    au FocusLost * call feedkeys("\<ESC>")
    au Bufenter,BufRead *.vim set foldmethod=marker
    au Bufenter *.zsh set foldmethod=marker
    au CursorHold,CursorMovedI,CursorMoved,Bufenter * :checktime
    au InsertLeave * :set nonumber
    au InsertLeave * :set relativenumber
    au InsertEnter * :set number
    au InsertEnter * :set norelativenumber
    au BufEnter /private/tmp/crontab.* setl backupcopy=yes
    au Bufenter,BufRead * set tabstop=4
    au Bufenter,BufRead * set smartindent
    au Bufenter,BufRead * set shiftwidth=4
    au Bufenter,BufRead * set expandtab
    au Bufenter,BufRead */drupal-7.28/* set tabstop=2
    au Bufenter,BufRead */drupal-7.28/* set smartindent
    au Bufenter,BufRead */drupal-7.28/* set shiftwidth=2
    au Bufenter,BufRead */drupal-7.28/* set expandtab
    au BufRead */drupal-7.28/* call IndentGuides()
    au Bufenter,BufRead */ratiochristi/* set tabstop=4
    au Bufenter,BufRead */ratiochristi/* set smartindent
    au Bufenter,BufRead */ratiochristi/* set shiftwidth=4
    au Bufenter,BufRead */ratiochristi/* set expandtab
    au BufEnter,BufRead mutt* set spell
    autocmd FileType make set noexpandtab
    autocmd BufNewFile,BufRead *.md set filetype=markdown
endif
noremap ; :
set autoread
set spelllang=en_us
colorscheme darkblue
set t_Co=256
set nocompatible
set textwidth=82
set cc=81
set clipboard=unnamed
set wildmenu
set esckeys
set backspace=indent,eol,start
set ttyfast
set gdefault
set encoding=utf-8
set binary
set eol
set backupdir=~/.vim/backups//
set noswapfile
if exists("&undodir")
    set undodir=~/.vim/undo
endif
set modeline
set modelines=4
set exrc
set secure
set hlsearch
set ignorecase
set incsearch
set mouse=a
set nostartofline
set ruler
set shortmess=atI
set showmode
set title
set cursorline
set showcmd
syntax on
set synmaxcol=800
set scrolloff=5
set nolist wrap linebreak sidescrolloff=15
set completeopt=longest,menuone
set ofu=syntaxcomplete#Complete
set lcs=tab:⟩\ ,trail:·,eol:↩,nbsp:_
set relativenumber
let mapleader=","
let localleader="/"
set tags=tags;
set autochdir
set tabstop=4
set smartindent
set shiftwidth=4
set expandtab
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_c_compiler = 'clang'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
set laststatus=2
set statusline=\|\ %m%f%r\ \%y
set statusline+=%=
set statusline+=Line:
set statusline+=%4l/%-4L
set statusline+=Column\ %2c
set statusline+=\ \|
nno <leader>m  <ESC>
vno <leader>m <ESC>
ino <leader>m <ESC>
nno <CR> za
nno <leader><CR> zO
nno <localleader><localleader><CR> <ESC>gg0vG$zC<ESC>
ino <localleader><localleader><CR> <ESC>gg0vG$zC<ESC>
vno <localleader><localleader><CR> <ESC>gg0vG$zC<ESC>
nno <leader><leader><CR> <ESC>zR<ESC>
ino <leader><leader><CR> <ESC>zR<ESC>
vno <leader><leader><CR> <ESC>zR<ESC>
set foldmethod=indent
set foldcolumn=2
nno <localleader><CR> zC
ino <leader>f <C-x><C-i>
ino <leader>l <C-x><C-l>
ino <leader>o <C-x><C-o>
ino <leader>c <C-x><C-p>
noremap <C-F> :%s/find/replace/I
inoremap <C-F> <ESC>:%s/find/replace/I
vnoremap <C-F> <ESC>:%s/find/replace/it
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
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
function! LineEndings()
    update
    e ++ff=dos
    setlocal ff=unix
    :w
endfunction
nno <silent><leader>le :call LineEndings()<CR>
function! WpWrap()
    normal ^vf(hyOif(function_exists(',p'){`jo}
endfunction
nno <c-w><c-w> :call WpWrap()<CR>
function TabBind()
    if tabpagenr('$') < 2
        tabnew
    else
        tabn
    endif
endfunction
nno <C-n> :call TabBind()<CR>
function Knl ()
    try
        %s#\($\n\s*\)\+\%$##
    catch
    endtry
endfunction
function Save()
    %retab
    call StripWhitespace()
    call Knl()
    w
endfunction
function SaveNoRt()
    call StripWhitespace()
    call Knl()
    w
endfunction
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
no <silent> <leader>nn :set nonumber<CR>
no <silent> <leader>an :set number<CR>
no <silent> <leader>rn :set relativenumber!<CR>
nmap <localleader>] >>
vmap <localleader>] >gv
imap <localleader>] <C-O>>>
nmap <localleader>[ <<
vmap <localleader>[ <gv
imap <localleader>[ <C-O><<
nno <silent> <leader>ev :e ~/.vim/config/<CR>
nno <silent> <leader>wr :cd ~/Sites/wordpress/wp-content/themes<CR>:Explore<CR>
nno <silent> <leader>git :cd ~/Gits<CR>:Explore<CR>
nno <silent> <leader>dt :cd ~/Desktop<CR>:Explore<CR>
no <leader>rl <ESC>:source ~/.vimrc<CR>
nnoremap * *<c-o>
ino <leader>p <ESC>pa
nno cc cc<ESC>
vno cc cc<ESC>
no <leader>D d0
ino <leader>D <esc>d0xi
nno Q gqip
vno Q gq
nno Ql gqq
no <leader>W :w !sudo tee % > /dev/null<CR>
no <leader>db :g/^$/d<ESC>:let @/ = ""<CR>
no <silent><leader>w <ESC>:set wrap!<CR>
ino <silent><leader>w <ESC>:set wrap!<CR>i
no <silent><leader>nt <ESC>:Explore<CR>
no <silent><leader>e <ESC>:Explore<CR>
no <leader>r <ESC>:%retab<CR>
no <leader>sh <ESC>:noh<CR>
no <silent><leader><space> <ESC>:let @/ = ""<CR>
ino <C-u> <esc>mzgUiwza
nno <C-u> <esc>mzgUiwza
nno <silent><leader>i :set list!<cr>
nno U :syntax sync fromstart<cr>:redraw!<cr>
nno CC 0f_x~
ino <C-c> <ESC>I//
vno <C-c> I//
nno <leader>c :%!column -t<CR>
nno <leader>s :source %<CR>
nno <C-s><C-s> :set spell!<cr>
nno <C-s>a zG
nno <C-s>n ]szo
nno <C-s>p [szo
nno <C-s>s z=
nno R q
nno q <NOP>
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
no j gjzz
no k gkzz
no G Gzz
no { {zz
no ( (zz
no } }zz
no ) )zz
no n nzzzo
no N Nzzzo
vno j jzz
vno k kzz
no <S-l> $
no <S-j> Gzz
no <S-h> ^
no <S-k> ggzz
no <tab> %
nno <leader>ss :call Save()<CR>
ino <leader>ss <ESC>:call Save()<CR>
vno <leader>ss <ESC>:call Save()<CR>
nno <leader><leader>ss :call SaveNoRt()<CR>
ino <leader><leader>ss <ESC>:call SaveNoRt()<CR>
vno <leader><leader>ss <ESC>:call SaveNoRt()<CR>
nno <silent><leader>ww :call Save()<CR>:close<CR>
ino <silent><leader>ww <ESC>:call Save()<CR>:close<CR>
vno <silent><leader>ww <ESC>:call Save()<CR>:close<CR>
nno <leader>cl <ESC>:close!
ino <leader>cl <ESC>:close!
vno <leader>cl <ESC>:close!
nno <silent><leader>wq :call Save()<CR>:qall<CR>
ino <silent><leader>wq <ESC>:call Save()<CR>:qall<CR>
vno <silent><leader>wq <ESC>:call Save()<CR>:qall<CR>
nno <leader>\ :q!
ino <leader>\ <ESC>:q!
vno <leader>\ <ESC>:q!
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
no <C-l> <C-w>l
no <C-j> <C-w>j
no <C-h> <C-w>h
no <C-k> <C-w>k
ino <C-l> <ESC><C-w>li
ino <C-j> <ESC><C-w>ji
ino <C-h> <ESC><C-w>hi
ino <C-k> <ESC><C-w>ki
no <leader>sn <ESC>:new<CR>
no <leader>sv <ESC>:vnew<CR>
set equalalways
no <localleader>= <C-w>=
set splitbelow
set splitright
nno <C-t> :tabnew<CR>
nno <C-p> :tabp<CR>
no <S-right> <C-w>>
no <S-up> <C-w>+
no <S-left> <C-w><
no <S-down> <C-w>-

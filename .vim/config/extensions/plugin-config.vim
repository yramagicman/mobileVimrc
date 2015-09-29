"plugin-config.vim
"{{{ snippets and documentation
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetsDir = $HOME . "/.vim/snippets"
let g:UltiSnipsUsePythonVersion = 2
let g:pdv_template_dir = $HOME . "/.vim/bundle/pdv/templates"
nnoremap  --d :call pdv#DocumentCurrentLine()<CR>
"}}}
    "{{{ Ctrlp
let g:ctrlp_map='<c-p>'
let g:ctrlp_switch_buffer='ET'
""let g:ctrlp_by_filename=1
let g:ctrlp_show_hidden =1
let g:ctrlp_custom_ignore = { 'dir': '\v/(Library|Applications*|Pictures|Music|Movies|Gits|Projects|Public|VirtualBox*|.oh-my-zsh|Dropbox|Calibre*|.node-gyp|undo|bundle|.pip|.mutt)', 'file': '\v*\.(xcodeproj|tar|gz|pages|plist)$', 'link': '\v/(usrlocal)$'}
let g:ctrlp_max_files=7000
let g:ctrlp_max_depth=30
nnoremap <c-p> :CtrlP<CR>
nnoremap -ev :CtrlP ~/.vim/config<CR>
nnoremap <c-y> :CtrlPBufTagAll<CR>
"}}}
"{{{ syntastic
"@todo find a way to toggle this.
augroup syntastic
        autocmd Bufenter,BufRead */drupal*/* let g:syntastic_php_phpcs_args="--standard=Drupal --tab-width=0"
        autocmd Bufenter,BufRead */drupal*/* let g:syntastic_php_phpcs_disable=0
        autocmd BufLeave */drupal*/* let g:syntastic_php_phpcs_args="--tab-width=0"
        autocmd BufLeave */drupal*/* let g:syntastic_php_phpcs_disable=1
augroup end
"}}}
"{{{ supertab
    let g:SuperTabMappingForward = '<s-tab>'
    let g:SuperTabMappingBackward = '<tab>'
"}}}
"{{{ autocomplete
let g:neocomplcache_enable_at_startup  = 1
let g:neocomplcache_enable_auto_select = 0
let g:neocomplcache_enable_smart_case  = 1
let g:neocomplcache_min_syntax_length  = 3

if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
""if !exists('g:neocomplcache_force_omni_patterns')
""  let g:neocomplcache_force_omni_patterns = {}
""endif
let g:neocomplcache_omni_patterns.php =
\ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
""let g:neocomplcache_omni_patterns.c =
""\ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?'
""let g:neocomplcache_omni_patterns.cpp =
""\ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

augroup completetypes
    autocmd!
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end
"}}}
"{{{ Tag list config
nnoremap <c-t> :TlistOpen<CR>
nnoremap <c-n> :TlistAddFiles
""set statusline+=\ \%{Tlist_Get_Tagname_By_Line()}\ \|
let g:Tlist_Show_One_File=0
let g:Tlist_Close_On_Select=1
let g:Tlist_Compact_Format=1
let g:Tlist_Exit_OnlyWindow=1
augroup tagliststuff
    autocmd!
    autocmd FileType taglist vertical resize +15
augroup end
"}}}
"{{{ Gundo
noremap Z :GundoToggle<CR>
inoremap <leader>Z :GundoToggle<CR>
"}}}
"{{{ Filebeagle
let g:filebeagle_suppress_keymaps = 1
map <silent> +  <Plug>FileBeagleOpenCurrentWorkingDir
map <silent> =  <Plug>FileBeagleOpenCurrentBufferDir
"}}}
"autocmd! VimEnter * Minimap

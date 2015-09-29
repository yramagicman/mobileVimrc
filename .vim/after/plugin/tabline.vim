function! s:listofbuffers()
python << endpy
import vim
import os
bufs = []
for key in vim.buffers:
    loaded = int(vim.eval('buflisted("' + key.name + '")'))
    bufname = key.name.split('/')[-2:]
    if bufname[0] == 'jonathan':
        bufname[0] = '~'
    bufname = '/'.join(bufname)
    if key.name == vim.current.buffer.name:
        try:
            bufs.remove(bufname)
        except:
            pass
    elif loaded > 0:
        bufs.append(bufname)
    elif loaded == 0:
        try:
            bufs.remove(bufname)
        except:
            pass

indexes = []
pwd = os.getcwd().split('/')[-1]
for i in bufs:
    if pwd in i:
        indexes.append(bufs.index(i))
for i in indexes:
    bufs[i] = bufs[i].split('/')[-1]

vim.command('set showtabline=2')
vim.command('let g:mybuflist="' + '    '.join(bufs) + '"')
endpy
endfunction

function! MyTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    let bname = bufname(buflist[winnr - 1])
    let bnamel = split(bname, '/')
    if len(bnamel) > 2
        if bnamel[1] == 'jonathan'
            let bnamel[1] = '~'
        endif
        let bnames = bnamel[-2] .'/'. bnamel[-1]
    elseif len(bnamel) <= 2 && len(bnamel) != 0
    let bnames = bnamel[-1]
    else
        let bnames = '[No Name]'
    endif
    return bnames
endfunction

function! MyTabLine()
    let s = ''
    for i in range(tabpagenr('$'))
        " select the highlighting
        if i + 1 == tabpagenr()
          let s .= '%#TabLineSel#'
        else
          let s .= '%#TabLine#'
        endif

        " set the tab page number (for mouse clicks)
        let s .= '%' . (i + 1) . 'T'

        " the label is made by MyTabLabel()
        let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
    endfor

    " after the last tab fill with TabLineFill and reset tab page nr
    let s .= '%#TabLineFill#%T'

    " right-align the label to close the current tab page
    if tabpagenr('$') > 0
        let s .= '%=%#TabLine#'
    endif
    let s .= g:mybuflist
    return s
endfunction
call s:listofbuffers()
autocmd! BufEnter,BufDelete,BufUnload,BufWipeout,CursorHold * call s:listofbuffers()
set tabline=%!MyTabLine()

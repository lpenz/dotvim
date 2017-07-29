" Only load this indent file when no other was loaded yet.
if exists("b:did_indent")
    finish
endif

let b:did_indent = 1

" always use setlocal for indent expr
setlocal indentexpr=GetDotIndent()
setlocal indentkeys-=:,0#

" trim tcl comments
function! s:Trim(line)
    let retval = a:line
    let commentidx = match(retval,"//.*$")
    if commentidx >= 0
        let retval = strpart(retval,0,commentidx)
    endif
    return retval
endfun

" pare nested braces
function! s:Pare(line)
    let l:retval = a:line
    let l:pat = '{[^{]\{-}}'
    while (match(l:retval,l:pat)!=-1)
        " echo l:retval
        let l:retval = substitute(l:retval,l:pat,"","")
    endwhile
    " all done
    return l:retval
endfun


" simple version
function! GetDotIndent()
    " current (non-blank) line
    let lnum1 = v:lnum
    " seek previous (non-blank) line
    let lnum0 = prevnonblank(v:lnum - 1)
    " at the TOP? start with zero
    if lnum0 == 0
        return 0
    endif
    let ind = indent(lnum0)
    " get the line, trim trailing comments, pare nested braces
    let pline = s:Pare(s:Trim(getline(lnum0)))
    let line  = s:Pare(s:Trim(getline(lnum1)))
    " add for prev line that ends with open '{'
    if pline =~ '{\s*$'
        let ind = ind + &sw
    endif
    " subtract for current line that starts with open '}'
    if line =~ '^\s*}'
        let ind = ind - &sw
    endif
    " subtract for prev line that ends with open '}' AND does not also start with open '}'
    if pline =~ '}\s*$' && pline !~ '^\s*}'
        let ind = ind - &sw
    endif

    " error debuggery
    " echoerr v:lnum . " -> " . ind . " (" . lnum0 . "," . lnum1 . ")"
    return ind
endfun



setlocal makeprg=xrdb\ load\ %
autocmd BufWritePost .Xresources :silent !xrdb load %


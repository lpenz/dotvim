
setlocal makeprg=xrdb\ load\ %
autocmd Xresources BufWritePost .Xresources :silent !xrdb load %


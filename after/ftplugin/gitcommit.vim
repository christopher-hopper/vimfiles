
" Only do this when not done yet for this buffer
if (exists("b:did_after_ftplugin"))
  finish
endif

runtime! after/ftplugin/git.vim
let b:did_after_ftplugin = 1

setlocal ruler

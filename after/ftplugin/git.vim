
" Only do this when not done yet for this buffer
if (exists("b:did_after_ftplugin"))
  finish
endif
let b:did_after_ftplugin = 1

" Remove the status line and ruler
if has("statusline")
  setlocal laststatus=0
endif

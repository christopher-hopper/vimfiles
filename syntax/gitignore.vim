" Syntax definition                             *syntax*
" Language:         gitignore
" Maintainer:	    Christopher Hopper
" Location:         $VIMFILES/syntax/gitignore.vim

" Copied from the cfengine, ruby, and perl syntax files
" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif


" special identifiers.
syn keyword	gitignoreSpecial	!

" comments last overriding everything else
syn keyword	gitignoreTodofix	contained TODO NOTE FIXME XXX
syn match	gitignoreComment	"^#.*" contains=gitignoreTodofix
syn match	gitignoreComment	"\s*#.*"ms=s+1 contains=gitignoreTodofix

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_gitignore_syntax_init")
  if version < 508
    let did_gitignore_syntax_init = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink gitignoreComment		Comment
  HiLink gitignoreTodofix		Todo
  HiLink gitignoreSpecial		Special

  delcommand HiLink
endif

let b:current_syntax = 'gitignore'

" An example for a vimrc file.
" 
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
" 
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
    finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
    set nobackup		" do not keep a backup file, use versions instead
else
    set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Indentation settings
set expandtab       "Use softtabstop spaces instead of tab characters for indentation
set shiftwidth=4    "Indent by 4 spaces when using >>, <<, == etc.
set softtabstop=4   "Indent by 4 spaces when pressing <TAB>
set autoindent      "Keep indentation from previous line

" Set the default font
if has('gui_running')
    set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI
endif

if has('mouse') && has('gui_running')
    " Enable mouse by default for gVim only.
    set mouse=a
    " Turn-off Tear-off menus
    set guioptions-=t 
endif

" Only do this part when the terminal options enable support for more
" than two colors.
if &t_Co > 2 || has('gui_running')

    " Switch syntax highlighting on.
    syntax on

    " Highlight the last used search pattern.
    set hlsearch

    " Set the color scheme.
    " See $VIMRUNTIME/colors/*.vim for available color schemes.
    colorscheme torte

endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        au!

        " For all text files set 'textwidth' to 78 characters.
        autocmd FileType text setlocal textwidth=78

        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        " Also don't do it when the mark is in the first line, that is the default
        " position when opening a file.
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif

    augroup END

else

    set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif

" Change the cursor (shape, colour) in different modes
if &term =~ '^xterm'
    " Use a solid underscore cursor in insert mode
    let &t_SI = "\<Esc>[4 q"
    " Use a solid block cursor in insert mode
    let &t_SI = "\<Esc>[1 q"
    " 0 -> block blinking 
    " 1 -> block blinking 
    " 2 -> block solid
    " 3 -> underscore blinking 
    " 4 -> underscore solid 
endif

" *** Functions ***

" Highlight all instances of the word under the cursor, when idle.
" Map <F12> key to toggle Auto Highlighting.
nnoremap <f11> :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
    let @/ = ''
    if exists('#auto_highlight')
        au! auto_highlight
        augroup! auto_highlight
        setl updatetime=4000
        echo 'Highlight current word: disabled'
        return 0
    else
        augroup auto_highlight
            au!
            au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
        augroup end
        setl updatetime=800
        echo 'Highlight current word: enabled'
        return 1
    endif
endfunction

" Turn on Line Numbering with safe Visual line selection.
" Map <F12> to enable the mouse and turn on line numbering.
noremap <f12> :call ToggleNumber() <CR>
function! ToggleNumber()
    if &number
        set nonumber
        if has('mouse') && ! has('gui_running')
            " Turn off mouse
            set mouse=
        endif
        echo "Line numbering: disabled"
    else
        set number
        if has('mouse') && ! has('gui_running')
            " Turn on mouse so line numbers aren't selected
            set mouse=a
        endif
        echo "Line numbering: enabled"
    endif
endfunction

if has('win32')
    " Convert slashes to backslashes for Windows.
    nmap ,cs :let @*=substitute(expand("%"), "/", "\\", "g")<CR>
    nmap ,cl :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>

    " This will copy the path in 8.3 short format, for DOS and Windows 9x
    nmap ,c8 :let @*=substitute(expand("%:p:8"), "/", "\\", "g")<CR>
else
    nmap ,cs :let @*=expand("%")<CR>
    nmap ,cl :let @*=expand("%:p")<CR>
endif

if has("statusline")
    " useful status line
    "set statusline=%<%f\ %h%m%r%=%{\"[\".(&ff).\"]\ [\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P

    " git fugitive statusline
    "set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

    silent! call fugitive#statusline()
    if exists('*fugitive#statusline') 
        " useful git fugitive statusline
        set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%{\"[\".(&ff).\"]\ [\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
    endif

    " show statusline always
    set laststatus=2

    " turn off ruler
    set noruler
endif

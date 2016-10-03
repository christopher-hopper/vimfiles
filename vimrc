" An excellent PHP Web Application Developers vimrc file.
"
" Maintainer:   Christopher Hopper <christopherjfhopper[at]gmail[dot]com>
" Attribution:  Bram Moolenaar <Bramd[at]vim[dot]org>
" Source Code:  https://github.com/christopher-hopper/vimfiles
" Git Remote:   git@github.com:christopher-hopper/vimfiles.git
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

" Add bundled vim plug-ins to the runtime path.
execute pathogen#infect('bundle/{}')
execute pathogen#helptags()

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=1000
set nobackup		" do not keep a backup file
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Set the <leader> used in mappings.
let mapleader=","

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

" javascript-libraries-syntax - othree/javascript-libraries-syntax.vim
let g:used_javascript_libs = 'jquery,angularjs'

" Syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

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

" Got statusline? Make useful.
if has("statusline")
    " show statusline always
    set laststatus=2
    " turn off ruler
    set noruler
    " Most useful statusline.
    " Statusline: File name
    set statusline=%<%f\                          " File name
    set statusline+=%w%h%m%r                      " File options
    set statusline+=%{fugitive#statusline()}      " Fugitive Git information
    set statusline+=%#warningmsg#                 " Warning message colours
    set statusline+=%{SyntasticStatuslineFlag()}  " Syntastic syntax information
    set statusline+=%*                            " Reset colors
    set statusline+=%=%y[%{(&ff)}]                " File type and format
    set statusline+=[%{(&fenc==\"\"?&enc:&fenc)}] " File encoding
    set statusline+=%k\ %-14.(%l,%c%V%)\ %P       " File navigation
endif

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

" *** Mappings ***

" For when you forget to sudo, really Write the file.
cmap w!! w !sudo tee % >/dev/null

" *** Functions ***

" Highlight all instances of the word under the cursor, when idle.
" Map <F8> key to toggle Auto Highlighting.
nnoremap <f8> :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
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


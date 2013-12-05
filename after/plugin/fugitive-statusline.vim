
if has("statusline") && exists('*fugitive#statusline') 
    " git fugitive statusline
    "set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

    " useful git fugitive statusline
    set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%{\"[\".(&ff).\"]\ [\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P

    " show statusline always
    set laststatus=2

    " turn off ruler
    set noruler
endif


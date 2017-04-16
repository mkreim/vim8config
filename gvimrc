" Size of GVim window
if hostname() == 'kiwi'
    set lines=30 columns=100
    set gfn=DejaVu\ Sans\ Mono\ 12
elseif hostname() == 'mango'
    set lines=20 columns=85
    set gfn=DejaVu\ Sans\ Mono\ 10
elseif hostname() == 'feige' 
    set lines=55 columns=85
    set gfn=DejaVu\ Sans\ Mono\ 16
elseif hostname() == 'da-cons01'
    set lines=50 columns=110
    set gfn=DejaVu\ Sans\ Mono\ 14
elseif hostname() == 'da-cons-mobile02'
    set lines=60 columns=100
    set gfn=DejaVu\ Sans\ Mono\ 12
    syntax enable
    set background=dark
    colorscheme solarized
    winpos 900 0
else
    set lines=30 columns=100
    set gfn=DejaVu\ Sans\ Mono\ 12
endif

" Don't display the menu or toolbar. Just the screen.
"set guioptions-=m
set guioptions-=T

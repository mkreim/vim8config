" Size of GVim window
if hostname() == 'feige'
    set lines=55 columns=85
    set gfn=DejaVu\ Sans\ Mono\ 16
elseif hostname() == 'netsyno-mk'
    set lines=60 columns=100
    set gfn=DejaVu\ Sans\ Mono\ 13
    syntax enable
    set background=light
    colorscheme solarized
    " winpos 900 0
else
    set lines=30 columns=100
    set gfn=DejaVu\ Sans\ Mono\ 12
endif

" Don't display the menu or toolbar. Just the screen.
set guioptions-=m
set guioptions-=T

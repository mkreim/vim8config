" latex suite
    " REQUIRED. This makes vim invoke latex-suite when you open a tex file.
    filetype plugin on
    " IMPORTANT: grep will sometimes skip displaying the file name if you
    " search in a singe file. This will confuse latex-suite. Set your grep
    " program to alway generate a file-name.
    set grepprg=grep\ -nH\ $*
    " OPTIONAL: This enables automatic indentation as you type.
    filetype indent on
    set suffixesadd+=.tex
    let g:Tex_DefaultTargetFormat = 'pdf'
    let g:Tex_MultipleCompileFormats = 'pdf'
    let g:Tex_ViewRule_pdf = 'okular'

    " OPTIONAL: This enables automatic indentation as you type.
    filetype indent on

    " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
    " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
    " The following changes the default filetype back to 'tex':
    let g:tex_flavor='latex'

    " Making your own Macros via IMAP()
    " http://vim-latex.sourceforge.net/documentation/latex-suite.html#ls-new-macros
    " If you find the need to create your own macros, 
    " then you can use the IMAP() function provided with Latex-Suite. 
    " This will create a Latex-Suite-style mapping...
    " For maps which are triggered for a given filetype, the IMAP() command 
    " above should be put in the filetype plugin script for that file. For example, 
    " for tex-specific mappings, the IMAP() calls should go in $VIM/ftplugin/tex.vim.
    " For globally visible maps, you will need to use the following in either your ~/.vimrc
    " or a file in your $VIM/plugin directory.
    augroup MyIMAPs
    au!
    au VimEnter * call IMAP('EAL', "\\begin{align}\<CR>\\label{eq:<++>}\<CR><++>\<CR>\\end{align}<++>", 'tex')
    augroup END

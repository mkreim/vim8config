" options 
    syntax on
    set vb
    set backspace=2
    set ai
    set noexpandtab
    set nu
    set hls
    set nocp
    set nocompatible 
    set wildmode=list:longest
    runtime! ftplugin/man.vim
    set tabpagemax=20
    set guitablabel=%N/\ %t\ %M
    "Vim could start searching as and when you type the search phrase
    set incsearch
    "You can also tell Vim to ignore the case  
    set ignorecase
    " Automatically indent when adding a curly bracket, etc.
    "set smartindent
    " Tabs should be converted to a group of 4 spaces.
    " This is the official Python convention
    " (http://www.python.org/dev/peps/pep-0008/)
    " I didn't find a good reason to not use it everywhere.
    set shiftwidth=4
    set tabstop=4
    set expandtab ts=4 sw=4 ai
    autocmd FileType javascript set tabstop=2
    autocmd FileType javascript set shiftwidth=2
    autocmd FileType javascript set expandtab ts=2 sw=2 ai
    "set smarttab
    " Display incomplete commands.
    set showcmd
    " Show autocomplete menus.
    set wildmenu
    " Show editing mode
    set showmode
    autocmd FileType python runtime! autoload/pythoncomplete.vim
    " opens new splits below or on the right
    set splitbelow
    set splitright
    " Set working directory to the current file
    " http://vim.wikia.com/wiki/VimTip64
    set autochdir
    " if the above makes problems use:
    " autocmd BufEnter * lcd %:p:h
    set spelllang=en,de

    " add file suffixes to open files using gf, C-W gf, or C-W f
    set suffixesadd=.js,.jsx,.py,.md,.css

    " folding
    " mark folds with {{{N for N={1,2,3...} the foldlevel
    " or {{{ bla }}}
    " zj moves the cursor to the next fold.
    " zk moves the cursor to the previous fold.
    " zo opens a fold at the cursor.
    " zO opens all folds at the cursor.
    " zm increases the foldlevel by one.
    " zM closes all open folds.
    " zr decreases the foldlevel by one.
    " zR decreases the foldlevel to zero -- all folds will be open.
    " [z move to start of open fold.
    " ]z move to end of open fold.
    set foldmethod=marker

    " https://stackoverflow.com/questions/235439/vim-80-column-layout-concerns
    if exists('+colorcolumn')
        set colorcolumn=100
    endif

" key short cuts
    nmap - g<C-]>
    nmap _ <C-T>
    map <F2> :set spell!<CR><Bar>:echo "Spell check: " . strpart("OffOn", 3 * &spell, 3)<CR>
    imap <F2> <ESC>:set spell!<CR><Bar>:echo "Spell check: " . strpart("OffOn", 3 * &spell, 3)<CR>A
    " source ~/config/vim8config/SendToTmux/SendToTmux.vim
    " map <F12>  <ESC>:wa<CR>:call SendCMDToTmuxSession()<CR>
    "map <F11>  <ESC>:wa<CR>:call SendCurrentLineToTmuxSession()<CR>
    "map <F10>  <ESC>:wa<CR>:call SendCurrentLineToTmuxSession()<CR>
    " imap <F12>  <ESC>:wa<CR>:call SendCMDToTmuxSession()<CR>
    "imap <F11>  <ESC>:wa<CR>:call SendCurrentLineToTmuxSession()<CR>
    "imap <F10>  <ESC>:wa<CR>:call SendCurrentLineToTmuxSession()<CR>
    " map <F5> :wa<CR>:!reload-chrome.sh<CR>
    " imap <F5> <ESC>:wa<CR>:!reload-chrome.sh<CR>

    source ~/config/vim8config/MyCpp/MyCpp.vim
    "iab irev <C-R>=MyReviewComment()<CR>

    " C / C++ development
    map  <F8> <ESC>:TlistToggle<CR>
    imap <F8> <ESC>:TlistToggle<CR>
    " map  <F7> <ESC>:w<CR>:FSSplitAbove<CR>
    " imap <F7> <ESC>:w<CR>:FSSplitAbove<CR>
    "map  <F4> <ESC>:tabnew<CR>:Project<CR>
    "imap <F4> <ESC>:tabnew<CR>:Project<CR>
    
    map <F4> <ESC>:AsyncRun code %<CR>
    map <F3> <ESC>:AsyncRun git gui<CR>


" abbrevations
    iab idate <C-R>=strftime("%c")<CR>
    iab ToDo TODO
    iab todo TODO
    iab ibreak import ipdb; ipdb.set_trace()
    iab iprofile import cProfile; pr = cProfile.Profile(); pr.enable(); pr.disable(); pr.dump_stats('stats.prof');

" color scheme
    if has('gui_running')
        syntax enable
        set background=light
        colorscheme solarized
        let g:solarized_contrast  = "high"
        let g:solarized_visibility= "high"
        let g:solarized_hitrail   =   1
        let g:solarized_menu      =   0
    else
        "execute "source ~/.vim/plugin/color_sample_pack.vim"
        set t_Co=256
        colorscheme jellybeans
        highlight Pmenu guibg=darkblue gui=bold
    endif

" syntax highlighting for vmd, namd, gnuplot, ...
    au BufRead,BufNewFile *.vmd set filetype=tcl
    au BufRead,BufNewFile *.namd set filetype=tcl
    au BufRead,BufNewFile *.gplot set filetype=gnuplot
    au BufRead,BufNewFile *.plt set filetype=gnuplot
    au BufRead,BufNewFile *.gnuplot set filetype=gnuplot
    au BufRead,BufNewFile *.vmdpy set filetype=python
    au BufRead,BufNewFile *.mma set filetype=mma
    au BufRead,BufNewFile *.inp set filetype=fortran
    au BufRead,BufNewFile *.gitCOMMIT_EDITMSG set filetype=gitcommit

" programming comments
    map <c-y> <plug>NERDCommenterToggle


" NERDCommenter config
    let g:NERDSpaceDelims=1
    let g:NERDRemoveExtraSpaces=1

" Integration of the mlint Matlab code checker with the :make command 
" http://www.vim.org/scripts/script.php?script_id=2407
"   autocmd BufEnter *.m    compiler mlint
" and also for python
"   autocmd BufNewFile,BufRead *.py compiler pep8

" deutsche Umlaute automatisch beim Schreiben von html,htm,inc oder php Dateien ersetzten
"   autocmd BufWrite *.[Hh][Tt][Mm][Ll],*.[hH][tT][mM],*.[pP][hH][pP],*.[iI][nN][cC] silent %s/ö/\&ouml;/g
"   autocmd BufWrite *.[Hh][Tt][Mm][Ll],*.[hH][tT][mM],*.[pP][hH][pP],*.[iI][nN][cC] silent %s/Ö/\&Ouml;/g
"   autocmd BufWrite *.[Hh][Tt][Mm][Ll],*.[hH][tT][mM],*.[pP][hH][pP],*.[iI][nN][cC] silent %s/ü/\&uuml;/g
"   autocmd BufWrite *.[Hh][Tt][Mm][Ll],*.[hH][tT][mM],*.[pP][hH][pP],*.[iI][nN][cC] silent %s/Ü/\&Uuml;/g
"   autocmd BufWrite *.[Hh][Tt][Mm][Ll],*.[hH][tT][mM],*.[pP][hH][pP],*.[iI][nN][cC] silent %s/ä/\&auml;/g
"   autocmd BufWrite *.[Hh][Tt][Mm][Ll],*.[hH][tT][mM],*.[pP][hH][pP],*.[iI][nN][cC] silent %s/Ä/\&Auml;/g
"   autocmd BufWrite *.[Hh][Tt][Mm][Ll],*.[hH][tT][mM],*.[pP][hH][pP],*.[iI][nN][cC] silent %s/ß/\&szlig;/g

" VimWiki
    "autocmd BufWritePost *.wiki silent VimwikiAll2HTML "gen HTML when saving
    let g:vimwiki_list = [{'path': '~/config/vim8config/VimWiki/vimwiki/', 'path_html': '~/config/vim8config/VimWiki/vimwiki_html/'}, {'path': '~/todo/wiki/', 'path_html': '~/todo/html/'}]
    map <leader>to 2<leader>wt
    map <leader>di 2<leader>w<leader>w

" highlight lines in matlab scripts that exceed 75 columns
" http://vim.wikia.com/wiki/Highlight_long_lines
    au BufWinEnter *.m let w:m1=matchadd('Search', '\%<76v.\%>75v', -1)
    au BufWinEnter *.m let w:m2=matchadd('ErrorMsg', '\%>75v.\+', -1)

"statuszeile
    set laststatus=2
    set statusline=
    set statusline+=%-3.3n\                      " buffer nummer
    set statusline+=%f\                          " dateiname
    set statusline+=%h%m%r%w                     " status flags
    set statusline+=\[%{strlen(&ft)?&ft:'none'}] " dateityp
    set statusline+=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\"} " fileencoding
    set statusline+=\[%{fugitive#statusline()}]  " git branch
    set statusline+=%=                           " folgendes rechts
    set statusline+=0x%-8B                       " hex-wert des zeichens
    set statusline+=%-14(%l,%c%V%)               " zeile, zeichen
    set statusline+=%<%P                         " datei position
    " from: http://vim.wikia.com/wiki/VimTip1287
    " Change statusline color to show insert or normal mode\
    " If you want a different color based on the kind of insert mode you are
    " in (i.e. insert, replace, or virtual insert), then you can use the
    " v:insertmode variable during the InsertEnter event execution to do
    " something different in each mode. For example: 
    function! InsertStatuslineColor(mode)
        if a:mode == 'i'
            hi statusline guibg=darkgreen
        elseif a:mode == 'r'
            hi statusline guibg=blue
        else
            hi statusline guibg=red
        endif
    endfunction
    au InsertEnter * call InsertStatuslineColor(v:insertmode)
    au InsertLeave * hi statusline guibg=green
    " default the statusline to green when entering Vim
    hi statusline guibg=green

" Display shell commands' output on Vim window
" from: http://vim.wikia.com/wiki/Display_shell_commands'_output_on_Vim_window
" The :! command is useful for running shell commands from Vim. It has one possible drawback: 
" the command output is not displayed in a Vim window, so it can't be accessed with Vim's powerful 
" editing tools. This is easy to fix with :read !command which inserts the output to the current window.
" A possibly more sophisticated solution is to make a new Vim command which opens a scratch buffer for 
" the output of shell command.
" The new :Shell command works just like :! except that it opens a Vim scratch buffer and prints 
" the command output there. The scratch buffer will be wiped out completely when it's closed. 
" An example of usage: 
" :Shell ls -la
" The idea can be extended by adding shortcut commands for commonly used shell commands.
" Now the version control tools can be used like this from Vim: 
" :Git add %                (The "%" expands to the current filename)
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)

function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction

command! -complete=file -nargs=* Git call s:RunShellCommand('git '.<q-args>)
" END OF Display shell commands' output on Vim window

" taglist.vim : Source code browser (supports C/C++, java, perl, python, tcl, sql, php, etc) 
" from: http://www.vim.org/scripts/script.php?script_id=273
" The "Tag List" plugin is a source code browser plugin for Vim and 
" provides an overview of the structure of source code files and allows 
" you to efficiently browse through source code files for different 
" programming languages. For more information about using this plugin, after installing the 
" taglist plugin, use the ":help taglist" command.
let Tlist_Ctags_Cmd ='/usr/bin/ctags'
let Tlist_Use_Right_Window = 0
" END OF taglist.vim

" OmniCppComplete : C/C++ omni-completion with ctags database 
" from: http://www.vim.org/scripts/script.php?script_id=1520
" This script is for vim 7.0 or higher it provides an omnifunc cppcomplete function. 
" You can use the omni completion (intellisense) in C and C++ files. 
" This is a full vim script and you only need a ctags database. 
"     -   Complete namespaces, classes, structs and union members. 
"     -   Complete inherited members for classes and structs (single and multiple inheritance). 
"     -   Complete attribute members eg: myObject->_child->_child etc... 
"     -   Complete type returned by a function eg: myObject->get()->_child. 
"     -   Complete the "this" pointer. 
"     -   Complete a typedef. 
"     -   Complete the current scope (global and class scope). 
"     -   Complete an object after a cast (C and C++ cast). 
"     -   Complete anonymous types (eg: struct {int a; int b;}g_Var; g_Var.???). It also works for a typedef of an anonymous type
let OmniCpp_NamespaceSearch     = 1
let OmniCpp_GlobalScopeSearch   = 1
let OmniCpp_ShowAccess          = 1
let OmniCpp_DisplayMode         = 0
let OmniCpp_ShowScopeInAbbr     = 0
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot      = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow    = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope    = 1 " autocomplete after ::
let OmniCpp_SelectFirstItem     = 0
let OmniCpp_DefaultNamespaces   = ["std", "_GLIBCXX_STD", "cv", "pheno"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
" configure tags - add additional tags here or comment out not-used ones
set tags+=/home/mkreim/bin/opencv/opencv.tags
set tags+=/home/mkreim/PhenoScreen/ps.tags
" END OF OmniCppComplete

" Get help on Python libraries
" http://vim.wikia.com/wiki/VimTip867
" This snippet allows you to run :Pyhelp <module> to preview 
" pydoc documentation in the preview window. 
" It requires pydoc.py, which comes with most Python installations. 
" If Vim is compiled with +python, it automatically finds the path
" to pydoc.py. Otherwise, set the g:pydoc_path variable to a suitable value. 
if has("python")
" let python figure out the path to pydoc
python << EOF
import sys
import vim
vim.command("let g:pydoc_path=\'/usr/lib/python2.7/pydoc.py\'")
EOF
else
  " manually set the path to pydoc
  let g:pydoc_path = "/usr/lib/python2.7/pydoc.py"
endif
command! -nargs=1 Pyhelp :call ShowPydoc(<f-args>)
function! ShowPydoc(module)
  " compose a tempfile path using the module name
  let path = $TEMP . '/' . a:module . '.pydoc'
  " run pydoc on the module, and redirect the output to the tempfile
  call system(shellescape(g:pydoc_path . " " . a:module . " > " . path))
  " open the tempfile in the preview window
  execute ":pedit " . path
endfunction
" END OF Get help on Python libraries

" pydiction : Tab-complete your Python code
" http://www.vim.org/scripts/script.php?script_id=850
let g:pydiction_location = '~/.vim/after/ftplugin/complete-dict' 
let g:pydiction_menu_height = 15
" END OF pydiction

" Use eval to create dynamic templates
" http://vim.wikia.com/wiki/VimTip1567
" There are many ways to start with a simple skeleton whenever you create a file of a given type. 
" One of the easiest methods is given in the Vim help at :help skeleton. This method, although simple, 
" suffers from one major weakness: the resulting file skeleton is completely defined by the static text in the template file.  
" Using the eval() function, you can easily evaluate an expression obtained from the template file itself in order to provide 
" dynamic content limited only by Vim's expression syntax and parsing.
augroup templates
  au!
  " read in template files
  autocmd BufNewFile *.* silent! execute '0r ~/config/vimconfig/skeleton/skeleton.'.expand("<afile>:e")
  " parse special text in the templates after the read
  autocmd BufNewFile * %substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge
augroup END
" END of Use eval to create dynamic templates

" Remap join to merge comment lines
" http://vim.wikia.com/wiki/VimTip1553
    function! JoinWithLeader(count, leaderText)
      let l:linecount = a:count
      " default number of lines to join is 2
      if l:linecount < 2
        let l:linecount = 2
      endif
      echo l:linecount . " lines joined"
      " clear errmsg so we can determine if the search fails
      let v:errmsg = ''

      " save off the search register to restore it later because we will clobber
      " it with a substitute command
      let l:savsearch = @/

      while l:linecount > 1
        " do a J for each line (no mappings)
        normal! J
        " remove the comment leader from the current cursor position
        silent! execute 'substitute/\%#\s*\%('.a:leaderText.'\)\s*/ /'
        " check v:errmsg for status of the substitute command
        if v:errmsg=~'Pattern not found'
          " just means the line wasn't a comment - do nothing
        elseif v:errmsg!=''
          echo "Problem with leader pattern for JoinWithLeader()!"
        else
          " a successful substitute will move the cursor to line beginning,
          " so move it back
          normal! ``
        endif
        let l:linecount = l:linecount - 1
      endwhile
      " restore the @/ register
      let @/ = l:savsearch
    endfunction

    " Eliminate comment leader when joining comment lines
    function! MapJoinWithLeaders(leaderText)
      let l:leaderText = escape(a:leaderText, '/')
      " visual mode is easy - just remove comment leaders from beginning of lines
      " before using J normally
      exec "vnoremap <silent> <buffer> J :<C-U>let savsearch=@/<Bar>'<+1,'>".
            \'s/^\s*\%('.
            \l:leaderText.
            \'\)\s*/<Space>/e<Bar>'.
            \'let @/=savsearch<Bar>unlet savsearch<CR>'.
            \'gvJ'
      " normal mode is harder because of the optional count - must use a function
      exec "nnoremap <silent> <buffer> J :<C-U>call JoinWithLeader(v:count, '".l:leaderText."')<CR>"
    endfunction

    au BufWinEnter *.m call MapJoinWithLeaders('%')
" END OF Remap join to merge comment lines

" Vim 7: Turning completion on 
" Omni completion isn't automatically turned on for Vim 7, and it's super useful if you code in CSS or HTML. 
" You complete things with CTRL-X O.
" http://amix.dk/blog/viewEntry/19021
    autocmd FileType python     set omnifunc=pythoncomplete#Complete
    autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml        set omnifunc=xmlcomplete#CompleteTags
    autocmd FileType php        set omnifunc=phpcomplete#CompletePHP
    autocmd FileType c          set omnifunc=ccomplete#Complete
" END OF Vim 7: Turning completion on 

" Vim FTP Options
let g:netrw_ftp_cmd = "ftp -z nossl"

" Task lists
" Another really useful thing is to mark some of your code as TODO or FIXME! 
" I know we all like to think we write perfect code, but sometimes you just 
" have to settle and leave a note for yourself to come back later. One of the 
" plugins we included was the tasklist plugin that will allow us to search all 
" open buffers for things to fix. Just add a mapping to open it in ~/.vimrc:
" Now you can hit <leader>td to open your task list and hit 'q' to close it. 
" You can also hit enter on the task to jump to the buffer and line that it 
" is placed on.
map <leader>td <Plug>TaskList

" Tipps from Turning Vim into a modern Python IDE
" by sontek (John Anderson)
" http://meineartikel.labs.nzz.ch/user/aengus/id/1qxbh
" http://sontek.net/turning-vim-into-a-modern-python-ide#id21
let g:pyflakes_use_quickfix = 0
let g:pep8_map='<leader>8'
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
map <leader>n :NERDTreeTabsToggle<CR>
map <F10>  :NERDTreeTabsToggle<CR>
imap <F10> <Esc>:NERDTreeTabsToggle<CR>
" I also included the py.test vim plugin for those who prefer it. 
" This plugin has a lot more functionality including executing 
" individual tests by class, file, or method. You can also cycle
" through the individual assertion errors.
" Execute the tests
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
" cycle through test errors
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>

" vim-online-thesaurus
let g:online_thesaurus_map_keys = 0
noremap <Leader>T :OnlineThesaurusLookup<CR>

" tagbar
" http://majutsushi.github.io/tagbar/
" https://github.com/majutsushi/tagbar
nmap <F9> :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_width = 50
let g:tagbar_compact = 0

" compiling using make
" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
"
" Note: Must allow nesting of autocmds to enable any customizations for quickfix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

:map <Leader>c :make<CR>

" C++ stuff
" http://www.alexeyshmalko.com/2014/using-vim-as-c-cpp-ide/
set exrc
set secure

" yapf support
autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr><C-o>
autocmd BufWritePre *.py 0,$!yapf

" prettier
" max line length that prettier will wrap on
let g:prettier#config#print_width = 100
" single quotes over double quotes
let g:prettier#config#single_quote = 'true'
" none|es5|all
let g:prettier#config#trailing_comma = 'es5'
" tabs 2 spaces
let g:prettier#config#tab_with = 2
let g:prettier#config#use_tabs = 'false'
let g:prettier#autoformat = 0
let g:prettier#exec_cmd_async = 0
let g:prettier#quickfix_enabled = 0
autocmd BufWritePre,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql Prettier

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
filetype plugin indent on
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-g>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsSnippetsDir="/home/mkreim/config/vim8config/vim/UltiSnips/"


" ale
"let g:ale_lint_on_text_changed="never"
"let g:ale_lint_on_enter=0
"let g:ale_lint_on_save=0
"let g:ale_lint_on_filetype_changed=0
"let g:ale_lint_on_insert_leave=0
" let g:ale_python_yapf_use_global=0
" let g:ale_python_yapf_executable="yapf"
let g:ale_linters = {'python': ['flake8']}


" completor
let g:completor_python_binary = '/home/mkreim/.virtualenvs/vim-tools/bin/python'
let g:completor_node_binary = '/home/mkreim/.nvm/versions/node/v8.11.1/bin/node'
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

" previm
let g:previm_open_cmd = 'google-chrome --new-window'
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END


" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
" --- EOF ---

" =========================================================================
"       Filename:  SendToTmux.vim 
"    Description:  Creates a tmux session for the actual working dir if
"                  non is available and sends useful commands (depending
"                  on the file type) to this session. The behaviour depends
"                  on the file type:
"                  tex   : make
"                  cpp   : make
"                  matlab: nothing yet
"                  python: nothing yet
"        Created:  Mon Mar 12 10:17:56 2012
"         Author:  (2012), Michael Kreim
"                  http://www.perfect-kreim.de/ michael@perfect-kreim.de
" =========================================================================

function SendCMDToTmuxSession()
python << EOF
import sys
import os
SendToTmuxPath = os.path.expanduser('~') + '/config/vim8config/SendToTmux/'
sys.path.append(SendToTmuxPath)
from VimTmuxFunctions import *

filetype    = GetCurrentFiletype()
if filetype == 'tex':
    workdir = os.getcwd()
    while True:
        if os.path.isfile('Makefile'):
            SessionName = CreateGetTmuxSession()
            TmuxSendCommand(SessionName, "make")
            break
        else:
            os.chdir('../')
        if os.getcwd() == '/':
            print('Did not find a Makefile...')
            break
    os.chdir(workdir)
elif filetype == 'cpp':
    SessionName = CreateGetTmuxSession()
    TmuxSendCommand(SessionName, "make")
elif filetype == 'm':
    SessionName = CreateGetTmuxSession('matlab -nodesktop')
    TmuxSendCommand(SessionName, "clear all hidden force; clc; " + GetCurrentFilename())
else:
    print "No action for this filetype configured yet"
EOF
endfunction

function SendCurrentLineToTmuxSession()
python << EOF
import vim
import sys
import os
SendToTmuxPath = os.path.expanduser('~') + '/config/vimconfig/SendToTmux/'
sys.path.append(SendToTmuxPath)
from VimTmuxFunctions import *

filetype    = GetCurrentFiletype()
if filetype == 'm':
    SessionName = CreateGetTmuxSession('matlab -nodesktop')
    TmuxSendCommand(SessionName, vim.current.line)
elif filetype == 'cpp':
    SessionName = CreateGetTmuxSession()
    TmuxSendCommand(SessionName, vim.eval("g:cppbinary"))
else:
    print "No action for this filetype configured yet"
EOF
endfunction

" --- EOF -----------------------------------------------------------------

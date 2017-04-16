#!/usr/bin/python
# =========================================================================
"""
*       Filename:  VimTmuxFunctions.py 
*    Description:  functions needed by SendToTmux.vim
*        Created:  Mon Apr 30 08:56:18 2012
*         Author:  (2012), Michael Kreim
*                  http://www.perfect-kreim.de/ michael@perfect-kreim.de"""
# =========================================================================
def CreateGetTmuxSession(cmd = ''):
    import os 
    import subprocess
    # Create the Name of the Session
    SessionName = os.getcwd() 
    for l in ['/', '\\', ':', ' ']:
        SessionName = SessionName.replace(l, '_')

    # Check if the session already exists
    tmuxHasSession = "tmux has-session -t " + SessionName 
    if subprocess.call(tmuxHasSession, shell=True):
        # session does NOT exist
        tmuxNewSession = "tmux new-session -d -n VimCalls -s " + SessionName + " '" + cmd + "'"
        subprocess.call(tmuxNewSession, shell=True)
    return SessionName

def TmuxSendCommand(SessionName, cmd):
    import subprocess
    tmuxCMD = "tmux send-keys -t " + SessionName + ":VimCalls.0 \"" + cmd + "\" C-m"
    subprocess.call(tmuxCMD, shell=True)

def GetCurrentFiletype():
    import vim
    fn = vim.current.buffer.name
    pi = fn.rfind('.') + 1
    return fn[pi:]

def GetCurrentFilename():
    import vim
    fn = vim.current.buffer.name
    p1 = fn.rfind('/')+1
    p2 = fn.rfind('.')
    return fn[p1:p2]
# --- EOF -----------------------------------------------------------------

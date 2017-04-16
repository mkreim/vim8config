#!/bin/bash
# =============================================================================
#       Filename:  SetSoftLinks.sh 
#    Description:  Sets the soft links for the vim configuration
#        Created:  Sun Jul 29 13:47:43 2012
#         Author:  (2012), Michael Kreim
#                  http://www.perfect-kreim.de/ michael@perfect-kreim.de
# =============================================================================
    ln -f -s ~/config/vimconfig/gvimrc  ~/.gvimrc
    ln -f -s ~/config/vimconfig/vim/    ~/.vim      
    ln -f -s ~/config/vimconfig/vimrc   ~/.vimrc
    ln -f -s ~/config/vimconfig/viminfo ~/.viminfo
# --- EOF ---------------------------------------------------------------------

#!/usr/bin/env python
# =========================================================================
"""
*       Filename:  [:VIM_EVAL:]expand("%:t")[:END_EVAL:]
*    Description:
*        Created:  [:VIM_EVAL:]strftime("%c")[:END_EVAL:]
*         Author:  ([:VIM_EVAL:]strftime('%Y')[:END_EVAL:]), Dr. Michael Kreim
*        Company:  NETSYNO Software GmbH https://www.netsyno.com"""
# =========================================================================
# Imports -{{{-------------------------------------------------------------
import traceback
import pdb
import sys

#-}}}----------------------------------------------------------------------


# Helping functions -{{{---------------------------------------------------
def usage():
    print __doc__


#-}}}----------------------------------------------------------------------


# Main -{{{----------------------------------------------------------------
def main():
    # some WIP code that maybe raises an exception
    raise BaseException("oh no, exception!")
    return 0


#-}}}----------------------------------------------------------------------

if __name__ == "__main__":
    try:
        ret = main()
    except:
        traceback.print_exc()
        pdb.post_mortem()
    sys.exit(ret)
# --- EOF -----------------------------------------------------------------

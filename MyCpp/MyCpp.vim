" =========================================================================
"       Filename:  MyComment.vim 
"    Description:  
"        Created:  Tue Oct 20 12:24:26 2015
"         Author:  (2015), Michael Kreim http://www.perfect-kreim.de/
" =========================================================================
function MyReviewComment()
python << EOF
import datetime

def GetCurrentFiletype():
    import vim
    fn = vim.current.buffer.name
    pi = fn.rfind('.') + 1
    return fn[pi:]

filetype = GetCurrentFiletype()
today    = datetime.date.isoformat(datetime.date.today())

if filetype == 'python':
    CommentSign = '#'
elif filetype == 'cpp':
    CommentSign = '//'
elif filetype == 'sh':
    CommentSign = '#'
elif filetype == 'vim':
    CommentSign = '"'
else:
    CommentSign = '#'

message = "return \"" + CommentSign + " TODO rev_" + today + "_mkreim: \"" 

#"b = vim.current.buffer
#"b.append(message)
#vim.command("let g:return="+str(message))

vim.command(message)
EOF
endfunction

function MyGenerateClassWithGetAndSet()
python << EOF
import vim

def GetCurrentFiletype():
    import vim
    fn = vim.current.buffer.name
    pi = fn.rfind('.') + 1
    return fn[pi:]

filetype = GetCurrentFiletype()

if filetype == 'cpp' or filetype == 'h':
    b = vim.current.buffer

    (startRow, startCol) = b.mark('<')  # start selection tuple
    (endRow, endCol) = b.mark('>')  # end selection tuple

    sel = []
    for i in range(startRow-1,endRow):
        sel.append(b[i])

    output = ["\tpublic:",]

    for l in sel:
        var = l.split(" ")[-1][:-1]
        decList = l.split(" ")[:-1]
        dec = ""
        for d in decList:
            if d == '':
                pass
            else:
                dec += d + " "
        
        getter = "\t\tconst " + dec + " & Get" + var[1:] + "() const {return " + var + ";}"
        setter = "\t\tvoid Set" + var[1:] + "(const " + dec + " & value){" + var + " = value;}"

        output.append(getter)
        output.append(setter)
        output.append("")

    output.append("\tprivate:")

    b.append(output, startRow-1)
else:
    print "No action for this filetype configured yet"
EOF
endfunction
" --- EOF -----------------------------------------------------------------

let g:plugin_path = expand("<sfile>:p:h")

function! OpenPage(pageName)

python3 << EOF

import vim
import os
import sys

plugin_path = vim.eval("g:plugin_path")

python_module_path = os.path.abspath("%s/../lib/"%plugin_path)

sys.path.append(python_module_path)

from vimpad import vimpad

page = vimpad.DontpadControl("pupo")
page.openPage()

EOF
endfunction

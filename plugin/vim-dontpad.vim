let g:plugin_path = expand("<sfile>:p:h")

function! OpenDontpad(pageName)

python3 << EOF

import vim
import os
import sys

plugin_path = vim.eval("g:plugin_path")

python_module_path = os.path.abspath("%s/../lib/"%plugin_path)

sys.path.append(python_module_path)

from vimpad import vimpad


pageName = vim.eval("a:pageName")
page = vimpad.DontpadControl(pageName)
vim.command(f"let sPage = '{pageName}'")
page.openPage()

EOF
endfunction

function! SaveDontpad()

python3 << EOF

import vim
import os
import sys

plugin_path = vim.eval("g:plugin_path")

python_module_path = os.path.abspath("%s/../lib/"%plugin_path)

sys.path.append(python_module_path)

from vimpad import vimpad

pageName = vim.eval("expand('%:t')")[1:-12]
page = vimpad.DontpadControl(pageName)
page.savePage()

EOF
endfunction

function! RefreshDontpad()
python3 << EOF

import vim
import os
import sys

plugin_path = vim.eval("g:plugin_path")

python_module_path = os.path.abspath("%s/../lib/"%plugin_path)

sys.path.append(python_module_path)

from vimpad import vimpad

pageName = vim.eval("expand('%:t')")[1:-12]
page = vimpad.DontpadControl(pageName)
page.refreshPage()

EOF

endfunction
function! ExitDontpad()
python3 << EOF

import vim
import os
import sys

plugin_path = vim.eval("g:plugin_path")

python_module_path = os.path.abspath("%s/../lib/"%plugin_path)

sys.path.append(python_module_path)

from vimpad import vimpad

pageName = vim.eval("expand('%:t')")[1:-12]
page = vimpad.DontpadControl(pageName)
page.exit()

EOF

endfunction

autocmd BufWrite .*.dontpad.tmp :call SaveDontpad()
autocmd BufLeave .*.dontpad.tmp :call SaveDontpad()
autocmd BufWinLeave .*.dontpad.tmp :call ExitDontpad()
autocmd BufUnload .*.dontpad.tmp :call RefreshDontpad()

" searchit.vim - search target in browser
"
" Copyright July 2020 by latavin243 <arvin.qguo@outlook.com>
"
" Distributed under the terms of the Vim license.  See ":help license".
"
" Usage:
"
" :Searchit [search_engine] [someinfo]
"

command! -nargs=+ Searchit :call Searchit(<f-args>)

function! Searchit(engine, keyword)
python3 << endOfPython

import vim
a_engine = vim.eval("a:engine")
a_keyword = vim.eval("a:keyword")
print(f"search engine `{a_engine}` is used to search keyword `{a_keyword}`")

engine_dict = {
    "google": "https://www.google.com/search?q={query}",
    "stackoverflow": "https://stackoverflow.com/search?q={query}",
    "baidu": "https://www.baidu.com/s?wd={query}",
    "bing": "https://bing.com/search?q={query}",
}
url = engine_dict[a_engine].format(query=a_keyword)

# TODO currently windows not supported
if vim.eval("has('macunix')") or vim.eval("has('mac')"):
    vim.command(f'silent! !open "{url}"')
else:
    vim.command(f'silent! !xdg-open "{url}" &> /dev/null &')

endOfPython
endfunction


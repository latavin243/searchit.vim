" searchit.vim - search target in browser
"
" Copyright July 2020 by latavin243 <arvin.qguo@outlook.com>
"
" Distributed under the terms of the Vim license.  See ":help license".
"
" Usage:
"
" :Searchit [search_engine] [someinfo]

command! -nargs=+ Searchit :call Searchit(<f-args>)

function! Searchit(engine, keyword)
if has('mac') || has('macunix')
    let l:open_url_command = 'silent! !open "{url}"'
elseif has('win16') || has('win32') || has('win64')
    let l:open_url_command = '!start cmd /cstart /b {url}'
else " xdg-open for Linux
    let l:open_url_command = 'silent! !xdg-open "{url}" &> /dev/null &'
endif

python3 << endOfPython

import vim
a_engine = vim.eval('a:engine')
a_keyword = vim.eval('a:keyword')
l_open_url_command = vim.eval('l:open_url_command')
print(f'search engine `{a_engine}` is used to search keyword `{a_keyword}`')

engine_dict = {
    'google': 'https://www.google.com/search?q={query}',
    'stackoverflow': 'https://stackoverflow.com/search?q={query}',
    'bing': 'https://bing.com/search?q={query}',
    'github': 'https://github.com/search?q={query}',
    'go': 'http://golang.org/search?q={query}',
    'py3': 'https://docs.python.org/3/search.html?q={query}',
    'cpp': 'https://www.cplusplus.com/search.do?q={query}',
    'youtube': 'https://www.youtube.com/results?search_query={query}',
    'amazon': 'https://www.amazon.com/s?k={query}',
    'wiki': 'https://en.wikipedia.org/wiki/{query}',

    'baidu': 'https://www.baidu.com/s?wd={query}',
    'taobao': 'https://s.taobao.com/search?q={query}',
    'douban': 'https://www.douban.com/search?q={query}',
    'bilibili': 'http://www.bilibili.com/search?keyword={query}',
    'zhihu': 'https://www.zhihu.com/search?type=content&q={query}',
}
url = engine_dict[a_engine].format(query=a_keyword)
print(f'opening `{url}`')
vim.command(l_open_url_command.format(url=url))

endOfPython
endfunction

